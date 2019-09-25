//
//  TitleTextField.swift
//  HealthCare
//
//  Created by Евгений on 9/25/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

public class TitleTextField: UIView {
    
    var textLabel:UILabel!
    var textField:UITextField!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.Initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.Initialize()
    }
    
    private func Initialize(){
        self.textLabel = UILabel()
        self.textField = UITextField()
        self.addSubview(textField)
        self.addSubview(textLabel)
    }
    
    private func InitializeLabel(){
        self.textLabel.textColor = UIColor.gray
        self.textLabel.frame = self.bounds
        self.textLabel.text = "placeholder"
        self.textLabel.font = UIFont(name: "Avenir-Black", size: 12)
        self.textLabel.layoutIfNeeded()
    }
    
    private func InitializeTextField(){
        self.textField.textColor = .black
        self.textField.font = UIFont(name: "Avenir-Black", size: 12)
        self.textField.text = "Simple Text"
        self.textField.backgroundColor = .green
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.InitializeTextField()
        self.InitializeLabel()
    }
}
