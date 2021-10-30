//
//  ViewController.swift
//  app7-login
//
//  Created by MTWDM301-2021 on 22/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var plist = UserDefaults.standard
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBAction func onSalir(_ sender: Any) {
        plist.removeObject(forKey: "usuario")
        
        let mainStoryBoard = appDelegate.MainStoryBoard()
        
        let viewController = appDelegate.GetViewController(storyboard: mainStoryBoard, ViewControllerName: "Login")
        
        appDelegate.SetrootViewController(rootViewController: viewController, animate: true, tipo: 1)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

