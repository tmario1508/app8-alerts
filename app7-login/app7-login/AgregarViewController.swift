//
//  AgregarViewController.swift
//  app7-login
//
//  Created by MTWDM301-2021 on 22/10/21.
//

import UIKit

class AgregarViewController: UIViewController {

    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBAction func onAgregar(_ sender: Any) {
        let entidad = EntidadUsuario(usuario: txtUsuario.text!, pass: txtPass.text!)
        lista.append(entidad)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
