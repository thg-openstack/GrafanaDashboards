get-childitem -recurse "*.json" | Foreach-Object { 
    $output_path = Join-Path $_.DirectoryName "output"
    Write-Host "kubectl create configmap $($_.BaseName) -n observability --from-file=$($_.FullName) --dry-run=client -oyaml | kubectl label -f- --dry-run=client -o yaml --local grafana_dashboard=""1"" > $output_path/$($_.baseName).yaml"
}