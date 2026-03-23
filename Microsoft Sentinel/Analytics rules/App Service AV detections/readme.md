
# App Service AV detections

Microsoft Sentinel **scheduled analytics rule** to **detect new infected files in App Services** from the antivirus scan audit log.

## 🔧 Analytics rules list

- **JSON**: [App Service AV detections.json](App%20Service%20AV%20detections.json)
- **KQL Query**: [App Service AV detections.kql](App%20Service%20AV%20detections.kql)

## ⚙️ Configuration

The process of creating an analytics rule from a template, along with screenshots and the import wizard from the Microsoft Defender portal, is described in the linked blog posts.

## 📦 Analytics rule details

| Field | Description |
| ----- | ----------- |
| **Id** | b89f0941-1c11-4c9e-af2c-6b9826e1fc05 |
| **Name** | App Service AV detections |
| **Description** | This query looks for App Service antivirus scan audit log events that indicate new infected files have been detected. |
| **Severity** | High |
| **Tactics** | Initial Access |
| **Techniques** | Not configured |
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
