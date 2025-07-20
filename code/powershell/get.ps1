function get {
    param (
        [string]$name,
        [switch]$Wildcard
    )

    if ($Wildcard) {
        Get-Command -Name "*$name*"
    }
    else {
        Get-Command -Name $name
    }
}