# Local preview: builds the site and serves it at http://localhost:1414 (with search).
# Only visible on this computer. Stop with Ctrl+C.
$env:Path = [Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [Environment]::GetEnvironmentVariable('Path','User')
Set-Location $PSScriptRoot
if (-not (Test-Path node_modules)) { npm install --no-fund --no-audit }
hugo --gc --minify
npx pagefind --site public --serve
