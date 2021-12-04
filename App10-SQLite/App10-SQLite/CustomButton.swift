//
//  CustomButton.swift
//  App10-SQLite
//
//  Created by MTWDM301-2021 on 12/11/21.
//

import UIKit

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ConfigurarPropiedades()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ConfigurarPropiedades()
    }
    
    convenience init(rect: CGRect) {
        self.init(frame: rect)
        ConfigurarPropiedades()
    }

    func ConfigurarPropiedades() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = UIColor.red.cgColor
        self.setTitleColor(UIColor .white, for: .normal)
        self.frame.size = CGSize(width: 200, height: 40)
        self.titleLabel?.font = UIFont(name: "Arial", size: 18)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.4
        
    }

}
