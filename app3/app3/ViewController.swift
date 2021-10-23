//
//  ViewController.swift
//  app3
//
//  Created by MTWDM301-2021 on 24/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SliderAlfa: UISlider!
    @IBOutlet weak var lblSaludo: UILabel!
    
    
    @IBAction func onChange(_ sender: UISlider) {
        let slider = sender as! UISlider
        
        lblSaludo.textColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: CGFloat(sender.value))
        print("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblSaludo.textColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: CGFloat(SliderAlfa.value))
        // Do any additional setup after loading the view.
    }


}

