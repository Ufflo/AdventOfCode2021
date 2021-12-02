for (($data = Get-Content .\input.txt), ($counter = 0), ($i = 3); $i -lt $data.Length; $i++) {
    if (($data[($i-2)..$i] | Measure-Object -Sum).Sum -gt ($data[($i-3)..($i-1)] | Measure-Object -Sum).Sum) {$counter++}
}
$counter 