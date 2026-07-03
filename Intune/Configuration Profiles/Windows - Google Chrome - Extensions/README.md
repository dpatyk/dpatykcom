# Windows - Google Chrome - Extensions

Intune **configuration profile** that control Google Chrome extensions **Allow**, **Block** and **Forcelist**.

## 🔧 Profile export

- **Google Chrome**: [Windows - Google Chrome - Extensions.json](Windows%20-%20Google%20Chrome%20-%20Extensions.json)

## ⚙️ Extensions details

| Type | Description | ID's |
| ----- | ----------- | ----- |
| **Allow** | [uBlock Origin Lite](https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh) | ddkjiahejlhfcafbddmgiahcphecmpfh |
| **Block** | Block all extensions | * |
| **Force** | [Microsoft Purview Extension](https://chromewebstore.google.com/detail/microsoft-purview-extensi/echcggldkblhodogklpincgchnpgcdco) | echcggldkblhodogklpincgchnpgcdco |

## ⚙️ Settings details

| Field | Description | Value |
| ----- | ----------- | ----- |
| **Configure the list of force-installed apps and extensions** | Setting the policy specifies a list of apps and extensions that install silently, without user interaction, and which users can’t uninstall or turn off. | Enabled + ID's |
| **Configure extension installation blocklist** | Allows you to specify which extensions the users can NOT install. Extensions already installed will be disabled if blocked, without a way for the user to enable them. | Enabled + * (all) |
| **Configure extension installation allow list** | Setting the policy specifies which extensions are not subject to the blocklist. A blocklist value of * means all extensions are blocked and users can only install extensions listed in the allow list. | Enabled + ID's |

## 📦 Policy details

| Field | Description |
| ----- | ----------- |
| **Name** | Windows - Google Chrome - Extensions |
| **Description** | This configuration profile control Google Chrome extensions Allow, Block and Forcelist. |
| **Platform** | Windows |
| **Configuration profile file** | [Windows - Google Chrome - Extensions.json](Windows%20-%20Google%20Chrome%20-%20Extensions.json) |

## 🔗 Blog posts

- **Polish**: [Zarządzanie rozszerzeniami Google Chrome i Microsoft Edge w Intune](https://dpatyk.com/blog/zarzadzanie-rozszerzeniami-google-chrome-i-microsoft-edge-w-intune)
- **English**: [Managing Google Chrome and Microsoft Edge Extensions in Intune](https://dpatyk.com/en/blog/managing-google-chrome-and-microsoft-edge-extensions-in-intune/)
