function CheckService {


	$GET=Get-Service | where {$_.DisplayName -eq "Websense TRITON Web Server"}
	$STOPPED=Get-Service | where {$_.DisplayName -eq "Websense TRITON Web Server"} | where {$_.Status -eq "Stopped"}
	$START=Start-Service -Name "EIPManagerProxy"

	Write-Output $GET

	try {
		if($GET -eq $STOPPED){
			$START


		}
	}
	catch {
		$error[0]
		Write-Output (" [-] Error ")
	}
}


Import-Module PSScheduledJob
#$act= New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'c:\Users\cdadmin\Documents\serviceStarted.ps1'
#$trig= New-ScheduledTaskTrigger -Daily -At 7am
#Registered-ScheduledTask -Action $act -Trigger $trig -TaskName "FP Apache Service" -Description "Check if service is running"



CheckService | ConvertTo-HTML | Out-File "C:\Users\cdadmin\Desktop\dailyresult.html"
