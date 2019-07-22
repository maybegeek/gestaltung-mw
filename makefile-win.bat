SETLOCAL
SET "sourcedir=%cd%"
PUSHD "%sourcedir%"
FOR /f "delims=" %%a IN (
 'dir /b /s /a-d *mwmd.md '
 ) DO (
pandoc "%%a" -f markdown --pdf-engine=xelatex --template=layout/mwmd.tex layout/mwmd.yaml -o "%%~dpna.pdf"
)
popd
GOTO :EOF
