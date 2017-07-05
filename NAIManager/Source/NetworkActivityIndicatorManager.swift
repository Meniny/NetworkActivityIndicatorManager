
import UIKit

open class NetworkActivityIndicatorManager: NSObject {

    private static var loadingCount: Int = 0

    open class func operationStarted() {

        #if os(iOS)
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        loadingCount += 1
        #endif
    }

    open class func operationFinished() {
        #if os(iOS)
        if loadingCount > 0 {
            loadingCount -= 1
        }
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        #endif
    }
}

public typealias NAIManager = NetworkActivityIndicatorManager
