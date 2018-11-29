$a = Read-Host -Prompt "
1.
2.
3. EXIT Menu
Please Choose Next Steps"
switch ($a){
	1{write-host "One is read" -ForegroundColor red}
	2{}
	3{exit}
}