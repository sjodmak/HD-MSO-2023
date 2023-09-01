rem: temporarily change directory to where this file is
pushd "%~dp0"

rem: find name of current directory
call set PARENT_DIR=%CD%
set PARENT_DIR=%PARENT_DIR:\= %
set LAST_WORD=
for %%i in (%PARENT_DIR%) do set LAST_WORD=%%i

rem: do a recursive search for aif file paths, and write them to text file named after current directory
dir *.wav /s/b/a-d | findstr /v "\$" | sort > %LAST_WORD%.listfile.txt

rem: return to original directory
popd
