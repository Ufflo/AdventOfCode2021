$position = $depth = $aim = 0
Get-Content .\input.txt | ForEach-Object {
    [string]$direction, [int]$step = $_.split()
    switch ($direction) {
        up { $aim -= $step}
        down { $aim += $step}
        forward { 
            $position += $step
            $depth += $step * $aim
        }
        Default {}
    }
}
$position * $depth