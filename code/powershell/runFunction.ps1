function new-js {
    param(
        [Parameter(Position=0)]
        [string]$Suffix,
        [Parameter(Position=1)]
        [string]$JsPath
    )

    if ($Suffix -eq '--v') {
        Write-Host "new-js version 1.0.1"
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

    if (-not $Suffix -or -not $JsPath) {
        Write-Host "❌ 引数が足りません: new-js <名前> <ファイルパス>"
        return
    }

    $FuncName = "run-$Suffix"

    $FunctionDefinition = @"
function global:$FuncName {
    param()
    Write-Host '🚀 実行: $JsPath'
    node '$JsPath'
}
"@

    Invoke-Expression $FunctionDefinition

    Write-Host "✅ 関数 $FuncName をグローバルスコープに登録しました"
}

