# TrickFire Robotics — bin

Team utility scripts. MIT licensed.

<pre>
bin/
└── <a href="#set-up-local-dns">use-tf-dns</a>  ·  point your machine at the TrickFire DNS server
</pre>

---

## Set up local DNS

Points your machine at the TrickFire DNS server so internal hosts like `viator`
resolve by name without any manual config.

**Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/TrickfireRobotics/bin/main/use-tf-dns-linux.sh | bash
```

**macOS**
```bash
curl -fsSL https://raw.githubusercontent.com/TrickfireRobotics/bin/main/use-tf-dns-mac.sh | bash
```

**Windows** (PowerShell, run as Administrator)
```powershell
irm https://raw.githubusercontent.com/TrickfireRobotics/bin/main/use-tf-dns-windows.ps1 | iex
```

Each script prints an undo command if you ever need to revert.
