<div align="center">

# ReduceMemory Atmeg
### Silent RAM cleaner for Windows 10 & 11

Right-click your desktop. RAM drops. No UAC. No window. No disk spike.

![Windows 10](https://img.shields.io/badge/Windows%2010-supported-0078D4?style=flat-square&logo=windows)
![Windows 11](https://img.shields.io/badge/Windows%2011-supported-0078D4?style=flat-square&logo=windows)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)

</div>

---

## What it does

Clears RAM usage instantly by flushing the standby list, modified page list, and working sets — the same mechanism used by tools like Ghost Spectre's ReduceMemory. Accessible from the right-click context menu on your desktop, no UAC prompt required after setup.

https://github.com/user-attachments/assets/eac952e8-4a4b-4d2c-a05c-e2e3125fb44a



---

## Features

| | v1 — Original | v2 — Updated |
|---|---|---|
| Context menu shortcut | ✅ | ✅ |
| Clears standby list | ✅ | ✅ |
| Clears modified page list | ✅ | ✅ |
| Clears working sets | ✅ | ✅ |
| Deletes user temp files | ✅ | ✅ (skips files in use) |
| Flushes DNS cache | ❌ | ✅ |
| UAC prompt | Every use | One-time setup only |
| CMD window on run | ✅ visible | ❌ fully hidden |
| Disk I/O spike | ✅ pagefile reset | ❌ disk untouched |
| Deletes Prefetch | ✅ (harmful) | ❌ removed |
| Stops system services | ✅ (harmful) | ❌ removed |
| Auto-detect ESL path | ❌ | ✅ |
| Uninstaller included | ❌ | ✅ |
| Paths with spaces | ❌ | ✅ |

---

## How it works

```
Right-click desktop
       ↓
  trigger.vbs  →  schtasks /run  (silent, no window)
       ↓
  Task Scheduler  (InteractiveToken + HighestAvailable)
       ↓
  run_hidden.vbs  →  cmd.exe  [window = 0]
       ↓
  EmptyStandbyList  workingsets
  EmptyStandbyList  modifiedpagelist
  EmptyStandbyList  standbylist
  Delete user temp files
  Flush DNS cache
```

**Why no UAC:** Task Scheduler registers the task with `InteractiveToken` and `HighestAvailable` — pre-authorized at setup, no prompt needed on each run.

**Why no CMD window:** The context menu calls `wscript.exe` (windowless), which then runs `cmd.exe` with window parameter `0` (hidden).

**Why no disk spike:** Pagefile reset and Prefetch deletion from v1 are removed entirely. Only RAM is touched.

---

## Requirements

- Windows 10 or Windows 11
- Administrator account
- [EmptyStandbyList](https://github.com/stefanpejcic/EmptyStandbyList) — place inside `EmptyStandbyList-master\` folder

---

## Installation

```
ReduceMemoryAtmeg\
├── setup_install.bat           ← Run this once as Admin
├── reduce_memory_atmeg.bat     ← Main script (do not run manually)
├── uninstall.bat               ← Clean removal
├── README.md
└── EmptyStandbyList-master\
    └── EmptyStandbyList.exe    ← Required before setup
```

1. Place `EmptyStandbyList.exe` inside the `EmptyStandbyList-master` folder
2. Right-click `setup_install.bat` → **Run as administrator**
3. Accept the UAC prompt *(only time it will appear)*
4. Wait for all 5 steps to complete

> The following files are created automatically during setup:
> `run_hidden.vbs` and `trigger.vbs`

---

## Usage

**Windows 10** — Right-click on Desktop → `ReduceMemory Atmeg`

**Windows 11** — Right-click on Desktop → `Show More Options` → `ReduceMemory Atmeg`

Check results in **Task Manager → Performance → Memory** — the *In Use* value will decrease.

---

## Uninstall

Right-click `uninstall.bat` → **Run as administrator**

Removes the Scheduled Task, context menu registry entry, and `EmptyStandbyList.exe` from System32.

---

## Credits

**EmptyStandbyList** by [@stefanpejcic](https://github.com/stefanpejcic/EmptyStandbyList)

Original script by ChatGPT & Claude AI

---

<div align="center">
<sub>Tested on Windows 11 23H2</sub>
</div>
