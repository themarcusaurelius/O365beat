# Monitor activity in your O365 Account.

This is a custom "beat" for Office 365 logs received via one of the Office 365 API endpoints. It currently supports <b>user, admin, system, and policy actions and events</b> from Office 365 and Azure AD activity logs exposed by the Office 365 Management Activity API.

## O365 Initial Setup

To use this fileset you need to [enable Audit Log Search](https://docs.microsoft.com/en-us/microsoft-365/compliance/turn-audit-log-search-on-or-off?view=o365-worldwide#turn-on-audit-log-search)  and [register an application in Azure AD.](https://docs.microsoft.com/en-us/office/office-365-management-api/get-started-with-office-365-management-apis#register-your-application-in-azure-ad)

![Imgur](https://imgur.com/cPOrFq2.png)

The ```audit``` fileset uses the Office 365 Management Activity API to retrieve audit messages from Office 365 and Azure AD activity logs. These are the same logs that are available under Audit Log Search in the Security and Compliance Center.


Once this application is registered note the Application (client) ID and the Directory (tenant) ID. Then configure the authentication in the Certificates & Secrets section.

Finally, you need to add permissions in the API permissions section and grant it admin consent. Click on Add permission and select Office 365 Management APIs. The needed permissions are:

- User.Read
- ActivityFeed.Read
- ActivityFeed.ReadDlp
- ServiceHealth.Read

![Imgur](https://imgur.com/qjOaUpL.png)

Once the required permissions are added, click the <i>Grant admin</i> consent button. Note that it can take a while for the required permissions to be in effect, so it’s possible that you observe some permission errors when running O365beat right away.

<b>*** Required Credentials You Must Have From O365 To Use This Beat ***</b>

 - Tenant Domain
 - Client Secret
 - Client ID aka application id (GUID)
 - Directory ID aka tenant id (GUID)
 
<hr>
 
## Installation
 
### Windows
 
1) As administrator, enter the following command in Powershell or download the zip file [here](https://github.com/themarcusaurelius/O365beat/archive/master.zip).

```
Start-BitsTransfer -Source 'https://github.com/themarcusaurelius/O365beat/archive/master.zip' -Destination 'C:\Users\Administrator\Downloads\O365beat.zip'
```

2) Unzip the package and extract the contents to the `C:/` drive.

3) Back in Powershell, CD into the extracted folder and run the following script:

```
.\installO365beat.ps1
```

4) When prompted, enter your credentials below as well as the ```URL``` that you would like to monitor and click OK.

```css
Kibana URL: _PLACEHOLDER_KIBANA_URL_
Username: _PLACEHOLDER_USERNAME_
Password: _PLACEHOLDER_PASSWORD_
Elasticsearch API Endpoint: _PLACEHOLDER_API_ENDPOINT_
```

5) When prompted again, enter your O365 Credentials. 

```
 - Tenant Domain
 - Client Secret
 - Client ID aka application id (GUID)
 - Directory ID aka tenant id (GUID)
```

This will install and run O365beat.

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<b>Note that it can take a while for the required permissions to be in effect, so it’s possible that you observe some permission errors when running O365beat right away.</b>

