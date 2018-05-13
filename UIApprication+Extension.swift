//
//  UIApprication+Extension.swift
//
//
//  Created by Yuta S. on 2018/05/07.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import Foundation

extension UIApplication {
    /// 画面の最前面を取得する
    ///
    /// - Parameter controller: ルートビューコントローラ
    /// - Returns: 表示されている画面の最前面
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
