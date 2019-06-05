#!/bin/bash

function export_as_pdf() {
    local file="${1}"
    xvfb-run scribus-trunk \
        --no-gui \
        --no-splash \
        --python-script "${PWD}/build.py" "${file}" \
        -- \
        "${file}"
}

for file in ${PWD}/src/downstream/documents/*.sla; do
    export_as_pdf "${file}"
    mv "${file}.pdf" "${PWD}/public/"
done

cat >public/index.html <<EOF
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RvWG Abizeitung CI/CD PDFs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <style>
body {
  background-image: url(https://source.unsplash.com/random?tropical) !important;
  background-position: center center !important;
  background-attachment: fixed !important;
  background-repeat: no-repeat !important;
  background-size: cover !important;
  backdrop-filter: blur(5px) !important;
}

body > * {
  background: linear-gradient(0deg, transparent 33%, rgba(255, 255, 255, 0.9));
}
    </style>
    <div>
    <div class="container pt-3 pb-3">
    <h1 class="mb-3">RvWG Abizeitung CI/CD PDFs</h1>
    <p>
        Unter <a href="https://gitlab.com/pojntfx/abizeitung" target="_blank">gitlab.com/pojntfx/abizeitung</a> findet sich der Quellcode. Dies ist freie Software und freie Kultur, jeder darf gerne mitarbeiten!
    </p>
    <div class="alert alert-danger">
        <strong>Achtung!</strong> Dies sind <em>automatisiert kompilierte, ungeprüfte</em> "Nightly"-Versionen aus dem CI/CD-System.
    </div>
EOF

cat >>public/index.html <<EOF
    <div class='card mt-3'><div class='card-body'><h5 class='card-title'>Momentaner Status</h5>
        <p class='card-text'><a href="https://gitlab.com/pojntfx/abizeitung/commits/master"><img alt="pipeline status" src="https://gitlab.com/pojntfx/abizeitung/badges/master/pipeline.svg" /></a><pre><code>$(git log -1)</code></pre></p>
    </div></div>
    <div class='card mt-3'><div class='card-body'><h5 class='card-title'>Kompilierte PDFs</h5><div class="list-group">    
EOF

for file in public/*.pdf; do
    echo "<a href='${file#"public/"}' class='list-group-item list-group-item-action'>${file#"public/"}</a>" >>public/index.html
done

cat >>public/index.html <<EOF
    </div>
    </div></div>
EOF

echo "<div class='card mt-3'><div class='card-body'><h5 class='card-title'>Letzte Änderung</h5><p class='card-text'><pre class='pre-scrollable'><code>$(git diff --exit-code | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')</code></pre></p></div></div>" >>public/index.html

cat >>public/index.html <<EOF
    </div>
    </div>
</body>

</html>
EOF
