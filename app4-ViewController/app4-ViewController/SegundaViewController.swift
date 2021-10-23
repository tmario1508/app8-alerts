//
//  SegundaViewController.swift
//  app4-ViewController
//
//  Created by MTWDM301-2021 on 01/10/21.
//

import UIKit

class SegundaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var datosArray: [String] = []
    
    @IBOutlet weak var tabla: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = datosArray[indexPath.row]
        return cell
    }
    

    //var dato2 : String = ""
    var dato3 : String = ""

    @IBOutlet weak var lblDato: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lblDato.text = dato
        //lblDato.text = dato2
        datosArray.append(dato3)
        
        tabla.reloadData()
        // Do any additional setup after loading the view.
    }
    



}
