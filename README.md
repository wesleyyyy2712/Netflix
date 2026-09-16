# Hosted 3105 Panel Integration

This repository contains a source-only integration of the real 3105 SwiftUI interface into a host process, with a configured track trigger for presenting the panel.

## Scope

The project keeps the panel UI, its state objects, resources, and the trigger presentation path. The trigger monitors the current Spotify player track and presents the panel when the configured track identifier is detected. The panel is dismissed when the track changes.

The Premium patching modules, Premium response hooks, lyrics replacement hooks, unrelated Spotify UI hooks, and IPA-injection workflows were removed. This repository does not generate or distribute a modified Spotify IPA.

## Trigger configuration

Edit `Sources/EeveeSpotify/TriggerConfiguration.swift`:

```swift
static let trackIdentifier = "0wwPcA6wtMf6HUMpIRdeP7"
```

Set the value to the Spotify track identifier you want to use as the trigger. The empty string disables the trigger.

## Build status

This is a source integration. The current environment does not include Xcode, the iPhoneOS SDK, or Theos, so an IPA/DEB build was not performed. GitHub Actions runs source checks only.

See [HOSTED_PANEL_INTEGRATION.md](HOSTED_PANEL_INTEGRATION.md), [SANITIZED_SCOPE.md](SANITIZED_SCOPE.md), and [BUILD_LIMITATIONS.md](BUILD_LIMITATIONS.md) for details.
