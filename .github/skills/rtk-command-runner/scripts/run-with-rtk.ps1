param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Executable,

    [Parameter(Position = 1, ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

$rtk = Get-Command rtk.exe -ErrorAction SilentlyContinue

if ($null -ne $rtk) {
    & $rtk.Source proxy $Executable @Arguments
} else {
    & $Executable @Arguments
}

$exitCode = $LASTEXITCODE
if ($null -ne $exitCode) {
    exit $exitCode
}
