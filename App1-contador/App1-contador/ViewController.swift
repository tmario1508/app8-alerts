//
//  ViewController.swift
//  App1-contador
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

    @IBOutlet weak var lblContador: UILabel!
    
    @IBAction func onContar(_ sender: Any) {
        contador = contador + 1
        lblContador.text = String(contador)
    }
}

