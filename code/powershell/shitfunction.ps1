function Test-Echo {
    param([string]$Text = "テスト中")

    Write-Host "[TEST] $Text が呼び出されました"
}

#例　呼び出し方
# Test-Echo -Text "カスタムメッセージ"