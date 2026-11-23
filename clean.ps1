$repo = "fromeroc9/testform-demo"

gh issue list --repo $repo --state all --limit 1000 --json number --jq '.[].number' | ForEach-Object {
    Write-Host "Borrando issue #$_..." -ForegroundColor Yellow
    gh issue delete $_ --repo $repo --yes
}
Write-Host "¡Todos los issues fueron eliminados!" -ForegroundColor Green