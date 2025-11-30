# conditional-access-report.ps1
Connect-MgGraph -Scopes 'Policy.Read.All'
$policies = Invoke-MgGraphRequest -Method GET -Uri 'https://graph.microsoft.com/beta/identity/conditionalAccess/policies'
$policies.value | Select-Object id, displayName, state | Export-Csv .\conditional_access_report.csv -NoTypeInformation
Write-Output 'Exported Conditional Access policies to CSV'
