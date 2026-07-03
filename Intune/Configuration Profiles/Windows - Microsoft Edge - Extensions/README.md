# Windows - Microsoft Edge - Extensions

Intune **configuration profile** that control Microsoft Edge extensions **Allow**, **Block** and **Forcelist**.

## 🔧 Profile export

- **Microsoft Edge**: [Windows - Microsoft Edge - Extensions.json](Windows%20-%20Microsoft%20Edge%20-%20Extensions.json)

## ⚙️ Extensions details

| Type | Description | ID's |
| ----- | ----------- | ----- |
| **Allow** | [uBlock Origin Lite](https://microsoftedge.microsoft.com/addons/detail/ublock-origin-lite/cimighlppcgcoapaliogpjjdehbnofhn) | cimighlppcgcoapaliogpjjdehbnofhn |
| **Block** | Block all extensions | * |
| **Force** | [KeePassXC-Browser](https://microsoftedge.microsoft.com/addons/detail/keepassxcbrowser/pdffhmdngciaglkoonimfcmckehcpafo) | pdffhmdngciaglkoonimfcmckehcpafo |

## ⚙️ Settings details

| Field | Description | Value |
| ----- | ----------- | ----- |
| **Control which extensions are installed silently** | Specifies extensions that are installed silently, without user interaction, and that the users can’t uninstall or disable ("force-installed"). | Enabled + ID's |
| **Control which extensions cannot be installed** | List specific extensions that users can NOT install in Microsoft Edge. When you deploy this policy, any extensions on this list that were previously installed will be disabled, and the user won’t be able to enable them. | Enabled + * (all) |
| **Allow specific extensions to be installed** | Setting the policy specifies which extensions are not subject to the blocklist. A blocklist value of * means all extensions are blocked and users can only install extensions listed in the allow list. | Enabled + ID's |

## 📦 Policy details

| Field | Description |
| ----- | ----------- |
| **Name** | Windows - Microsoft Edge - Extensions |
| **Description** | This configuration profile control Microsoft Edge extensions Allow, Block and Forcelist. |
| **Platform** | Windows |
| **Configuration profile file** | [Windows - Microsoft Edge - Extensions.json](Windows%20-%20Microsoft%20Edge%20-%20Extensions.json) |

## 🔗 Blog posts

- **Polish**: [Zarządzanie rozszerzeniami Google Chrome i Microsoft Edge w Intune](https://dpatyk.com/blog/zarzadzanie-rozszerzeniami-google-chrome-i-microsoft-edge-w-intune)
- **English**: [Managing Google Chrome and Microsoft Edge Extensions in Intune](https://dpatyk.com/en/blog/managing-google-chrome-and-microsoft-edge-extensions-in-intune/)
