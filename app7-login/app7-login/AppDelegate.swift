//
//  AppDelegate.swift
//  app7-login
//
//  Created by MTWDM301-2021 on 22/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isAuthenticated = false
    var plist = UserDefaults.standard
    var navController : UINavigationController?
    
    func MainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func GetViewController(storyboard: UIStoryboard, ViewControllerName: String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: ViewControllerName)
        
    }
    
    func SetrootViewController(rootViewController: UIViewController, animate: Bool, tipo: Int) {
        if animate {
            if(tipo == 0) {
                rootViewController.title = "Vista"
                navController = UINavigationController(rootViewController: rootViewController)
                window?.rootViewController = navController
                window?.makeKeyAndVisible()
            }else {
                window?.rootViewController = rootViewController
            }
        }
        
        //MARK: Animacion
        UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromRight, animations: {
            if tipo == 0 {
                rootViewController.title = "Vista"
                self.navController = UINavigationController(rootViewController: rootViewController)
                self.window?.rootViewController = self.navController
                self.window?.makeKeyAndVisible()
            } else {
                self.window?.rootViewController = rootViewController
            }
        }, completion: nil)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        let usuario = plist.string(forKey: "usuario")
        
        if let usu = usuario {
            if usu == "mario" {
                isAuthenticated = true
            }
        }
        
        if isAuthenticated {
            let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Principal")
            
            SetrootViewController(rootViewController: viewController, animate: false, tipo: 0)
            
        } else {
            let loginViewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Login") as! LoginViewController
            
            onLoginSuccess()
            
            SetrootViewController(rootViewController: loginViewController, animate: true, tipo: 1)
        }
    }
    
    func onLoginSuccess() {
        let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Principal")
        
        SetrootViewController(rootViewController: viewController, animate: false, tipo: 0)
    }

    /*
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    } */


}

