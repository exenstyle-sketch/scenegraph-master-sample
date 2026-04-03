# Roku Sideload Packaging Guide

Each app in this repository is already kept in a normal, sideload-ready folder.

## Sideload-ready app folders

Zip the **contents** of exactly one folder below (not the repository root) when sideloading a single app:

- `DeepLinking/`
- `DetailsScreen/`
- `EpisodesScreen/`
- `GridScreen/`
- `Subscriptions/`
- `VideoAds/`
- `VideoPlayer/`

Each of these folders includes the expected Roku app structure at folder root:

- `manifest`
- `components/`
- `source/`
- `images/`

## Generate all sideload ZIPs

Run:

```bash
./build-sideload-zips.sh
```

The script creates these files in `dist/` (without committing binaries):

- `scenegraph-master-sample-all-in-one.zip`
- `DeepLinking-sideload.zip`
- `DetailsScreen-sideload.zip`
- `EpisodesScreen-sideload.zip`
- `GridScreen-sideload.zip`
- `Subscriptions-sideload.zip`
- `VideoAds-sideload.zip`
- `VideoPlayer-sideload.zip`
