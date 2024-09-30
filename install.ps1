$printerName = "CanoN HR deptart."  # for example: Canon IR2520 HR Dept
$driverINF = "cnlb0ka64.inf" # for example: cnlb0ka64.inf (inf file should be under driver folder)
$driverPrinterModel = "Canon iR2016 UFRII LT" # for example: Canon iR2016 UFRII LT
$printerPortName = "Canon HR"
$printerPortIP = "11.10.10.10" # IP address of the printer

# detection rule: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\$printerName in clear
# install command: %SystemRoot%\SysNative\WindowsPowershell\v1.0\PowerShell.exe -noprofile -ExecutionPolicy ByPass -File .\install.ps1

Start-Process PNPUtil -ArgumentList "/add-driver", "driver\$driverINF"

# check for printer port
if (Get-PrinterPort -Name "$printerPortName" -ErrorAction SilentlyContinue)
{
    Get-Printer | Where-Object { $_.PortName -eq "$printerPortName" } | Remove-Printer
    Remove-PrinterPort -Name $printerPortName
}

Add-PrinterPort -Name "$printerPortName" -PrinterHostAddress "$printerPortIP" -ErrorAction SilentlyContinue
Add-PrinterDriver -Name "$driverPrinterModel"
Add-Printer -Name "$printerName" -DriverName "$driverPrinterModel" -PortName "$printerPortName"