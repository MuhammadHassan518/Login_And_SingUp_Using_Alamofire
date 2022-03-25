//
//  AlertController.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import Foundation
import UIKit

extension UIViewController{
    
    // Global Alert
    // Define Your number of buttons, styles and completion
    
    
   
    
    public func openAlert(title: String,
                          message: String,
                          alertStyle:UIAlertController.Style,
                          actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)]){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        present(alertController, animated: true)
        
    }

}
