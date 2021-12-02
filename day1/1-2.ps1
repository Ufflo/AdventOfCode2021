$data = Get-Content .\input.txt
$increases = 0
for ($i = 3; $i -lt $data.Length; $i++) {
    if (($data[($i-2)..$i] | Measure-Object -Sum).Sum -gt ($data[($i-3)..($i-1)] | Measure-Object -Sum).Sum) {$increases++}
}
$increases