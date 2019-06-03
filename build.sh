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
        mv "${file}.pdf" "${PWD}/dist/"
done

cat >dist/index.html <<EOF
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RvWG Abizeitung CI/CD PDFs</title>
</head>

<body>
    <h1>RvWG Abizeitung CI/CD PDFs</h1>
    <ul style="overflow-x: auto;">
EOF

for file in dist/*.pdf; do
        echo "<li><a href='${file#"dist/"}'>${file#"dist/"}</a></li>" >>dist/index.html
done

cat >>dist/index.html <<EOF
    </ul>
</body>

</html>
EOF
