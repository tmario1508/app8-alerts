//
//  LoginViewController.swift
//  app7-login
//
//  Created by MTWDM301-2021 on 22/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var plist = UserDefaults.standard
    
    
    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    
    @IBAction func OnLogin(_ sender: Any) {
        let usuario = txtUsuario.text
        let pass = txtPass.text
        
        for item in lista {
            if usuario == item.usuario && pass == item.pass {
                plist.set(usuario, forKey: "usuario")
                appDelegate.onLoginSuccess()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
