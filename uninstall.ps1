$printerName = "CanoN HR deptart."  # for example: Canon IR2520 HR Dept
$driverINF = "cnlb0ka64.inf" # for example: cnlb0ka64.inf (inf file should be under driver folder)
$driverPrinterModel = "Canon iR2016 UFRII LT" # for example: Canon iR2016 UFRII LT
$printerPortName = "Canon HR"
$printerPortIP = "11.10.10.10" # IP address of the printer

Get-Printer | Where-Object { $_.PortName -eq "$printerPortName" } | Remove-Printer
Remove-PrinterPort -Name $printerPortName
Remove-PrinterDriver -Name "$driverPrinterModel"
