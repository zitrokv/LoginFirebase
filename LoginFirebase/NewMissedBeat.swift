//
//  NewMissedBeat.swift
//  LoginFirebase
//
//  Created by Mañanas on 23/9/24.
//

import Foundation
import UIKit
class NewMissedBeat: UIViewController {
    
    @IBOutlet weak var tiempoActividadLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ActividadHeaderImage: UIImageView!
    
    var ActividadList: [Accion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Nueva Actividad")
        self.showToast(message: "Nueva Actividad", seconds: 3)
        
    }

    
    
    
}
