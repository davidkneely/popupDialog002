//
//  ViewController.swift
//  popupDialog002
//
//  Created by David on 11/24/17.
//  Copyright © 2017 Vision Runner. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    
    // MARK: Outlets
    
    @IBOutlet weak var label: UILabel!
    
    // MARK: Actions
    
    @IBAction func showImageDialogTapped(_ sender: UIButton) {
        showImageDialog()
    }
    
    @IBAction func showStandardDialogTapped(_ sender: UIButton) {
        showStandardDialog()
    }
    
    // MARK: Popup Dialog examples
    
    /*!
     Displays the default dialog with an image on top
     */
    func showImageDialog(animated: Bool = true) {
        
        // Prepare the popup assets
        let title = "THIS IS THE DIALOG TITLE"
        let message = "This is the message section of the PopupDialog default view"
        let image = UIImage(named: "office")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image, preferredWidth: 580)
        
        // Create first button
        let buttonOne = CancelButton(title: "CANCEL") { [weak self] in
            self?.label.text = "You canceled the image dialog"
        }
        
        // Create fourth (shake) button
        let buttonTwo = DefaultButton(title: "SHAKE", dismissOnTap: false) {
            popup.shake()
        }
        
        // Create second button
        let buttonThree = DefaultButton(title: "OK") { [weak self] in
            self?.label.text = "You ok'd the image dialog"
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        
        // Present dialog
        self.present(popup, animated: animated, completion: nil)
    }
    
    /*!
     Displays the default dialog without image, just as the system dialog
     */
    func showStandardDialog(animated: Bool = true) {
        
        // Prepare the popup
        let title = "THIS IS A DIALOG WITHOUT IMAGE"
        let message = "If you don't pass an image to the default dialog, it will display just as a regular dialog. Moreover, this features the zoom transition"
        
        // Create the dialog
        let popup = PopupDialog(title: title,
                                message: message,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                gestureDismissal: true,
                                hideStatusBar: true) {
                                    print("Completed")
        }
        
        // Create first button
        let buttonOne = CancelButton(title: "CANCEL") {
            self.label.text = "You canceled the default dialog"
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "OK") {
            self.label.text = "You ok'd the default dialog"
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        self.present(popup, animated: animated, completion: nil)
    }
}

