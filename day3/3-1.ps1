$data = Get-Content .\input.txt
$arr = New-Object int[] $data[0].Length
for ($i = 0; $i -lt $data.Count; $i++) {
    $j = 0
    $data[$i].ToCharArray() | ForEach-Object {
        [int]$arr[$j] += $_ - 48
        $j++
    }
}

$gamma = $epsilon = ""
for ($i = 0; $i -lt $arr.count; $i++) {
    if ($arr[$i] -gt $data.Count/2) {
        [string]$gamma += 1
        [string]$epsilon += 0
    } else {
        [string]$gamma += 0
        [string]$epsilon += 1
    } 
}

[convert]::ToInt32($gamma, 2) * [convert]::ToInt32($epsilon, 2)