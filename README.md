# WindowsWireguardWatchdog

> Boost Your WireGuard Stability on Windows 10/11 with this PowerShell Script and never lose connection again!

Powershell script to monitor a wireguard connection unter Windows 10 / 11 and restart if needed

# PowerShell Script for Restarting WireGuard Service

This PowerShell script allows you to monitor the connectivity to a specific IP address and restart the "WireGuardTunnel$wire" service if the ping fails.

## Script Overview

The script performs the following tasks:

1. Defines the target host IP address and the ping interval.
2. Implements a function to ping the target host.
3. Implements a function to restart the WireGuard service.
4. Loops indefinitely, pinging the target host at the specified interval.
5. If the ping fails, the script logs an error and restarts the WireGuard service.
6. The script continues to monitor and repeat the process until manually stopped.

## Installation Steps

To install the PowerShell script as a Windows service using NSSM:

1. Download NSSM (Non-Sucking Service Manager) from the official GitHub repository: [https://github.com/nssm-windows/nssm/releases](https://github.com/nssm-windows/nssm/releases).

2. Extract the downloaded ZIP file and navigate to the extracted directory.

3. Open a command prompt with administrator privileges and navigate to the NSSM directory.

4. Run the following command to install the PowerShell script as a Windows service:

   ```shell
   nssm.exe install WireGuardService "powershell.exe" "-ExecutionPolicy Bypass -File C:\path\to\your\script.ps1"
   ```

   Replace `C:\path\to\your\script.ps1` with the actual path to your PowerShell script.


   To modify the target IP address for pinging, update the `keep_alive.ps1` script:

   ```powershell
   $TargetHost = "192.168.178.1"
   $PingInterval = 5 * 60  # 5 minutes in seconds
   ```
   > **Note:** The IP address should be inside your WireGuard network.

6. NSSM will open a GUI window where you can configure the service. Fill in the necessary details, such as the service name, startup directory, and arguments. Click "Install" to proceed.

7. Once the installation is complete, you can start the service using the following command:

   ```shell
   nssm.exe start WireGuardService
   ```

   The PowerShell script will now run as a Windows service, monitoring and restarting the WireGuard service as needed.

## Troubleshooting

- If you encounter any issues during installation or usage, ensure that you have the necessary permissions and dependencies installed correctly.

- If the service fails to restart the WireGuard service, verify that the service name is correct and that you have administrator privileges.

- For further assistance or troubleshooting, refer to the NSSM documentation or contact the project maintainers.

## Conclusion

This script provides a convenient way to monitor the connectivity to a specific IP address and automatically restart the WireGuard service in case of failure. By installing it as a Windows service using NSSM, you can ensure continuous monitoring and automatic recovery without manual intervention.

Feel free to modify and customize the script as per your specific requirements.
