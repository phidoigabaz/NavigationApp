//
//  UIViewControllerExtension.swift
//  mPI
//
//  Created by Macintosh on 6/7/18.
//  Copyright © 2018 Macintosh. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    class func initWithDefaultNib() -> Self {
        let bundle = Bundle.main
        let fileManege = FileManager.default
        let nibName = String(describing: self)
        
        if let pathStoryboard = bundle.path(forResource: nibName, ofType: "storyboardc") {
            if fileManege.fileExists(atPath: pathStoryboard) {
                return initWithDefautlStoryboard()
            }
        }
        
        if let pathXib = bundle.path(forResource: nibName, ofType: "nib") {
            if fileManege.fileExists(atPath: pathXib) {
                return initWithNibTemplate()
            }
        }
        return initWithNibTemplate()
    }
    
    class func initWithNibTemplate<T>() -> T {
        var nibName = String(describing: self)
        if Constants.isIpad {
            if let pathXib = Bundle.main.path(forResource: "\(nibName)_\(Constants.iPad)", ofType: "nib") {
                if FileManager.default.fileExists(atPath: pathXib) {
                    nibName = "\(nibName)_\(Constants.iPad)"
                }
            }
        }
        let viewcontroller = self.init(nibName: nibName, bundle: Bundle.main)
        return viewcontroller as! T
    }
    
//    private class func initWithNibTemplate<T>() -> T {
//        let nibName = String(describing: self)
//        let viewcontroller = self.init(nibName: nibName, bundle: Bundle.main)
//        return viewcontroller as! T
//    }
    
    class func initWithDefautlStoryboard() -> Self {
        let className = String(describing: self)
        return instantiateFromStoryboardHelper(storyboardName: className, storyboardId: className)
    }
    
    private class func instantiateFromStoryboardHelper<T>(storyboardName: String, storyboardId: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        return controller
    }
    
    func showAlert(title: String?, message: String?, completeHanle : ((() -> Swift.Void)?)) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        
        let dismissAction = UIAlertAction(title: "Settings", style: UIAlertAction.Style.default) { (_) in
            if completeHanle != nil {
                completeHanle!()
            }
        }
        alertView.addAction(cancelAction)
        alertView.addAction(dismissAction)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        DispatchQueue.main.async {
            viewController!.present(alertView, animated: true, completion: nil)
        }
    }
    
    func showHud() {
        MBProgressHUD.hide(for: view, animated: true)
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .annularDeterminate
        hud.label.text = "Loading"
    }
    
    func hideHude() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
