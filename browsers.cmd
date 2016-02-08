:: Start All Browsers (Current Stable Releases or Nightly Builds) With an Empty Tab or Go To Specified URL (http://localhost:8000 by Default)

@echo off

set emptyFlag=false
set nightlyFlag=false
set url=http://localhost:8000/

set chromePath="C:\Users\uncle Fucka\AppData\Local\Google\Chrome\Application\chrome.exe"
set fireFoxPath="C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
set IEPath="C:\Program Files\Internet Explorer\iexplore.exe"
set operaPath="C:\Program Files (x86)\Opera\launcher.exe"

set canaryPath="C:\Users\uncle Fucka\AppData\Local\Google\Chrome SxS\Application\chrome.exe"
set nightlyPath="C:\Program Files\Nightly\firefox.exe"
set nextPath="C:\Program Files (x86)\Opera beta\launcher.exe"

:options
	if [%1]==[] (
		goto startBrowsers
	)
	if %1==-n (
		set nightlyFlag=true
	)
	if %1==-e (
		set emptyFlag=true
	)
	if %1==-u if NOT [%2]==[] if NOT %2==-n if NOT %2==-e (
		set url=%2
		shift
	)
	shift
	goto options

:startBrowsers
	if %emptyFlag%==true (
		if %nightlyFlag%==true (
			start "Canary" %canaryPath% -homepage "about:blank"
			start "Next" %nextPath% -activetab "about:blank"
			start "Nightly" %nightlyPath% -new-tab "about:blank"
		) else (
			start "Chrome" %chromePath% -homepage "about:blank"
			start "Opera" %operaPath% -activetab "about:blank"
			start "Firefox" %fireFoxPath% -new-tab "about:blank"
			start "Internet Explorer" %IEPath% "about:blank"
			start "Microsoft Edge" microsoft-edge:about:blank
		)
	) else (
		if %nightlyFlag%==true (
			start "Canary" %canaryPath% -homepage "%url%"
			start "Next" %nextPath% -activetab "%url%"
			start "Nightly" %nightlyPath% -new-tab "%url%"
		) else (
			start "Chrome" %chromePath% -homepage "%url%"
			start "Opera" %operaPath% -activetab "%url%"
			start "Firefox" %fireFoxPath% -new-tab "%url%"
			start "Internet Explorer" %IEPath% "%url%"
			start "Microsoft Edge" microsoft-edge:%url%
		)
	)
