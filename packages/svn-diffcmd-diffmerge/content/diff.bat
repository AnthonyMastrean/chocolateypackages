@ECHO OFF

SET DIFF=C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe

SET LEFT=%6
SET RIGHT=%7

"%DIFF%" "%LEFT%" "%RIGHT%"
