
# App Service AV detections

## Scheduled analytics rule details

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

## Import scheduled analytics rule from template

[This article](https://dpatyk.com/en/blog/alerts-app-services-microsoft-sentinel/) describes the process of creating an analytics rule from template. It's accompanied by screenshots and directions to access the import wizard in the Microsoft Defender portal.