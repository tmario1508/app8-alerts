//
//  ViewController.swift
//  app2
//
//  Created by MTWDM301-2021 on 24/09/21.
//

import UIKit

class ViewController: UIViewController {
    var contador = 0
    
    
    @IBAction func onContadorPress(_ sender: Any) {
        contador = contador + 1
        lblContador.text = String(contador)
        
    }
    
    
    @IBOutlet weak var lblContador: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

