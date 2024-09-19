//
//  RoomPlanViewController.swift
//  LoginFirebase
//
//  Created by Mañanas on 17/9/24.
//

import Foundation
import UIKit
import RoomPlan

class RoomPlanViewController: UITableViewController, RoomCaptureViewDelegate {
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var exportButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    var roomCaptureView: RoomCaptureView!

    var finalResults: CapturedRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomCaptureView = RoomCaptureView(frame: view.bounds)
        roomCaptureView.delegate = self
        view.insertSubview(roomCaptureView, at: 0)
        // Disable back button
          self.navigationItem.setHidesBackButton(true, animated: false)
      }
      
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          // Hide navigation bar
          self.navigationController?.isNavigationBarHidden = true
          roomCaptureView?.captureSession.run(configuration: RoomCaptureSession.Configuration())
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          // Show navigation bar
          self.navigationController?.isNavigationBarHidden = false
      }

    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         roomCaptureView?.captureSession.run(configuration: RoomCaptureSession.Configuration())
    }
        @IBAction func doneButtonPressed(_ sender: UIButton) {
        roomCaptureView?.captureSession.stop()
        doneButton.isHidden = true
    }
    
    
    
    func captureView(didPresent: CapturedRoom, error: Error?) {
        statusLabel.isHidden = false
            statusLabel.text = error == nil ? "The scan was successfully completed" :
                                          "An error occurred during the scan: \(error)"
        finalResults = didPresent
        exportButton.isHidden = false
    }
    
    @IBAction func exportButtonPressed(_ sender: UIButton) {
        let filename = "Room.usdz"
        let destinationURL = FileManager.default.temporaryDirectory.appending(path: filename)
        do {
            try finalResults?.export(to: destinationURL)
            
            let activityController = UIActivityViewController(activityItems: [destinationURL], applicationActivities: nil)
            
                  // For an iPad:
            if let popoverController = activityController.popoverPresentationController {
                               popoverController.sourceView = exportButton
                           }
                       
                       present(activityController, animated: true, completion: nil)
                   }
               catch {
                       let alertController = UIAlertController(
                               title: "Export error", message: "An error occurred during the export:  \(error)", preferredStyle: .alert)
                       alertController.addAction(UIAlertAction(title: "OK", style: .default))
                       self.present(alertController, animated: true, completion: nil)
                   }
           }
}
//Read more at https://www.it-jim.com/blog/apple-roomplan-api/
