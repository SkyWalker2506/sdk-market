#!/usr/bin/env bash
# SDK Market installer
# Usage: ./install.sh <kit-id>
# Example: ./install.sh flutter-feedback-kit

set -e

CATALOG="$(dirname "$0")/kits/catalog.json"
KIT_ID="${1:-}"

if [ -z "$KIT_ID" ]; then
  echo "Usage: ./install.sh <kit-id>"
  echo ""
  echo "Available kits:"
  python3 -c "
import json
with open('$CATALOG') as f:
    data = json.load(f)
for k in data['kits']:
    print(f\"  {k['id']:<30} {k['description'][:60]}\")
"
  exit 0
fi

# Find kit in catalog
KIT=$(python3 -c "
import json, sys
with open('$CATALOG') as f:
    data = json.load(f)
for k in data['kits']:
    if k['id'] == '$KIT_ID':
        print(json.dumps(k))
        sys.exit(0)
print('')
")

if [ -z "$KIT" ]; then
  echo "❌ Kit not found: $KIT_ID"
  echo "Run './install.sh' to list available kits."
  exit 1
fi

PLATFORM=$(echo "$KIT" | python3 -c "import sys,json; print(json.load(sys.stdin)['platform'])")
PACKAGE=$(echo "$KIT" | python3 -c "import sys,json; print(json.load(sys.stdin)['package'])")
REPO=$(echo "$KIT" | python3 -c "import sys,json; print(json.load(sys.stdin)['repo'])")
NAME=$(echo "$KIT" | python3 -c "import sys,json; print(json.load(sys.stdin)['name'])")

echo "📦 Installing: $NAME"
echo "   Platform : $PLATFORM"
echo "   Repo     : $REPO"
echo ""

case "$PLATFORM" in
  flutter)
    if ! command -v flutter &>/dev/null; then
      echo "❌ Flutter not found. Install Flutter first: https://flutter.dev/docs/get-started/install"
      exit 1
    fi
    echo "Running: flutter pub add $PACKAGE"
    flutter pub add "$PACKAGE"
    echo ""
    echo "✅ $NAME added to pubspec.yaml"
    echo "   Import : import 'package:${PACKAGE}/${PACKAGE}.dart';"
    echo "   Docs   : $REPO"
    ;;
  *)
    echo "Platform '$PLATFORM' — manual install required."
    echo "Repo: $REPO"
    ;;
esac
