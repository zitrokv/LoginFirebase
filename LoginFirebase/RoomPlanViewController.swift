//
//  RoomPlanViewController.swift
//  LoginFirebase
//
//  Created by Mañanas on 17/9/24.
//

import Foundation
import UIKit

class RoomPlanViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Disable back button
        self.navigationItem.setHidesBackButton(true, animated: false)
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

    
   
}
