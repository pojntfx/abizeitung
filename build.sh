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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>

<body>
    <h1>RvWG Abizeitung CI/CD PDFs</h1>
    <p>
        <strong style="color: red">Achtung!</strong> Dies sind <em>automatisiert kompilierte, ungeprüfte</em> "Nightly"-Versionen aus dem CI/CD-System.
    </p>
    <p>
        Momentaner Status: <a href="https://gitlab.com/pojntfx/abizeitung/commits/master"><img alt="pipeline status" src="https://gitlab.com/pojntfx/abizeitung/badges/master/pipeline.svg" /></a>
    </p>
    <p>
        Unter <a href="https://gitlab.com/pojntfx/abizeitung" target="_blank">gitlab.com/pojntfx/abizeitung</a> findet sich der Quellcode. Dies ist freie Software und freie Kultur, jeder darf gerne mitarbeiten!
    </p>
    <ul style="overflow-x: auto;">
EOF

for file in public/*.pdf; do
    echo "<li><a href='${file#"public/"}'>${file#"public/"}</a></li>" >>public/index.html
done

cat >>public/index.html <<EOF
    </ul>
</body>

</html>
EOF
