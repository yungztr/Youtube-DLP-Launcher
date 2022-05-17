@echo off
title Youtube-DLP Launcher (made by yungztr)

:menu
cls
color 0a
echo Welcome
echo Do you want to add any arguments?
echo If no is selected, the default is an mp4 (or sometimes webpm) video file.
set /p question=Add in arguments? [y/n]
if %question%==y (goto optionsMenu) else (goto noOptionsRedirect)

:noOptionsRedirect
echo The following Video will be downloaded with default settings File...
TIMEOUT /NOBREAK /T 2 >nul
goto launcher

:optionsMenu
cls
set argumentMP3=
set argumentThumbnail=
set argumentSubtitles=

::all arguments will be used here
::if you can help add some generic ones please feel free to add them here
::for that just add an variable like above, provide an if statement
::and add the argumentVariable to the final command as an %variable%
::----------------
::Thumbnail Option
set /p questionThumbnail=Do you want to extract the Thumbnail? [y/n]
if %questionThumbnail%==y (
set "argumentThumbnail=--write-thumbnail"
)

::Subtitles Option
set /p questionSubtitles=Do you want to save subtitles? [y/n]
if %questionSubtitles%==y (
set "argumentSubtitles==--write-subs"
)

::Audio Options
set /p questionAudioExtraction=Do you want to extract the audio? [y/n]
if %questionAudioExtraction%==y goto audioOptions

::End of list. No more options added yet
goto launcher

:launcher
set /p url=Please type in the URL:
cls
echo Launching Youtube-DLP...
TIMEOUT /NOBREAK /T 1 >nul
start yt-dlp.exe %argumentThumbnail% %argumentSubtitles% %argumentMP3% %url%
echo This program will only close on user input
pause
exit

:audioOptions
echo List of supported audio formats:
echo 1. mp3
echo 2. wav
echo 3. m4a
echo 4. flac
set /p format=Which format do you want to save as? Type in the format: 

echo Which Quality do you want to save the audio?
echo 1-10, 10 is the best options. 5 is default option with 128kbps
set /p audioQuality=Choose the Quality:

if %audioQuality%=="" (
set "audioQuality=5"
)

if %format%==mp3 (
set "argumentMP3=--extract-audio --audio-format %format% --audio-quality %audioQuality%"
)

if %format%==wav (
set "argumentMP3=--extract-audio --audio-format %format% --audio-quality %audioQuality%"
)

if %format%==m4a (
set "argumentMP3=--extract-audio --audio-format %format% --audio-quality %audioQuality%"
)

if %format%==flac (
set "argumentMP3=--extract-audio --audio-format %format% --audio-quality %audioQuality%"
)

echo Audio will be saved as an %format% file with Quality Setting on:  %audioQuality%.
set /p inputCheck=Please check your input. Press x to reconfigure. Press c to continue:

if %inputCheck%==x goto audioOptions



echo Audio will be saved as an %format% file with Quality Setting on:  %audioQuality%.
TIMEOUT /NOBREAK /T 3 >nul

goto launcher

:nothing
::used for testing