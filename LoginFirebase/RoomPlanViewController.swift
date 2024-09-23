//
//  RoomPlanViewController.swift
//  LoginFirebase
//
//  Created by Mañanas on 17/9/24.
//

import Foundation
import UIKit

class RoomPlanViewController: UITableViewController {
    
    @IBOutlet weak var tiempoParadoViewCell: UITableViewCell!
    
    @IBOutlet weak var tiempoParadoLabel: UILabel!
    
    
    //* botones Nuevo Reposo *//
    @IBAction func nuevoResposoButton(_ sender: Any) {
        self.performSegue(withIdentifier: "newMissedBeat", sender: self)
    }
    
    func creaNuevoReposo(_ indexTag: Int){
        self.performSegue(withIdentifier: "newMissedBeat", sender: self)
        //self.tiempoParadoLabel.text = "01:20"
    }
    
    
    
    //* botones Directos Nuevo Reposo *//
    
    @IBAction func reposoDirecto11(_ sender: UIButton) {
        creaNuevoReposo(sender.tag)
    }
    
    @IBAction func reposoDirecto12(_ sender: UIButton) {
        creaNuevoReposo(sender.tag)
    }
    
    @IBAction func reposoDirecto13(_ sender: UIButton) {
        creaNuevoReposo(sender.tag)
    }
    
    @IBAction func reposoDirecto14(_ sender: UIButton) {
        creaNuevoReposo(sender.tag)
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Disable back button
        self.navigationItem.setHidesBackButton(true, animated: false)
        tiempoParadoLabel.text = "hola que tal"
      }
      
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          // Hide navigation bar
          self.navigationController?.isNavigationBarHidden = true
          
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          // Show navigation bar
          self.navigationController?.isNavigationBarHidden = false
      }

    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "newMissedBeat") {
            let viewController = segue.destination as! NewMissedBeat
            
            //let indexPath = tableView.indexPathForSelectedRow!
            
            viewController.tiempoActividadLabel.text = "01:23"
            viewController.ActividadHeaderImage.image = UIImage(systemName: "book.pages")
            
            //tableView.deselectRow(at: indexPath, animated: false)
        }
    }*/
    
   
}
