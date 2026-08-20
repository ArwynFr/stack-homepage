#!/usr/bin/env pwsh

[CmdletBinding()]
param ()

[version]$CurrentDate = [version]::new((Get-Date -Format yy), (Get-Date).DayOfYear, 0)
[version]$CurrentVersion = (gh release list --limit 1 --json tagName --jq '.[0].tagName')

$TargetVersion = if ($CurrentVersion -ge $CurrentDate) {
  [version]::new($CurrentVersion.Major, $CurrentVersion.Minor, $CurrentVersion.Build + 1)
} else { 
  $CurrentDate
}

"VERSION=${TargetVersion}" >> $env:GITHUB_ENV
"version=${TargetVersion}" >> $env:GITHUB_OUTPUT