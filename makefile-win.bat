SETLOCAL
SET "sourcedir=%cd%"
PUSHD "%sourcedir%"
FOR /f "delims=" %%a IN (
 'dir /b /s /a-d *mw-gestaltungsrichtlinien.md '
 ) DO (
pandoc "%%a" --from=markdown --pdf-engine=xelatex --template=layout/mw-gestaltungsrichtlinien.tex layout/mw-gestaltungsrichtlinien.yaml -o "%%~dpna.pdf"
)
popd
GOTO :EOF
