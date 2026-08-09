import Foundation
#if canImport(Combine)
import Combine
class AppData: ObservableObject {
    @Published var counter: Int = 0
    func incrementCounter() { counter += 1 }
    func resetCounter() { counter = 0 }
}
#else
class AppData {
    var counter: Int = 0
    func incrementCounter() { counter += 1 }
    func resetCounter() { counter = 0 }
}
#endif
