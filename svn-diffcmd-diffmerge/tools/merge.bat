@ECHO OFF

SET MERGE=C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe

SET BASE=%1
SET THEIRS=%2
SET MINE=%3
SET MERGED=%4
SET WCPATH=%5

"%MERGE%" -merge --result="%MERGED%" --title1="Mine" --title2="Merging to: %MERGED%" --title3="Theirs" "%MINE%" "%BASE%" "%THEIRS%"
