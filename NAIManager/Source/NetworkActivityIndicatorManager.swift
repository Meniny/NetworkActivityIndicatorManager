
import Foundation
import UIKit

open class NetworkActivityIndicatorManager: NSObject {

    private(set) static var loadingCount: UInt = 0

    open class func operationStarted() {

        #if os(iOS)
        objc_sync_enter(NetworkActivityIndicatorManager.loadingCount)
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = (NetworkActivityIndicatorManager.loadingCount == 0)
        }
        NetworkActivityIndicatorManager.loadingCount += 1
        objc_sync_exit(NetworkActivityIndicatorManager.loadingCount)
        #endif
    }

    open class func operationFinished() {
        objc_sync_enter(loadingCount)
        if NetworkActivityIndicatorManager.loadingCount > 0 {
            NetworkActivityIndicatorManager.loadingCount -= 1
        }
        #if os(iOS)
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = (NetworkActivityIndicatorManager.loadingCount == 0)
        }
        #endif
        objc_sync_exit(NetworkActivityIndicatorManager.loadingCount)
    }
}

public typealias NAIManager = NetworkActivityIndicatorManager
