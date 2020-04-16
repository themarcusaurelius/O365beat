Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser	
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    "`nYou are running Powershell with full privilege`n"

    Set-Location -Path 'c:\o365beat-master\o365beat'
    Set-ExecutionPolicy Unrestricted
    
    "O365beat Execution policy set - Success`n"


    #=========== Vizion.ai Credentials Form ===========#
    "`nAdding Vizion.ai Credentials"

    #GUI To Insert User Credentials
    #Pop-up Box that Adds Credentials 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

    #============ Box ============#
    $objForm = New-Object System.Windows.Forms.Form 
    $objForm.Text = "Vizion.ai Credentials Form"
    $objForm.Size = New-Object System.Drawing.Size(300,400) 
    $objForm.StartPosition = "CenterScreen"

    $objForm.KeyPreview = $True
    $objForm.Add_KeyDown({
        if ($_.KeyCode -eq "Enter" -or $_.KeyCode -eq "Escape"){
            $objForm.Close()
        }
    })

    #============= Buttons =========#
    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Size(75,280)
    $OKButton.Size = New-Object System.Drawing.Size(75,23)
    $OKButton.Text = "OK"
    $OKButton.Add_Click({$objForm.Close()})
    $objForm.Controls.Add($OKButton)

    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Location = New-Object System.Drawing.Size(150,280)
    $CancelButton.Size = New-Object System.Drawing.Size(75,23)
    $CancelButton.Text = "Cancel"
    $CancelButton.Add_Click({$objForm.Close()})
    $objForm.Controls.Add($CancelButton)

    #============= Header ==========#
    $objLabel = New-Object System.Windows.Forms.Label
    $objLabel.Location = New-Object System.Drawing.Size(10,10) 
    $objLabel.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel.Text = "Please enter the following:"
    $objForm.Controls.Add($objLabel)

    #============ First Input =======#
    $objLabel1 = New-Object System.Windows.Forms.Label
    $objLabel1.Location = New-Object System.Drawing.Size(10,40) 
    $objLabel1.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel1.Text = "Kibana URL"
    $objForm.Controls.Add($objLabel1)

    $objTextBox = New-Object System.Windows.Forms.TextBox 
    $objTextBox.Location = New-Object System.Drawing.Size(10,60) 
    $objTextBox.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox) 

    #============ Second Input =======#
    $objLabel2 = New-Object System.Windows.Forms.Label
    $objLabel2.Location = New-Object System.Drawing.Size(10,100) 
    $objLabel2.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel2.Text = "Username:"
    $objForm.Controls.Add($objLabel2)

    $objTextBox2 = New-Object System.Windows.Forms.TextBox 
    $objTextBox2.Location = New-Object System.Drawing.Size(10,120) 
    $objTextBox2.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox2)

    # #============ Third Input =======#
    $objLabel3 = New-Object System.Windows.Forms.Label
    $objLabel3.Location = New-Object System.Drawing.Size(10,160) 
    $objLabel3.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel3.Text = "Password:"
    $objForm.Controls.Add($objLabel3)

    $objTextBox3 = New-Object System.Windows.Forms.TextBox 
    $objTextBox3.Location = New-Object System.Drawing.Size(10,180) 
    $objTextBox3.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox3)

    #============ Fourth Input =======#
    $objLabel4 = New-Object System.Windows.Forms.Label
    $objLabel4.Location = New-Object System.Drawing.Size(10,220) 
    $objLabel4.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel4.Text = "Vizion Elasticsearch API Endpoint:"
    $objForm.Controls.Add($objLabel4)

    $objTextBox4 = New-Object System.Windows.Forms.TextBox 
    $objTextBox4.Location = New-Object System.Drawing.Size(10,240) 
    $objTextBox4.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox4)

    $objForm.Topmost = $True

    $objForm.Add_Shown({$objForm.Activate()})
    [void]$objForm.ShowDialog()

    #Opens up YML file and inserts Kibana URL
    (Get-Content o365beat.yml) |
        ForEach-Object {$_ -Replace 'host: ""', "host: ""$($objTextBox.Text)"""} |
            Set-Content o365beat.yml

    #Opens Up YML and sets Username
    (Get-Content o365beat.yml) |       
        ForEach-Object {$_ -Replace 'username: ""', "username: ""$($objTextBox2.Text)""" } |
            Set-Content o365beat.yml

    #Opens Up YML and sets Password
    (Get-Content o365beat.yml) |       
        ForEach-Object {$_ -Replace 'password: ""', "password: ""$($objTextBox3.Text)""" } |
            Set-Content o365beat.yml

    #Opens up YML o365 and inserts Elasticsearch API Endpoint
    (Get-Content o365beat.yml) |
        ForEach-Object {$_ -Replace 'elasticsearch-api-endpoint', "$($objTextBox4.Text)"} |
            Set-Content o365beat.yml

    "`nVizion.ai Credentials Added!"


    #========== O365 Credentials Form ==========#

    #GUI To Insert User Credentials
    #Pop-up Box that Adds Credentials 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

    #============ Box ============#
    $objForm = New-Object System.Windows.Forms.Form 
    $objForm.Text = "Vizion.ai Credentials Form"
    $objForm.Size = New-Object System.Drawing.Size(300,400) 
    $objForm.StartPosition = "CenterScreen"

    $objForm.KeyPreview = $True
    $objForm.Add_KeyDown({
        if ($_.KeyCode -eq "Enter" -or $_.KeyCode -eq "Escape"){
            $objForm.Close()
        }
    })

    #============= Buttons =========#
    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Size(75,280)
    $OKButton.Size = New-Object System.Drawing.Size(75,23)
    $OKButton.Text = "OK"
    $OKButton.Add_Click({$objForm.Close()})
    $objForm.Controls.Add($OKButton)

    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Location = New-Object System.Drawing.Size(150,280)
    $CancelButton.Size = New-Object System.Drawing.Size(75,23)
    $CancelButton.Text = "Cancel"
    $CancelButton.Add_Click({$objForm.Close()})
    $objForm.Controls.Add($CancelButton)

    #============= Header ==========#
    $objLabel = New-Object System.Windows.Forms.Label
    $objLabel.Location = New-Object System.Drawing.Size(10,10) 
    $objLabel.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel.Text = "Please enter the following:"
    $objForm.Controls.Add($objLabel)

    #============ First Input =======#
    $objLabel1 = New-Object System.Windows.Forms.Label
    $objLabel1.Location = New-Object System.Drawing.Size(10,40) 
    $objLabel1.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel1.Text = "O365 Tenant Domain"
    $objForm.Controls.Add($objLabel1)

    $objTextBox = New-Object System.Windows.Forms.TextBox 
    $objTextBox.Location = New-Object System.Drawing.Size(10,60) 
    $objTextBox.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox) 

    #============ Second Input =======#
    $objLabel2 = New-Object System.Windows.Forms.Label
    $objLabel2.Location = New-Object System.Drawing.Size(10,100) 
    $objLabel2.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel2.Text = "O365 Client Secret"
    $objForm.Controls.Add($objLabel2)

    $objTextBox2 = New-Object System.Windows.Forms.TextBox 
    $objTextBox2.Location = New-Object System.Drawing.Size(10,120) 
    $objTextBox2.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox2)

    # #============ Third Input =======#
    $objLabel3 = New-Object System.Windows.Forms.Label
    $objLabel3.Location = New-Object System.Drawing.Size(10,160) 
    $objLabel3.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel3.Text = "O365 Client ID"
    $objForm.Controls.Add($objLabel3)

    $objTextBox3 = New-Object System.Windows.Forms.TextBox 
    $objTextBox3.Location = New-Object System.Drawing.Size(10,180) 
    $objTextBox3.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox3)

    #============ Fourth Input =======#
    $objLabel4 = New-Object System.Windows.Forms.Label
    $objLabel4.Location = New-Object System.Drawing.Size(10,220) 
    $objLabel4.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel4.Text = "O365 directory ID"
    $objForm.Controls.Add($objLabel4)

    $objTextBox4 = New-Object System.Windows.Forms.TextBox 
    $objTextBox4.Location = New-Object System.Drawing.Size(10,240) 
    $objTextBox4.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox4)

    $objForm.Topmost = $True

    $objForm.Add_Shown({$objForm.Activate()})
    [void]$objForm.ShowDialog()

    #Opens up YML file and inserts Kibana URL
    (Get-Content o365beat.yml) |
        ForEach-Object {$_ -Replace 'O365BEAT_TENANT_DOMAIN:', "O365BEAT_TENANT_DOMAIN:$($objTextBox.Text)"} |
            Set-Content o365beat.yml

    #Opens Up YML and sets Password
    (Get-Content o365beat.yml) |       
        ForEach-Object {$_ -Replace 'O365BEAT_CLIENT_SECRET:', "O365BEAT_CLIENT_SECRET:$($objTextBox2.Text)" } |
            Set-Content o365beat.yml

    #Opens Up YML and sets Username
    (Get-Content o365beat.yml) |       
        ForEach-Object {$_ -Replace 'O365BEAT_CLIENT_ID:', "O365BEAT_CLIENT_ID:$($objTextBox3.Text)" } |
            Set-Content o365beat.yml

    #Opens up YML o365 and inserts Elasticsearch API Endpoint
    (Get-Content o365beat.yml) |
        ForEach-Object {$_ -Replace 'O365BEAT_DIRECTORY_ID:', "O365BEAT_DIRECTORY_ID:$($objTextBox4.Text)"} |
            Set-Content o365beat.yml

    "`nO365 Credentials Added"

    "`nTesting Configuration...`n"

    .\o365beat.exe -e -configtest

    .\o365beat.exe setup --dashboards

    .\install-service-o365beat.ps1

    Start-service o365beat

    Get-Service o365beat

    "`nO365beat Started. Check Kibana For The Incoming Data!"

    #Close Powershell window
    Stop-Process -Id $PID
}
else {
    Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}