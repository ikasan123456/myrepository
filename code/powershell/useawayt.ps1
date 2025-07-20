
# function node-await {
#     Start-Process -NoNewWindow -FilePath "node" -ArgumentList "--experimental-repl-await"
# }

function nodejs {
    param(
        [string]$Suffix
    )
    if ($Suffix -eq '--v') {
        Write-Host "Node.js version: $(node -v)"
        return
    } elseif ($Suffix -eq '--await') {
        Write-Host "Node.js REPL with await enabled (current window)"
        node --experimental-repl-await
        return
    } elseif ($Suffix -eq '--new') {
        Write-Host "Node.js REPL in new window"
        Start-Process -FilePath "cmd.exe" -ArgumentList "/k node"
        return
    } elseif ($Suffix -eq '--new-await') {
        Write-Host "Node.js REPL with await enabled (new window)"
        Start-Process -FilePath "cmd.exe" -ArgumentList "/k node --experimental-repl-await"
        return
    } else {
        Write-Host "Node.js REPL (current window)"
        node
        return
    }


    
    # 他の処理をここに追加可能
}