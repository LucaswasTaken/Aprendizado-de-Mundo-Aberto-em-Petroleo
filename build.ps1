<#
.SYNOPSIS
    Compila o livro e reporta erros, referencias indefinidas e caixas estouradas.
.PARAMETER Clean
    Remove os artefatos de compilacao antes de comecar.
#>
[CmdletBinding()]
param(
    [switch]$Clean
)

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

# MiKTeX nem sempre esta no PATH em instalacoes por usuario no Windows.
$miktex = Join-Path $env:LOCALAPPDATA 'Programs\MiKTeX\miktex\bin\x64'
if ((Test-Path $miktex) -and ($env:PATH -notlike "*$miktex*")) {
    $env:PATH = "$miktex;$env:PATH"
}

if (-not (Get-Command pdflatex -ErrorAction SilentlyContinue)) {
    throw 'pdflatex nao encontrado. Instale TeX Live ou MiKTeX.'
}

$aux = '*.aux', '*.bbl', '*.blg', '*.idx', '*.ilg', '*.ind', '*.lof', '*.log',
       '*.lol', '*.lot', '*.out', '*.spl', '*.toc', '*.fls', '*.fdb_latexmk'

if ($Clean) {
    Remove-Item $aux -ErrorAction SilentlyContinue
    Write-Host 'Artefatos removidos.'
}

Write-Host 'Passo 1/5  pdflatex'  ; pdflatex -interaction=nonstopmode main.tex | Out-Null
Write-Host 'Passo 2/5  bibtex'    ; bibtex main    | Out-Null
Write-Host 'Passo 3/5  makeindex' ; makeindex main | Out-Null
Write-Host 'Passo 4/5  pdflatex'  ; pdflatex -interaction=nonstopmode main.tex | Out-Null
Write-Host 'Passo 5/5  pdflatex'  ; pdflatex -interaction=nonstopmode main.tex | Out-Null

$log = Get-Content main.log -Raw

$erros     = ([regex]::Matches($log, '(?m)^! ')).Count
$indef     = ([regex]::Matches($log, 'undefined')).Count
$overfull  = ([regex]::Matches($log, 'Overfull \\hbox \((\d+)') |
              ForEach-Object { [int]$_.Groups[1].Value } |
              Where-Object { $_ -gt 20 }).Count
$paginas   = [regex]::Match($log, 'Output written on main\.pdf \((\d+) pages').Groups[1].Value

Write-Host ''
Write-Host ('{0,-24} {1}' -f 'Erros',                  $erros)
Write-Host ('{0,-24} {1}' -f 'Referencias indefinidas', $indef)
Write-Host ('{0,-24} {1}' -f 'Overfull > 20pt',        $overfull)
Write-Host ('{0,-24} {1}' -f 'Paginas',                $paginas)

if (-not (Test-Path main.pdf)) {
    throw 'main.pdf nao foi gerado. Verifique main.log.'
}
if ($erros -gt 0 -or $indef -gt 0) {
    exit 1
}
