# speedtest-go Installer

A simple bash script to automatically download and install [speedtest-go](https://github.com/showwin/speedtest-go) — a full-featured CLI and Go library for testing internet speed via speedtest.net — on Linux (x86_64 / arm64).

## What it does

- Detects your system architecture automatically
- Downloads the correct `speedtest-go` release binary (v1.7.10)
- Extracts and installs it to `/usr/local/bin`
- Verifies the installation and prints the version

## Requirements

- Linux (x86_64 or arm64)
- `wget`
- `sudo` privileges

## Usage

```bash
wget https://raw.githubusercontent.com/ClassicDarkPack/speedtest-go-installer/main/install-speedtest-go.sh
chmod +x install-speedtest-go.sh
sudo ./install-speedtest-go.sh
```

Or, if you already have the script locally:

```bash
chmod +x install-speedtest-go.sh
sudo ./install-speedtest-go.sh
```

## Running a speed test

Once installed, run:

```bash
speedtest-go -m
```

Other useful flags:

```bash
speedtest-go --list        # list nearby servers
speedtest-go --json        # output results as JSON
speedtest-go --server ID   # test against a specific server
```

## Credits

This script is just an installer wrapper. All credit for the actual tool goes to [showwin/speedtest-go](https://github.com/showwin/speedtest-go).

## License

MIT
