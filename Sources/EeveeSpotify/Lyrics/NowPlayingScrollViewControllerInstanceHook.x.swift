import Orion
import UIKit

var statefulPlayer: StatefulPlayerImplementation?

/// Hooks only the player-provider methods needed to observe the configured trigger track.
class LegacyNowPlayingPlatformSwiftServiceImplementationHook: ClassHook<NSObject> {
    typealias Group = TriggerPanelHookGroup
    static let targetName = "NowPlaying_PlatformImpl.NowPlayingPlatformSwiftServiceImplementation"

    func provideStatefulPlayer() -> StatefulPlayerImplementation {
        statefulPlayer = orig.provideStatefulPlayer()
        if let statefulPlayer {
            TriggerTrackDetector.shared.attach(to: statefulPlayer)
        }
        return statefulPlayer!
    }
}

class NowPlayingPlatformSwiftServiceImplementationHook: ClassHook<NSObject> {
    typealias Group = TriggerPanelHookGroup
    static let targetName = "NowPlaying_PlatformImpl.NowPlayingPlatformSwiftServiceImplementation"

    func provideStatefulPlayerWithFeatureIdentifier(_ identifier: NSString) -> StatefulPlayerImplementation {
        statefulPlayer = orig.provideStatefulPlayerWithFeatureIdentifier(identifier)
        if let statefulPlayer {
            TriggerTrackDetector.shared.attach(to: statefulPlayer)
        }
        return statefulPlayer!
    }
}
