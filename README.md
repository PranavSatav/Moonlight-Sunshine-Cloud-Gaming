# 🌙 Sunshine + Moonlight Web (Browser-Based Remote Streaming)

This project documents a **fully working, browser-based remote desktop / game streaming setup** using:

IMP - DOWNLOAD WORKING CODE FROM HERE - https://drive.google.com/file/d/1kQ6lNw1sUm8CZN4tZTVKo9VPbB7zi_dI/view?usp=sharing
More Automated (new version) - https://drive.google.com/file/d/1BMQ7b1iIVRpa2qrNJ8seDFX0K2FHrYps/view?usp=sharing
as file exceeds 25mb i can upload here...

- **Sunshine** (host / streaming server)
- **Moonlight Web Stream** (browser client via WebRTC)
- **Windows PowerShell automation** (to minimize setup effort)

The goal of this project is to achieve **maximum automation without breaking security guarantees** built into Moonlight and Sunshine.

> ⚠️ Some steps are intentionally manual and **cannot be automated by design** (explained below).

---

## 🚀 What This Setup Achieves

- Stream your **Windows desktop or games** to a **web browser**
- No NVIDIA GameStream required
- Works on:
  - Any modern browser (Chrome, Edge, Firefox)
  - Any device that can open a browser
- Self-hosted, local-first
- Secure, PIN-based pairing (Moonlight protocol)

---

## 🧠 Architecture Overview

Browser → Moonlight Web Server → Sunshine (Host PC)

---

## 📁 Project Structure

```
Moonlight+Sunshine/
│
├── Sunshine/
│   └── SunshineInstaller.exe
│
├── MoonlightWeb/
│   ├── web-server.exe
│   └── server/
│       ├── config.json
│       └── data.json
│
└── Scripts/
    ├── setup.ps1
    └── start_moonlight_web.bat
```

---

## ⚙️ Prerequisites

- Windows 10 / 11
- Administrator access
- Modern browser (Chrome / Edge recommended)
- Sunshine installer (Windows build)
- Moonlight Web Stream binary

---

## 🛠️ Setup Instructions

### 1️⃣ Run the Setup Script

Double-click `setup.ps1`.

The script will:
- Install Sunshine silently
- Launch Sunshine
- Launch Moonlight Web server
- Open required browser tabs
- Pause and wait for you to complete mandatory manual steps

---

### 2️⃣ Manual Steps (Required – One Time Only)

#### 🔐 Sunshine Setup
Open:
```
https://localhost:47990
```

Set:
```
Username: admin
Password: Aeiou@123
```

#### 🌐 Moonlight Web Login
Open:
```
http://localhost:8080
```

Login using:
```
admin / Aeiou@123
```

#### ➕ Add Host (One Time)
- Click **+**
- Host: `localhost`
- Port: `47989`
- Enter the PIN shown in Sunshine

---

## 🔒 Security Notes

- Host pairing **cannot be automated**
- PIN pairing is mandatory by protocol design
- Certificates are generated during pairing

---

## 🏁 Final Notes

This project documents the **maximum automation possible** without weakening security.

---

⭐ If this helped you, feel free to star the repository.
