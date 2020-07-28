function MergeSort([array] $arr)
{
	if ($arr.Length -eq 1) {return $arr}

    [array] $result = @()
	[int] $mid = $arr.Length/2
	[array] $left = @(MergeSort @($arr[0..($mid-1)]))
	[array] $right = @(MergeSort @($arr[$mid..($arr.Length-1)]))

	while (($left.Length -gt 0) -and ($right.Length -gt 0))
	{
		if ($left[0] -lt $right[0])
		{
			$result += $left[0]
			if ($left.Length -gt 1){$left = $left[1..$($left.Length-1)]}
			else {$left = @()}
		}
		else
		{
			$result += $right[0]
			if ($right.Length -gt 1){$right = $right[1..$($right.Length-1)]}
			else {$right = @()}
		}
	}

	$result + $left + $right
}

Write-Host @(MergeSort @(5,9,1,3,4,6,6,3,2))