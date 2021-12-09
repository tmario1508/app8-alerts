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
            
            
        if isAuthenticate {
            let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Alumnos")
            SetrootViewController(rootViewController: viewController, animate: false, tipo: 0)
        }else {
            let loginViewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Login") as! LoginViewController
            OnLoginSuccess()
            SetrootViewController(rootViewController: loginViewController, animate: true, tipo: 1)
        }
            
        return true
    }
        
    func OnLoginSuccess(){
        let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Alumnos")
        SetrootViewController(rootViewController: viewController, animate: true, tipo: 0)
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "appSQLITE")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

