@ECHO OFF

SET DIFF3=C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe

:: Subversion provides the paths we need as the last three parameters.
:: These are parameters 9, 10, and 11.  But we have access to only
:: nine parameters at a time, so we shift our nine-parameter window
:: twice to let us get to what we need.
SHIFT
SHIFT
SET MINE=%7
SET OLDER=%8
SET YOURS=%9

"%DIFF3%" --older %OLDER% --mine %MINE% --yours %YOURS%

:: After performing the merge, this script needs to print the contents
:: of the merged file to stdout.  Do that in whatever way you see fit.
:: Return an errorcode of 0 on successful merge, 1 if unresolved conflicts
:: ::ain in the result.  Any other errorcode will be treated as fatal.
