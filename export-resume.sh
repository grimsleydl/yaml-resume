#!/bin/bash
yaml2json resumes/"${1}" -p -s
# mv $(basename "${1%.*}").json resume.json
mv ./resumes/$(basename "${1%.*}").json ./
resume export resumes/$(basename "${1%.*}").html --force --theme "${2}"
mv $(basename "${1%.*}").json resumes/
sed -i -e 's/ - / –/g' resumes/$(basename "${1%.*}").html
sed -i -e 's/ till / – /g' resumes/$(basename "${1%.*}").html
sed -i -e 's/list-style: square;/list-style: disc;/g' resumes/$(basename "${1%.*}").html
sed -i -e 's/<h2>Highlights/<h2>Skills/g' resumes/$(basename "${1%.*}").html

html-pdf "resumes/$(basename "${1%.*}").html" "resumes/$(basename "${1%.*}").pdf" \
    --format=Letter
#     --border=.5in \
#     --border.left=1in --border.right=1in --border.top=1in --border.bottom=1in --header.height=0 footer.height=0
