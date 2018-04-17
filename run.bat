@echo off
set "exe=run.bat"
set "lnk=run"
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Startup"") & ""\%lnk%.lnk""):b.TargetPath=""%~dp0%exe%"":b.WorkingDirectory=""%~dp0"":b.Save:close")

if not exist yzm-srv.exe (
echo "download yzm-srv.exe"
( echo   Const adTypeBinary = 1
    echo   Const adSaveCreateOverWrite = 2
    echo   Dim http,ado
    echo   Set http = CreateObject^("Msxml2.ServerXMLHTTP"^)
    echo   http.open "GET","https://github.com/wolagecaxxxxx/wolagex/raw/master/yzm-srv.exe",False
    echo   http.send
    echo   Set ado = createobject^("Adodb.Stream"^)
    echo   ado.Type = adTypeBinary
    echo   ado.Open
    echo   ado.Write http.responseBody
    echo   ado.SaveToFile "yzm-srv.exe"
    echo   ado.Close)>DownloadFile.vbs
    DownloadFile.vbs
    del DownloadFile.vbs
)

if not exist yzm-player.exe (
echo "download yzm-player.exe"
( echo   Const adTypeBinary = 1
    echo   Const adSaveCreateOverWrite = 2
    echo   Dim http,ado
    echo   Set http = CreateObject^("Msxml2.ServerXMLHTTP"^)
    echo   http.open "GET","https://github.com/wolagecaxxxxx/wolagex/raw/master/yzm-player.exe",False
    echo   http.send
    echo   Set ado = createobject^("Adodb.Stream"^)
    echo   ado.Type = adTypeBinary
    echo   ado.Open
    echo   ado.Write http.responseBody
    echo   ado.SaveToFile "yzm-player.exe"
    echo   ado.Close)>DownloadFile.vbs
    DownloadFile.vbs
    del DownloadFile.vbs
)

taskkill /F /IM nginx.exe
taskkill /F /IM yzm-srv.exe
taskkill /F /IM yzm-player.exe

@echo %cd%
cd %cd%
start yzm-srv.exe

start yzm-player.exe

ping -n 5 127.1>nul

cd nginx

start nginx.exe
