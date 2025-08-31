# Launch a new PowerShell window that runs npm run dev and stays open
Start-Process -FilePath "powershell.exe" -ArgumentList @(
  "-NoExit",
  "-Command",
  "npm run dev"
) -WorkingDirectory "$PSScriptRoot"
# Open the browser
Start-Process "http://localhost:5173/"
