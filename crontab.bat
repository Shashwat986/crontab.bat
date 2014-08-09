@echo off
if exist {%UserProfile%\.crontab} (
	echo edit existing crontab for %UserName%
	vim %UserProfile%\.crontab
) else (
	echo no crontab for %UserName%

	echo # Edit this file to introduce tasks to be run by cron. > .crontab
	echo #  >> .crontab
	echo # Each task to run has to be defined through a single line >> .crontab
	echo # indicating with different fields when the task will be run >> .crontab
	echo # and what command to run for the task >> .crontab
	echo #  >> .crontab
	echo # To define the time you can provide concrete values for >> .crontab
	echo # minute ^(m^), hour ^(h^), day of month ^(dom^), month ^(mon^), >> .crontab
	echo # and day of week ^(dow^) or use '*' in these fields ^(for 'any'^).#  >> .crontab
	echo # Notice that tasks will be started based on the cron's system >> .crontab
	echo # daemon's notion of time and timezones. >> .crontab
	echo #  >> .crontab
	echo # Output of the crontab jobs ^(including errors^) is sent through >> .crontab
	echo # email to the user the crontab file belongs to ^(unless redirected^). >> .crontab
	echo #  >> .crontab
	echo # For example, you can run a backup of all your user accounts >> .crontab
	echo # at 5 a.m every week with: >> .crontab
	echo # 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/ >> .crontab
	echo #  >> .crontab
	echo # For more information see the manual pages of crontab^(5^) and cron^(8^) >> .crontab
	echo #  >> .crontab
	echo # m h  dom mon dow   command >> .crontab

	vim %UserProfile%\.crontab
)
