rem Edit this file to introduce tasks to be run by cron.
rem 
rem Each task to run has to be defined through a single line
rem indicating with different fields when the task will be run
rem and what command to run for the task
rem 
rem To define the time you can provide concrete values for
rem minute (m), hour (h), day of month (dom), month (mon),
rem and day of week (dow) or use '*' in these fields (for 'any').# 
rem Notice that tasks will be started based on the cron's system
rem daemon's notion of time and timezones.
rem 
rem Output of the crontab jobs (including errors) is sent through
rem email to the user the crontab file belongs to (unless redirected).
rem 
rem For example, you can run a backup of all your user accounts
rem at 5 a.m every week with:
rem 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
rem 
rem For more information see the manual pages of crontab(5) and cron(8)
rem
rem m h  dom mon dow   command

@echo off
if exist %UserProfile%\.cron (
	set editor=vim
	rem needs to read file and extract default editor.
) else (
	echo Choose which of the following editors to use:
	
	set /a ednum=1

	for %%s in (vim notepad gedit gvim) do (
		set retval=0
		call:editorExists %%s
		if %retval% EQU 1 echo %ednum%. %%s
		set /a ednum=%ednum%+1
	)
	
	set editor=vim
)

if exist %UserProfile%\.crontab (
	echo edit existing crontab for %UserName%
	rem %editor% %UserProfile%\.crontab
) else (
	echo no crontab for %UserName%

	echo # Edit this file to introduce tasks to be run by cron. > %UserProfile%\.crontab
	echo #  >> %UserProfile%\.crontab
	echo # Each task to run has to be defined through a single line >> %UserProfile%\.crontab
	echo # indicating with different fields when the task will be run >> %UserProfile%\.crontab
	echo # and what command to run for the task >> %UserProfile%\.crontab
	echo #  >> %UserProfile%\.crontab
	echo # To define the time you can provide concrete values for >> %UserProfile%\.crontab
	echo # minute ^(m^), hour ^(h^), day of month ^(dom^), month ^(mon^), >> %UserProfile%\.crontab
	echo # and day of week ^(dow^) or use '*' in these fields ^(for 'any'^).#  >> %UserProfile%\.crontab
	echo # Notice that tasks will be started based on the cron's system >> %UserProfile%\.crontab
	echo # daemon's notion of time and timezones. >> %UserProfile%\.crontab
	echo #  >> %UserProfile%\.crontab
	echo # Output of the crontab jobs ^(including errors^) is sent through >> %UserProfile%\.crontab
	echo # email to the user the crontab file belongs to ^(unless redirected^). >> %UserProfile%\.crontab
	echo #  >> %UserProfile%\.crontab
	echo # For example, you can run a backup of all your user accounts >> %UserProfile%\.crontab
	echo # at 5 a.m every week with: >> %UserProfile%\.crontab
	echo # 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/ >> %UserProfile%\.crontab
	echo #  >> %UserProfile%\.crontab
	echo # For more information see the manual pages of crontab^(5^) and cron^(8^) >> %UserProfile%\.crontab
	echo #  >> %UserProfile%\.crontab
	echo # m h  dom mon dow   command >> %UserProfile%\.crontab

	rem %editor% %UserProfile%\.crontab
)
goto :eof

:editorExists

where %~1 1>NUL 2>NUL
if %errorlevel% neq 0 (
	set "retval=0"
) else (
	set "retval=1"
)
goto :eof