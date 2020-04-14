# Office 365

This is a custom "beat" for Office 365 logs received via one of the Office 365 API endpoints. It currently supports user, admin, system, and policy actions and events from Office 365 and Azure AD activity logs exposed by the Office 365 Management Activity API.

## Setup

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

Once the required permissions are added, click the <i>Grant admin</i> consent button. Note that it can take a while for the required permissions to be in effect, so it’s possible that you observe some permission errors when running Filebeat right away.

<b>*** Required Credentials You Must Have From O365 ***</b>

 - Tenant Domain
 - Client Secret
 - Client ID
 - Directory ID


