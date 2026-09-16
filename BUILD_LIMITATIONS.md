# Build limitations

This repository contains the integrated source project and the hosted trigger-panel adaptation.

The IPA-injection workflows were intentionally removed. This environment does not have Xcode, the iPhoneOS SDK, or Theos, so no IPA or DEB was built here.

The hosted panel path keeps the UI integration and trigger logic, while the standalone device-access/exploit path is not automatically started from the Spotify-hosted view.
