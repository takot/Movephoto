REM @echo off
set MYDOCUMENTS=%USERPROFILE%\My Documents
set MYPICTURES=%MYDOCUMENTS%\My Pictures
pushd \
for %%d in (G F E) do (
	if exist %%d:\ (
		%%d:
		for %%f in (PENTX MLT19 KK340 CANON RICOH) do (
			for /L %%p in (100,1,105) do (
				if exist \DCIM\%%p%%f:\ (
					pushd \DCIM\%%p%%f
					if PENTX==%%f if %ERRORLEVEL% equ 0 (
						move /-Y *.JPG "%MYPICTURES%\dsc\K10D3"
					) else if KK340==%%f if %ERRORLEVEL% equ 0 (
						copy /-Y *.jpg "%MYPICTURES%\dsc\WX340K"
					) else if MLT19==%%f if %ERRORLEVEL% equ 0 (
						move /-Y *.JPG "%MYPICTURES%\dsc\100MLT19"
						move /-Y *.MOV "%MYPICTURES%\dsc\100MLT19"
					)
					popd
				)
			)
		)
		set ERRORLEVEL=0
		if exist %%d\PRIVATE\KYOCERA\DATA (
			pushd \PRIVATE\KYOCERA\DATA
			if %ERRORLEVEL% equ 0 (
				move /-Y *.3g2 "%MYPICTURES%\dsc\WX340K"
				move /-Y *.3gp "%MYPICTURES%\dsc\WX340K"
				move /-Y *.jpg "%MYPICTURES%\dsc\WX340K"
			)
			popd
		)
	)
)
popd
PAUSE
