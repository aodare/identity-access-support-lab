<#
.SYNOPSIS
    Creates a read-only local account and group audit report.

.DESCRIPTION
    Collects non-secret information about local Windows user accounts,
    local security groups, and local Administrators group membership.
    The script does not create, modify, enable, disable, reset, or delete
    accounts, passwords, or group memberships.

.NOTES
    Run only on computers you own or are authorized to support.
    Generated reports can contain account names and security identifiers.
    Review and sanitize reports before sharing.
#>

$ErrorActionPreference = "Stop"

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ReportDirectory = Join-Path $ScriptRoot "..\reports"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$ReportPath = Join-Path $ReportDirectory "local_account_audit_$Timestamp.txt"

New-Item -ItemType Directory -Path $ReportDirectory -Force | Out-Null

function Add-ReportSection {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Title
    )

    Add-Content -Path $ReportPath -Value ""
    Add-Content -Path $ReportPath -Value ("=" * 72)
    Add-Content -Path $ReportPath -Value $Title
    Add-Content -Path $ReportPath -Value ("=" * 72)
}

function Add-ReportObject {
    param(
        [Parameter(Mandatory = $true)]
        [object]$InputObject
    )

    $InputObject |
        Format-Table -AutoSize |
        Out-String -Width 220 |
        Add-Content -Path $ReportPath
}

try {
    "Identity and Access Support Lab - Local Account Audit" |
        Set-Content -Path $ReportPath

    "Generated (local time): $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" |
        Add-Content -Path $ReportPath

    "Computer name: $env:COMPUTERNAME" |
        Add-Content -Path $ReportPath

    Add-ReportSection -Title "Audit Scope"

    @(
        "This is a read-only local account and group inventory."
        "No accounts, passwords, permissions, or group memberships are changed."
        "Review and sanitize this report before sharing."
    ) | Add-Content -Path $ReportPath

    Add-ReportSection -Title "Local User Accounts"

    Get-LocalUser |
        Select-Object `
            Name,
            Enabled,
            Description,
            LastLogon,
            PasswordLastSet,
            PasswordExpires,
            UserMayChangePassword,
            SID |
        Sort-Object Name |
        Add-ReportObject

    Add-ReportSection -Title "Local Security Groups"

    Get-LocalGroup |
        Select-Object Name, Description, SID |
        Sort-Object Name |
        Add-ReportObject

    Add-ReportSection -Title "Local Administrators Group Membership"

    $AdministratorsGroup = Get-LocalGroup |
        Where-Object { $_.SID.Value -eq "S-1-5-32-544" } |
        Select-Object -First 1

    if ($AdministratorsGroup) {
        Get-LocalGroupMember -SID $AdministratorsGroup.SID |
            Select-Object Name, ObjectClass, PrincipalSource, SID |
            Sort-Object Name |
            Add-ReportObject
    }
    else {
        "The built-in Administrators group could not be identified by SID." |
            Add-Content -Path $ReportPath
    }

    Add-ReportSection -Title "Audit Notes"

    @(
        "Accounts and group members should be reviewed according to approved access-control policy."
        "Unexpected administrator membership should be validated and escalated through approved procedures."
        "Do not remove accounts or privileges solely from this report without authorization and change approval."
    ) | Add-Content -Path $ReportPath

    Write-Host "Local account audit report created: $ReportPath" -ForegroundColor Green
}
catch {
    Write-Error "Unable to create local account audit report: $($_.Exception.Message)"
    exit 1
}
