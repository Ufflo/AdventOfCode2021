$data = Get-Content .\input.txt
$arr = New-Object int[] $data[0].Length

for ($i = 0; $i -lt $data.Count; $i++) {
    $j = 0
    $data[$i].ToCharArray() | ForEach-Object {
        [int]$arr[$j] += $_ - 48
        $j++
    }
}

$oxygen = $coscrub = $data

for ($i = 0; $i -lt $data[0].Length; $i++) {

    # Oxygen Generator rating
    $zero = $one = @()
    foreach ($line in $oxygen) {
        if ($line[$i] -eq '0') {$zero += $line} else {$one += $line}
    }
    if ($oxygen.Count -eq 1) {} elseif ($zero.Count -gt $one.Count) {$oxygen = $zero} else {$oxygen = $one}
 
    # CO2 Scrubber rating
    $zero = $one = @()
    foreach ($line in $coscrub) {
        if ($line[$i] -eq '0') {$zero += $line} else {$one += $line}
    }
    if ($coscrub.Count -eq 1) {} elseif ($one.Count -lt $zero.Count) {$coscrub = $one} else {$coscrub = $zero}
}

[convert]::ToInt32($oxygen, 2) * [convert]::ToInt32($coscrub, 2)