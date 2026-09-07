<#
.SYNOPSIS
    Creates a read-only local group membership report.

.DESCRIPTION
    Collects membership information for selected local Windows security groups.
    The script identifies the built-in Administrators group by its well-known SID,
    flags it as privileged, and writes a timestamped local report.

.NOTES
    This script does not create, modify, enable, disable, or delete users,
    groups, passwords, permissions, or memberships.

    Run only on systems you own or are authorized to support.
    Review and sanitize generated reports before sharing.
#>

$ErrorActionPreference = "Stop"

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ReportDirectory = Join-Path $ScriptRoot "..\reports"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$ReportPath = Join-Path $ReportDirectory "group_membership_report_$Timestamp.txt"

$AdministratorsGroupSID = "S-1-5-32-544"

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

function Add-ReportText {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Text
    )

    Add-Content -Path $ReportPath -Value $Text
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
    "Identity and Access Support Lab - Group Membership Report" |
        Set-Content -Path $ReportPath

    "Generated (local time): $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" |
        Add-Content -Path $ReportPath

    "Computer name: $env:COMPUTERNAME" |
        Add-Content -Path $ReportPath

    Add-ReportSection -Title "Report Scope"

    @(
        "This is a read-only inventory of selected local security-group memberships."
        "No users, groups, permissions, passwords, or memberships are changed."
        "Privileged membership requires validation through approved access-control procedures."
        "Review and sanitize the report before sharing."
    ) | ForEach-Object {
        Add-ReportText -Text $_
    }

    Add-ReportSection -Title "Selected Local Groups"

    $SelectedGroups = Get-LocalGroup |
        Where-Object {
            $_.SID.Value -eq $AdministratorsGroupSID -or
            $_.Name -match "^(Users|Remote Desktop Users|Remote Management Users)$"
        } |
        Sort-Object Name

    if (-not $SelectedGroups) {
        Add-ReportText -Text "No selected local groups were found."
    }
    else {
        $SelectedGroups |
            Select-Object `
                Name,
                Description,
                SID,
                @{
                    Name = "PrivilegeLevel"
                    Expression = {
                        if ($_.SID.Value -eq $AdministratorsGroupSID) {
                            "Privileged"
                        }
                        else {
                            "Standard or delegated access"
                        }
                    }
                } |
            Add-ReportObject

        foreach ($Group in $SelectedGroups) {
            $PrivilegeLevel = if ($Group.SID.Value -eq $AdministratorsGroupSID) {
                "Privileged"
            }
            else {
                "Standard or delegated access"
            }

            Add-ReportSection -Title "Members: $($Group.Name)"

            Add-ReportText -Text "Group SID: $($Group.SID.Value)"
            Add-ReportText -Text "Access classification: $PrivilegeLevel"

            try {
                $Members = Get-LocalGroupMember -SID $Group.SID -ErrorAction Stop

                if ($Members) {
                    $Members |
                        Select-Object Name, ObjectClass, PrincipalSource, SID |
                        Sort-Object Name |
                        Add-ReportObject
                }
                else {
                    Add-ReportText -Text "No members were returned for this group."
                }
            }
            catch {
                Add-ReportText -Text "Unable to retrieve members for this group: $($_.Exception.Message)"
            }
        }
    }

    Add-ReportSection -Title "Review Notes"

    @(
        "Group membership provides a starting point for access review; it is not, by itself, proof that access is authorized or unauthorized."
        "Validate unexpected or privileged membership against an approved request, role, and access-control policy."
        "Do not remove access based only on this report. Use approved change management and escalation procedures."
        "Use least privilege: grant only the access required for a legitimate, approved task."
    ) | ForEach-Object {
        Add-ReportText -Text $_
    }

    Write-Host "Group membership report created: $ReportPath" -ForegroundColor Green
}
catch {
    Write-Error "Unable to create group membership report: $($_.Exception.Message)"
    exit 1
}
