if exist {%UserProfile%\.crontab} (
	echo edit existing crontab for %UserName%
	vim .crontab
) else (
	echo no crontab for %UserName%
	vim .crontab
)