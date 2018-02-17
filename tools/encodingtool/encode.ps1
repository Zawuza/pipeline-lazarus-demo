$filename = (Get-Location).Path + "\results2.xml"
$content = Get-Content results.xml -Encoding Unicode 
[IO.File]::WriteAllLines($filename, $content)