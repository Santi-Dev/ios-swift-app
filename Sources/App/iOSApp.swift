#if canImport(SwiftUI)
import SwiftUI

@main
struct iOSApp: App {
    @StateObject private var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
    }
}
#endif
