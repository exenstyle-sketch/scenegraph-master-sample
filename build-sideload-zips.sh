#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$ROOT_DIR/dist"
APPS=(
  "DeepLinking"
  "DetailsScreen"
  "EpisodesScreen"
  "GridScreen"
  "Subscriptions"
  "VideoAds"
  "VideoPlayer"
)

mkdir -p "$DIST_DIR"
rm -f "$DIST_DIR"/*.zip

for app in "${APPS[@]}"; do
  app_dir="$ROOT_DIR/$app"
  if [[ ! -d "$app_dir" ]]; then
    echo "Missing app folder: $app" >&2
    exit 1
  fi

  for required in manifest components source images; do
    if [[ ! -e "$app_dir/$required" ]]; then
      echo "App '$app' is not sideload-ready: missing $required" >&2
      exit 1
    fi
  done

done

(
  cd "$ROOT_DIR"
  zip -r "$DIST_DIR/scenegraph-master-sample-all-in-one.zip" . \
    -x '.git/*' 'dist/*' '*.zip'
)

for app in "${APPS[@]}"; do
  (
    cd "$ROOT_DIR/$app"
    zip -r "$DIST_DIR/${app}-sideload.zip" .
  )
done

echo "Created ZIPs in $DIST_DIR"
