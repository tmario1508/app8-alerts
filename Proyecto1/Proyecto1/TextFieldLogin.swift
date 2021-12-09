//
//  TextFieldLogin.swift
//  Proyecto1
//
//  Created by MTWDM301-2021 on 08/12/21.
//

import UIKit

class TextFieldLogin: UITextField {

    override func awakeFromNib() {
            super.awakeFromNib()
            ConfigurarPropiedades()
            
        }

        func ConfigurarPropiedades() {
            self.borderStyle = .none
            self.textColor = UIColor.red
            self.layer.borderColor = UIColor.blue.cgColor
            self.layer.borderWidth = 0.5
            self.layer.cornerRadius = 15
            self.frame.size = CGSize(width: self.frame.width, height: 80)
            
        }
        
        @IBInspectable var padding: CGFloat = 0
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 8, height: bounds.height)
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 8, height: bounds.height)
        }

}
