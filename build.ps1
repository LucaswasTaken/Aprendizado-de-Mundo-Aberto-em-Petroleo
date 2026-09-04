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
$buildDir = Join-Path $PSScriptRoot 'build'

# MiKTeX nem sempre esta no PATH em instalacoes por usuario no Windows.
$miktex = Join-Path $env:LOCALAPPDATA 'Programs\MiKTeX\miktex\bin\x64'
if ((Test-Path $miktex) -and ($env:PATH -notlike "*$miktex*")) {
    $env:PATH = "$miktex;$env:PATH"
}

if (-not (Get-Command pdflatex -ErrorAction SilentlyContinue)) {
    throw 'pdflatex nao encontrado. Instale TeX Live ou MiKTeX.'
}

$legacyAux = '*.aux', '*.bbl', '*.blg', '*.idx', '*.ilg', '*.ind', '*.lof', '*.log',
             '*.lol', '*.lot', '*.out', '*.spl', '*.toc', '*.fls', '*.fdb_latexmk'

if ($Clean) {
    Remove-Item $buildDir -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item $legacyAux -ErrorAction SilentlyContinue
    Write-Host 'Artefatos removidos.'
}

New-Item -ItemType Directory -Path $buildDir -Force | Out-Null

Write-Host 'Passo 1/5  pdflatex'  ; pdflatex -output-directory=build -interaction=nonstopmode main.tex | Out-Null
Write-Host 'Passo 2/5  bibtex'    ; bibtex build/main | Out-Null
Write-Host 'Passo 3/5  makeindex' ; makeindex -o build/main.ind build/main.idx | Out-Null
Write-Host 'Passo 4/5  pdflatex'  ; pdflatex -output-directory=build -interaction=nonstopmode main.tex | Out-Null
Write-Host 'Passo 5/5  pdflatex'  ; pdflatex -output-directory=build -interaction=nonstopmode main.tex | Out-Null

$log = Get-Content (Join-Path $buildDir 'main.log') -Raw

$erros     = ([regex]::Matches($log, '(?m)^! ')).Count
$indef     = ([regex]::Matches($log, 'undefined')).Count
$overfull  = ([regex]::Matches($log, 'Overfull \\hbox \((\d+)') |
              ForEach-Object { [int]$_.Groups[1].Value } |
              Where-Object { $_ -gt 20 }).Count
$paginas   = [regex]::Match($log, 'Output written on .*main\.pdf \((\d+) pages').Groups[1].Value

Write-Host ''
Write-Host ('{0,-24} {1}' -f 'Erros',                  $erros)
Write-Host ('{0,-24} {1}' -f 'Referencias indefinidas', $indef)
Write-Host ('{0,-24} {1}' -f 'Overfull > 20pt',        $overfull)
Write-Host ('{0,-24} {1}' -f 'Paginas',                $paginas)

if (-not (Test-Path (Join-Path $buildDir 'main.pdf'))) {
    throw 'main.pdf nao foi gerado. Verifique main.log.'
}
if ($erros -gt 0 -or $indef -gt 0) {
    exit 1
}

Copy-Item (Join-Path $buildDir 'main.pdf') (Join-Path $PSScriptRoot 'main.pdf') -Force
