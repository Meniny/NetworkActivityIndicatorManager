
import Foundation
import UIKit

open class NetworkActivityIndicatorManager: NSObject {

    private static var loadingCount: Int = 0

    open class func operationStarted() {

        #if os(iOS)
        objc_sync_enter(loadingCount)
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        loadingCount += 1
        objc_sync_exit(loadingCount)
        #endif
    }

    open class func operationFinished() {
        objc_sync_enter(loadingCount)
        #if os(iOS)
        if loadingCount > 0 {
            loadingCount -= 1
        }
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        objc_sync_exit(loadingCount)
        #endif
    }
}

public typealias NAIManager = NetworkActivityIndicatorManager
