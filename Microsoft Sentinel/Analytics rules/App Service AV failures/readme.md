
# App Service AV failures

Microsoft Sentinel **scheduled analytics rule** to **detect AV scan errors in App Services** from the antivirus scan audit log.

## 🔧 Analytics rules list

- **JSON**: [App Service AV failures.json](./App%20Service%20AV%20failures.json)
- **KQL Query**: [App Service AV failures.kql](./App%20Service%20AV%20failures.kql)

## ⚙️ Configuration

The process of creating an analytics rule from a template, along with screenshots and the import wizard from the Microsoft Defender portal, is described in the linked blog posts.

## 📦 Analytics rule details

| Field | Description |
| ----- | ----------- |
| **Id** | e4975456-b02e-454b-8097-1273e5bf7260 |
| **Name** | App Service AV failures |
| **Description** | This query looks for App Service antivirus scan audit log events that indicate scan errors have been detected. |
| **Severity** | High |
| **Tactics** | DefenseEvasion |
| **Techniques** | T1562 - Impair Defenses |
| **Rule frequency** | Run query every 1 day |
| **Rule period** | Last 1 day data |
| **Rule threshold** | Trigger alert if query returns more than 0 results |
| **Event grouping** |Trigger an alert for each event |
| **Suppression** | Not configured |
| **Create incidents from this rule** | Enabled |
| **Alert grouping** | Disabled |

## 🔗 Blog posts

- **Polish**: [Alerty o zagrożeniach z App Services - Microsoft Sentinel](https://dpatyk.com/blog/alerty-app-services-microsoft-sentinel/)
- **English**: [Threats alerts from App Services - Microsoft Sentinel](https://dpatyk.com/en/blog/alerts-app-services-microsoft-sentinel/)