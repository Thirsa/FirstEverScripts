@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET old=out
SET new=xml
FOR /f %%f in ('dir /b *.out') do (
  SET newname=%%f
  SET newname=!newname:%old%=%new%!
  COPY "%%f" "!newname!"
)
SET date=Z01_%date:~11,2%_%date:~6,2%_%date:~3,2%_
SET old=o
FOR /f %%f in ('dir /b *.xml') do (
  SET newname=%%f
  SET newname=!newname:%old%=%date%!
  MOVE "%%f" "!newname!"
)

CLS
ECHO.
ECHO.

:dag1
SET /p program= Moet er een andere dag gebruikt worden? Ja of Nee     
  
  IF %program%== nee (Goto end)
		
  IF %program%== ja (GOTO dag2) ELSE (
  ECHO.
  ECHO ONJUISTE INVOER!
  ECHO.
  GOTO dag1)

:dag2
ECHO.
ECHO.
SET /p ANSWER= welke DAG moet het dan zijn?    
	
  IF %ANSWER% geq 32 (
  ECHO.
  ECHO ONMOGELIJKE DAG 
  goto dag2)
	
  IF %ANSWER% lss 1 (
  ECHO.
  ECHO ONMOGELIJKE DAG
  goto dag2)

  IF "%answer:~2,1%" geq "0" (
  echo.
  ECHO ONMOGELIJKE DAG
  goto dag2)

  IF not "%answer:~1,1%" geq "0" (
  SET answer=0%answer%
)

DEL *.xml

SETLOCAL ENABLEDELAYEDEXPANSION
SET old=out
SET new=xml
FOR /f %%f in ('dir /b *.out') do (
  SET newname=%%f
  SET newname=!newname:%old%=%new%!
  COPY "%%f" "!newname!"
)
SET date2=Z01_%date:~4,2%_%date:~7,2%_%ANSWER%_
SET old=o
FOR /f %%f in ('dir /b *.xml') do (
  SET newname=%%f
  SET newname=!newname:%old%=%date2%!
  MOVE "%%f" "!newname!"
)

CLS
ECHO.
ECHO.
:bijna
SET /p program= klopt de datum nu? Ja of Nee     
	
  IF %program% == nee (Goto dag2)
	
  IF %program%== ja (goto end) ELSE (
  ECHO.
  ECHO ONJUISTE INVOER!
  ECHO.
  GOTO bijna)

:end
ECHO.
ECHO You're welcome!
ECHO.
PAUSE