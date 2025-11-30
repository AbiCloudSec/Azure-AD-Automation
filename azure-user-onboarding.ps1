# azure-user-onboarding.ps1
# Template: Create users, assign license placeholders, add to groups.
Connect-MgGraph -Scopes 'User.ReadWrite.All','Directory.ReadWrite.All','Group.ReadWrite.All'
$users = Import-Csv .\new_users.csv
foreach ($u in $users) {
    New-MgUser -BodyParameter @{
        accountEnabled = $true
        displayName = $u.DisplayName
        mailNickname = $u.MailNickname
        userPrincipalName = $u.UserPrincipalName
        passwordProfile = @{ forceChangePasswordNextSignIn = $true; password = $u.Password }
    }
    Write-Output "Created $($u.UserPrincipalName)"
}
