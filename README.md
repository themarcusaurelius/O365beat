# Office 365

This is a custom "beat" for Office 365 logs received via one of the Office 365 API endpoints. It currently supports user, admin, system, and policy actions and events from Office 365 and Azure AD activity logs exposed by the Office 365 Management Activity API.

## Setup

To use this fileset you need to enable Audit Log Search and register an application in Azure AD.

![Imgur](https://imgur.com/cPOrFq2.png)

Once this application is registered note the Application (client) ID and the Directory (tenant) ID. Then configure the authentication in the Certificates & Secrets section.

Finally you need to add permissions in the API permissions section and grant it admin consent. Click on Add permission and select Office 365 Management APIs. The needed permissions are:

- User.Read
- ActivityFeed.Read
- ActivityFeed.ReadDlp
- ServiceHealth.Read

![Imgur](https://imgur.com/qjOaUpL.png)

Once the required permissions are added, click the <i>Grant admin</i> consent button. Note that it can take a while for the required permissions to be in effect, so it’s possible that you observe some permission errors when running Filebeat right away.


