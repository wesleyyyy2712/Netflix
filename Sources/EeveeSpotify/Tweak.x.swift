import Orion
import UIKit

/// Hook group dedicated only to observing the Spotify player for the hosted panel trigger.
struct TriggerPanelHookGroup: HookGroup { }

struct EeveeSpotify: Tweak {
    static let version = "hosted-panel"

    init() {
        TriggerPanelHookGroup().activate()
    }
}
