# SDK Market

by [Musab Kara](https://github.com/SkyWalker2506)

A catalog of production-ready SDKs and kits. Clone once, install any kit with a single command.

---

## Install a Kit

```bash
# Clone the market
git clone https://github.com/SkyWalker2506/sdk-market
cd sdk-market

# List available kits
./install.sh

# Install a kit
./install.sh flutter-feedback-kit
```

Or one-liner (no clone needed):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/SkyWalker2506/sdk-market/main/install.sh) flutter-feedback-kit
```

---

## Kits

### Flutter

| Kit | Description | Install |
|-----|-------------|---------|
| [flutter-feedback-kit](https://github.com/SkyWalker2506/flutter_feedback_kit) | In-app feedback — form widget, voice input, offline queue, screenshot, pluggable backends | `./install.sh flutter-feedback-kit` |
| [flutter-quiz-kit](https://github.com/SkyWalker2506/flutter_quiz_kit) | Quiz engine — adaptive difficulty, sound feedback, STT matching | `./install.sh flutter-quiz-kit` |
| [flutter-tutorial-kit](https://github.com/SkyWalker2506/flutter_tutorial_kit) | In-app tutorial overlay — coach mark walkthrough, Riverpod | `./install.sh flutter-tutorial-kit` |

---

## Adding a New Kit

1. Create your kit repo
2. Add an entry to `kits/catalog.json`
3. Submit a PR

---

## Author

**Musab Kara** — [GitHub](https://github.com/SkyWalker2506)
