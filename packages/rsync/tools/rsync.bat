@ECHO OFF

SETLOCAL

SET RSYNC_HOME=%chocolateyInstall%\lib\rsync\content\cwRsync_5.4.1_x86_Free
SET HOME=%USERPROFILE%
SET PATH=%RSYNC_HOME%;%PATH%

rsync %*
