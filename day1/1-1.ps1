#for (($d=gc .\input.txt | % {iex $_}), ($i=($c=0)+1); $i -lt ($d.Length); $i++) {if ($d[$i] -gt $d[$i-1]) {$c++}} $c

$data = Get-Content .\input.txt
$increases = 0
for ($i = 1; $i -lt $data.Length; $i++) {
    [int]$prev, [int]$curr = $data[($i-1)..$i]
    if ($curr -gt $prev) { $increases++ }
}
$increases