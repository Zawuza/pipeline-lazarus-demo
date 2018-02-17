$filename = (Get-Location).Path + "\results2.xml"
$content = Get-Content results_test.xml -Encoding Unicode 
[IO.File]::WriteAllLines($filename, $content)