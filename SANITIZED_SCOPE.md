# Sanitized scope

This branch keeps the hosted 3105 SwiftUI panel and the track-trigger presentation path.

Removed from the Spotify tweak path:

- Premium patching groups and Premium response/data hooks;
- Premium protobuf models and Premium settings;
- Lyrics replacement hooks and unrelated Spotify UI hooks;
- IPA injection workflows.

The trigger remains in `TriggerConfiguration.swift`, `TriggerTrackDetector.swift`, and `TriggerPanelHost.swift`.

The panel source tree is retained as supplied for UI compatibility, but this source-only repository is not an IPA and has not been compiled in this environment.
