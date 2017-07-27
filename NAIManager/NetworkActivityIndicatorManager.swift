
import Foundation
import UIKit

open class NetworkActivityIndicatorManager: NSObject {

    private(set) static var loadingCount: UInt = 0
    
    public static var networkingOperationsCount: UInt {
        return NAIManager.loadingCount
    }

    open class func operationStarted() {
        objc_sync_enter(NetworkActivityIndicatorManager.loadingCount)
        NetworkActivityIndicatorManager.loadingCount += 1
        NetworkActivityIndicatorManager.update()
        objc_sync_exit(NetworkActivityIndicatorManager.loadingCount)
    }

    open class func operationFinished() {
        objc_sync_enter(loadingCount)
        if NetworkActivityIndicatorManager.loadingCount > 0 {
            NetworkActivityIndicatorManager.loadingCount -= 1
        }
        NetworkActivityIndicatorManager.update()
        objc_sync_exit(NetworkActivityIndicatorManager.loadingCount)
    }
    
    private class func update() {
        #if os(iOS)
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = (NetworkActivityIndicatorManager.loadingCount > 0)
            }
        #endif
    }
}

public typealias NAIManager = NetworkActivityIndicatorManager

extension UIApplication {
    
    public var networkingOperationsCount: UInt {
        return NAIManager.networkingOperationsCount
    }
    
    public func networkingOperationStarted() {
        NAIManager.operationStarted()
    }
    
    public func networkingOperationFinished() {
        NAIManager.operationFinished()
    }
}

extension UIApplication {
    
    public static var networkingOperationsCount: UInt {
        return NAIManager.networkingOperationsCount
    }
    
    public class func networkingOperationStarted() {
        NAIManager.operationStarted()
    }
    
    public class func networkingOperationFinished() {
        NAIManager.operationFinished()
    }
}


