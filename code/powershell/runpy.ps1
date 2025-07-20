function new-py {
    param(
        [Parameter(Position=0)]
        [string]$Suffix,
        [Parameter(Position=1)]
        [string]$PyPath
    )

    if ($Suffix -eq '--v') {
        Write-Host "new-py version 1.0.0"
        return
    }
    if ($Suffix -eq '--list') {
        Write-Host "--- 作成済み run_* 関数一覧 ---"
        Get-Command | Where-Object { $_.Name -like 'run_*' } | ForEach-Object { $_.Name }
        return
    }
    if ($Suffix -eq '--debug') {
        Write-Host "[DEBUG] 現在の関数定義一覧:"
        Get-Command | Where-Object { $_.Name -like 'run_*' } | Format-Table Name,CommandType,Source
        return
    }

    if (-not $Suffix -or -not $PyPath) {
        Write-Host "❌ 引数が足りません: new-py <名前> <ファイルパス>"
        return
    }

    $FuncName = "run-$Suffix"

    $FunctionDefinition = @"
function global:$FuncName {
    param()
    Write-Host '🚀 実行: $PyPath'
    python '$PyPath'
}
"@

    Invoke-Expression $FunctionDefinition

    Write-Host "✅ 関数 $FuncName をグローバルスコープに登録しました"
}
