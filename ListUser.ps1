$Cred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $Cred -Authentication Basic -AllowRedirection
Import-PSSession $Session -CommandName "Get-Mailbox", "Set-Mailbox"

Get-Mailbox -ResultSize Unlimited | 
  Where {($_.ForwardingAddress -ne $Null) -or ($_.ForwardingsmtpAddress -ne $Null)} | 
  Select Name, ForwardingAddress, ForwardingsmtpAddress, DeliverToMailboxAndForwardList
