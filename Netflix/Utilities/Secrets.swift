import Foundation

/// Runtime configuration for the TMDB API.
///
/// The key is intentionally read from the process environment so it is not
/// committed to source control. Set TMDB_API_KEY in the Xcode scheme or in
/// the CI environment when API-backed screens are used.
enum Secrets {
    static func getAPIKey() -> String {
        ProcessInfo.processInfo.environment["TMDB_API_KEY"] ?? ""
    }
}
