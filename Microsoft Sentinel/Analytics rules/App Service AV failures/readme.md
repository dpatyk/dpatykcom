
# App Service AV failures

## Scheduled analytics rule details

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

## Import scheduled analytics rule from template

[This article](https://dpatyk.com/en/blog/alerts-app-services-microsoft-sentinel/) describes the process of creating an analytics rule from template. It's accompanied by screenshots and directions to access the import wizard in the Microsoft Defender portal.