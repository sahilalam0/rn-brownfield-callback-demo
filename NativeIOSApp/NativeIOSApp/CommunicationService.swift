import Foundation

// Simple communication service that provides processEvents functionality
@objc class NativeCommunicationService: NSObject {
    @objc static let shared = NativeCommunicationService()
    
    override init() {
        super.init()
        NSLog("🚀 [NativeCommunicationService] Service initialized")
    }
    
    // This method will be called by the TurboModule via performSelector
    @objc func processEvents() -> String {
        // Generate random string in the native iOS app
        let randomString = "Native-\(UUID().uuidString.prefix(8))-\(Date().timeIntervalSince1970)"
        NSLog("🎲 [NativeCommunicationService] Generated random string: %@", randomString)
        return randomString
    }
}
