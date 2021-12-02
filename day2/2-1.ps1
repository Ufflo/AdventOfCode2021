$position = $depth = 0
Get-Content .\input.txt | ForEach-Object {
    [string]$direction, [int]$step = $_.split()
    switch ($direction) {
        up { $depth -= $step }
        down { $depth += $step }
        forward { $position += $step }
        Default {}
    }
}
$position * $depth