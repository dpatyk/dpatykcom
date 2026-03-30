# Browser Extensions Report

Intune remediation **detection scripts** to report unauthorized **Google Chrome**, **Microsoft Edge** and **Mozilla Firefox** browser extensions.

## 🔧 Remediation list

- **Mozilla Firefox**: [firefox-extensions-detection.ps1](firefox-extensions-detection.ps1)
- **Microsoft Edge**: [edge-extensions-detection.ps1](edge-extensions-detection.ps1)
- **Google Chrome**: [chrome-extensions-detection.ps1](chrome-extensions-detection.ps1)

## ⚙️ Add extension to allowlist

Enter the **Extension Id** to the **$AllowedIds** variable in the **CONFIGURATION** section.

```pwsh
# ==============================================================
# CONFIGURATION – edit before deployment
# ==============================================================

$AllowedIds = @(
    "ddkjiahejlhfcafbddmgiahcphecmpfh", # ExtensionID 1
    "nngceckbapebfimnlniiiahkandclblb", # ExtensionID 2 
    "eimadpbcbfnmbkopoojfekhnkhdbieeh"  # ExtensionID 3
)
```

## 📦 Remediation details

| Field | Description |
| ----- | ----------- |
| **Name** | ``Mozilla Firefox`` / ``Microsoft Edge`` / ``Google Chrome`` - Report unauthorized browser extensions |
| **Description** | This remediation checks installed ``Mozilla Firefox`` / ``Microsoft Edge`` / ``Google Chrome`` browser extensions and reports all unauthorized extensions in the **Pre-remediation detection output**. Detailed results are written to the default IME logs folder and can be retrieved using the **Collect diagnostics** remote action. |
| **Detection script file** | ``firefox``/``edge``/``chrome``-extensions-detection.ps1 |
| **Remediation script file** | Empty |
| **Run this script using the logged-on credentials** | No |
| **Enforce script signature check** | No |
| **Run script in 64-bit PowerShell** | Yes |

## 🔗 Blog posts

- **Polish**:
  - [Jak wykrywać zainstalowane rozszerzenia w przeglądarkach](https://dpatyk.com/blog/jak-wykrywac-zainstalowane-rozszerzenia-w-przegladarkach/)
  - [Audyt rozszerzeń przeglądarek w Microsoft Intune](https://dpatyk.com/blog/audyt-rozszerzen-przegladarek-microsoft-intune/)

- **English**:
  - [How to Detect Installed Browser Extensions](https://dpatyk.com/en/blog/how-to-detect-installed-browser-extensions/)
  - [Browser Extensions Assessment in Microsoft Intune](https://dpatyk.com/en/blog/browser-extensions-assessment-microsoft-intune/)

## 🧪 Sample output

### Remediation pre-output

```json
{
    "UnauthorizedCount": 4,
    "UnauthorizedIds": [
        "ghbmnnjooekpmoecnnnilnnbdlolhkhi",
        "ihcjicgdanjaechkgeegckofjjedodee",
        "nmmhkkegccagdldgiimedpiccmgmieda",
        "ddkjiahejlhfcafbddmgiahcphecmpfh"
    ]
}
```

### IME report

```json
{
    "Timestamp": "2026-03-20 15:04:25",
    "BrowserDetected": true,
    "Summary": {
        "TotalExtensions": 6,
        "Unauthorized": 4,
        "Total": 6
    },
    "Unauthorized": [
        {
            "Browser": "Google Chrome",
            "User": "JanKowalski",
            "Profile": "Default",
            "Id": "ghbmnnjooekpmoecnnnilnnbdlolhkhi",
            "Name": "__MSG_extName__",
            "Version": "1.101.1",
            "InstallDate": "2025-07-14 15:12:18",
            "Enabled": "Not supported"
        },
        {
            "Browser": "Google Chrome",
            "User": "JanKowalski",
            "Profile": "Default",
            "Id": "ihcjicgdanjaechkgeegckofjjedodee",
            "Name": "Malwarebytes Browser Guard",
            "Version": "3.1.4",
            "InstallDate": "2025-07-14 15:17:52",
            "Enabled": "Not supported"
        },
        {
            "Browser": "Google Chrome",
            "User": "JanKowalski",
            "Profile": "Default",
            "Id": "nmmhkkegccagdldgiimedpiccmgmieda",
            "Name": "__MSG_APP_NAME__",
            "Version": "1.0.0.6",
            "InstallDate": "2025-07-14 15:12:17",
            "Enabled": "Not supported"
        },
        {
            "Browser": "Google Chrome",
            "User": "Franek",
            "Profile": "Default",
            "Id": "ddkjiahejlhfcafbddmgiahcphecmpfh",
            "Name": "__MSG_extName__",
            "Version": "2026.308.1810",
            "InstallDate": "2026-03-16 14:15:04",
            "Enabled": "Not supported"
        },
        {
            "Browser": "Google Chrome",
            "User": "Franek",
            "Profile": "Default",
            "Id": "ghbmnnjooekpmoecnnnilnnbdlolhkhi",
            "Name": "__MSG_extName__",
            "Version": "1.102.1",
            "InstallDate": "2026-03-16 14:14:38",
            "Enabled": "Not supported"
        },
        {
            "Browser": "Google Chrome",
            "User": "Franek",
            "Profile": "Default",
            "Id": "nmmhkkegccagdldgiimedpiccmgmieda",
            "Name": "__MSG_APP_NAME__",
            "Version": "1.0.0.6",
            "InstallDate": "2026-03-16 14:14:38",
            "Enabled": "Not supported"
        }
    ]
}
```
