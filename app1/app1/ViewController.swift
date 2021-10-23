//
//  ViewController.swift
//  app1
//
//  Created by MTWDM301-2021 on 24/09/21.
//

import UIKit

class ViewController: UIViewController {
    var contador = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblContador.text = String(contador)
    }

    @IBAction func onContar(_ sender: Any) {
        contador = contador + 1
        lblContador.text = String(contador)
    }
    
    
    /*@IBAction func onResetear(_ sender: Any) {
        contador = 0
        lblContador.text = "0"
    }*/
    
    @IBOutlet weak var lblContador: UILabel!
}

