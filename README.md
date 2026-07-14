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

## Parse-can

Parse-can is a small script to translate can frames from the RMDx8 motors to human readable output.

To set it up run this to compile the c-binary `gcc hex_translator.c -o hex_to_int` then make sure the c-binary is also linked in your bin so that it will use it properly

**suggested workflow**

If the can line is running remotely run `ssh <user>@<IP> "candump <can-interface>" > <temp-filename>` that way you have a file on your machine to use
If you are running it locally then `candump any > <temp-filename>` should suffice

then simply run `parse_can -t <translation-file> -f <canlog-file>` and you should be able to translate logs

**Parsing**

`-o` and `-c` are both options where you can strip the new lines below and the color from the output respectively if you want to pull this and use it somewhere else. But If you just want to read the output i recommend `parse_can -f <filename> -t <translation_file> | grep "<pattern> -A <number of options that come after>` since you preserve the more human readable output
