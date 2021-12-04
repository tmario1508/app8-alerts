//
//  PersonasTableViewController.swift
//  App10-SQLite
//
//  Created by MTWDM301-2021 on 12/11/21.
//

import UIKit
import CoreData


class PersonasTableViewController: UITableViewController {
    
    var objUtilidades: Utilidades?
    var searchController: UISearchController?
    var objPersona: Persona?
    var listaPersonas = [NSManagedObject]()
    var controlador: UIViewController?
    
    //MARK: Declaracion de los IBOutlet
    @IBOutlet weak var btnEditar: UIBarButtonItem!
    
    //MARK: Declaracion de los IBAction
    @IBAction func onEditar(_ sender: Any) {
        if tableView.isEditing {
            btnEditar.title = "Editar"
            tableView.setEditing(false, animated: true)
            
        }else {
            btnEditar.title = "Listo"
            tableView.setEditing(true, animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objUtilidades = Utilidades(_controlador: self)
        controlador = self
        habilitarBarraBusquedaController()
    }
    
    func habilitarBarraBusquedaController() {
        if #available(iOS 11.0, *) {
            searchController = UISearchController(searchResultsController: nil)
            searchController?.hidesNavigationBarDuringPresentation = true
            
            searchController?.obscuresBackgroundDuringPresentation = true
            searchController?.searchBar.searchBarStyle = .minimal
            searchController?.searchBar.placeholder = "Buscar"
            searchController?.searchBar.isHidden = false
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationController?.navigationBar.prefersLargeTitles = true
            searchController?.searchBar.delegate = self
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaPersonas.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellPersona", for: indexPath)
        let p : Persona? = listaPersonas[indexPath.row] as? Persona
        
        if cell != nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellPersona")
            cell.textLabel?.text = p?.nombre
            cell.detailTextLabel?.text = p?.rfc
            cell.accessoryType = .detailButton
        }

        

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Eliminar"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let p: Persona? = listaPersonas[indexPath.row] as? Persona
        let msg = "Empresa: \((p?.nombre)!)\nDomicilio: \((p?.domicilio)!) \nRFC: \((p?.rfc)!) \nRepresentanteLegal: \((p?.representante)!)"
        
        objUtilidades?.Mensaje(titulo: "Datos", mensaje: msg, tipo: .Sheet)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let p: Persona? = listaPersonas[indexPath.row] as? Persona
        let controller = controlador!.storyboard?.instantiateViewController(withIdentifier: "EditarViewController") as! EditarViewController
        
        controller.p = p
        controlador!.navigationController?.modalPresentationStyle = .custom
        controlador!.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        
        case.delete:
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let p : Persona? = listaPersonas[indexPath.row] as? Persona
            managedContext.delete(p!)
            listaPersonas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        do {
            try managedContext.save()
            LlenarTabla(dato: "")
        } catch let error as NSError {
            print("\(error.userInfo)")
        }
        case .none: print("No aplica")
        default: break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        LlenarTabla(dato: "")
    }
    
    func LlenarTabla(dato: String?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<Persona> = Persona.fetchRequest()
        
        if dato != "" {
            let resultPredicate = NSPredicate(format: "nombre contains[c] %@", dato!)
            fetchRequest.predicate = resultPredicate
        }
        
        do {
            let resultados = try managedContext.fetch(fetchRequest)
            listaPersonas = resultados as [NSManagedObject]
            
        }catch let error as NSError {
            print("Error \(error) \(error.userInfo)")
        }
    }

}

extension PersonasTableViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let capturaDato = searchText
        print("Dato introducido \(capturaDato) ")
        LlenarTabla(dato: capturaDato)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        LlenarTabla(dato: "")
    }
}
