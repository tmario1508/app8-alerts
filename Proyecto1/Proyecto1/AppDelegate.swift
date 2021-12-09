//
//  AppDelegate.swift
//  Proyecto1
//
//  Created by MTWDM301-2021 on 03/12/21.
//

import UIKit
import CoreData
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isAuthenticate = false
    var plist = UserDefaults.standard
    var navController : UINavigationController?
    
    
    func MainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
        
    func GetViewController(storyboard: UIStoryboard, ViewControllerName : String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: ViewControllerName)
    }
    
    func SetrootViewController(rootViewController: UIViewController, animate: Bool, tipo: Int) {
        if animate {
            if (tipo == 0) {
                rootViewController.title = "Vista"
                navController = UINavigationController(rootViewController: rootViewController)
                window?.rootViewController = navController
                window?.makeKeyAndVisible()
            } else {
                window?.rootViewController = rootViewController
            }
        } else {
            if tipo == 0 {
                rootViewController.title = "Vista"
                navController = UINavigationController(rootViewController: rootViewController)
                window?.rootViewController = navController
                window?.makeKeyAndVisible()
            } else {
                window?.rootViewController = rootViewController
            }
        }
            
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        //MARK: Firebase
        FirebaseApp.configure()
            
        // MARK: si ya esta autenticado
        /*let usuario = plist.string(forKey: "usuario")
        if let usu = usuario {
            if usu == "mario" {
                isAuthenticate = true
            }
        }*/
            
        if isAuthenticate {
            let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "TablaAlumnos")
            SetrootViewController(rootViewController: viewController, animate: false, tipo: 0)
        }else {
            let loginViewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Login") as! LoginViewController
            OnLoginSuccess()
            SetrootViewController(rootViewController: loginViewController, animate: true, tipo: 1)
        }
            
        return true
    }
        
    func OnLoginSuccess(){
        print("Pasa por aqui")
        let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "TablaAlumnos")
        SetrootViewController(rootViewController: viewController, animate: true, tipo: 0)
    }

}

