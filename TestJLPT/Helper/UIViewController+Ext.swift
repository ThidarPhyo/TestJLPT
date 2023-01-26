//
//  UIViewController+Ext.swift
//  TestJLPT
//
//  Created by cmStudent on 12/01/2023.
//

import UIKit

extension UIViewController {
    
    func alertWithTextField(with title: String,
                            _ message: String,
                            _ actionButtonTitle:String,
                            _ cancelButtonTitle: String,
                            _ placeholder: String,
                            completion: @escaping(String) -> ()) {
        let alertConroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertConroller.addTextField { textField in
            textField.placeholder = placeholder
            
        }
        
        let actionButton = UIAlertAction(title: actionButtonTitle, style: .default) { action in
            completion(alertConroller.textFields?[0].text ?? "")
            
            
        }
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        alertConroller.addAction(actionButton)
        alertConroller.addAction(cancelButton)
        present(alertConroller, animated: true)
    }
    
}
