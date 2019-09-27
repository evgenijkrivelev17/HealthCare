//
//  TitleTextField.swift
//  HealthCare
//
//  Created by Евгений on 9/25/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

public class TitleTextField: UIView, UITextFieldDelegate {
    
    private var textSize: CGFloat =  20
    private var placeHolderSize: CGFloat = 15
    
    private var textLabel:CATextLayer!
    private var textField:UITextField!
    private var shapeLineLayer: CAShapeLayer!
    
    @objc dynamic var text:String = ""
    public var TIME_ANIMATION:uint = 1
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.Initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.Initialize()
    }
    
    private func Initialize(){
        self.textField = UITextField()
        self.addSubview(textField)
        
        self.textLabel = CAVerticalTextLayer()
        self.layer.addSublayer(textLabel)
        
        self.shapeLineLayer = CAShapeLayer()
        self.textField.layer.addSublayer(shapeLineLayer)
        self.SetBackgroundColor()
    }
    
    private func InitializeLabel(){
        self.textLabel.foregroundColor = UIColor.black.cgColor
        self.textLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height * 0.3)
        self.textLabel.string = "placeholder"
        self.textLabel.font = UIFont(name: "Avenir-Black", size: self.placeHolderSize)
        self.textLabel.fontSize = self.placeHolderSize
        self.textLabel.contentsScale = UIScreen.main.scale
    }
    
    private func InitializeTextField(){
        self.textField.textColor = .black
        self.textField.frame = CGRect(x: 0, y: self.bounds.height * 0.3, width: self.bounds.width, height: self.bounds.height * 0.7)
        self.textField.font = UIFont(name: "Avenir-Black", size: self.textSize)
        self.textField.text = ""
        self.textField.layer.masksToBounds = true
        self.textField.addTarget(self, action: #selector(chagngedTextField), for: .editingChanged)
        self.textField.addTarget(self, action: #selector(toTopPositionPlaceholder), for: .touchDown)
        self.textField.delegate = self
    }
    
    private func InitializeLineLayer() {
        self.shapeLineLayer.frame = self.textField.bounds
        self.shapeLineLayer.lineWidth = 5
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: self.shapeLineLayer.bounds.height-4, width:self.shapeLineLayer.bounds.width, height: 4), cornerRadius: 0)
        self.shapeLineLayer.path = path.cgPath
        self.shapeLineLayer.fillColor = UIColor.darkGray.cgColor
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.InitializeTextField()
        self.InitializeLineLayer()
        self.InitializeLabel()
    }
    
    
    @objc func checkPositionPlaceHolder(_ timeInterval: TimeInterval) {
        guard self.textField.text!.count > 0 else {
            self.lowPositionPaceholder(timeInterval)
            return
        }
        self.topPositionPlaceholder(timeInterval)
    }
    
    
    @objc func toTopPositionPlaceholder() {
        self.topPositionPlaceholder(TimeInterval(self.TIME_ANIMATION))
    }
    
    private func lowPositionPaceholder(_ timeInterval: TimeInterval) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(timeInterval)
        
        let fontSizeANimation = CABasicAnimation(keyPath: "fontSize")
        fontSizeANimation.duration = timeInterval
        fontSizeANimation.repeatCount = 0
        fontSizeANimation.fromValue = self.textLabel.fontSize
        fontSizeANimation.toValue = self.textSize
        
        self.textLabel.add(fontSizeANimation, forKey: nil)
        self.textLabel.frame = CGRect(x: 0, y: self.bounds.height * 0.3, width: self.bounds.width, height: self.bounds.height * 0.7)
        
        CATransaction.commit()
    }
    
    private func topPositionPlaceholder(_ timeInterval: TimeInterval) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(timeInterval)
        
        let fontSizeANimation = CABasicAnimation(keyPath: "fontSize")
        fontSizeANimation.duration = timeInterval
        fontSizeANimation.repeatCount = 0
        fontSizeANimation.fromValue = self.textLabel.fontSize
        fontSizeANimation.toValue = self.placeHolderSize
        
        self.textLabel.add(fontSizeANimation, forKey: nil)
        
        CATransaction.commit()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.checkPositionPlaceHolder(TimeInterval(self.TIME_ANIMATION))
        return true
    }
    
    
    @objc func chagngedTextField(_ textField: UITextField) {
        self.text = textField.text ??  ""
    }
    
    public func SetBackgroundColor(_ color:UIColor = .white) {
        self.textField.backgroundColor = color
    }
    
    public func SetFontPlaceHolder(_ font: UIFont) {
        self.textLabel.font = font
    }
    
    public func SetPlaceHolderSize(_ size:CGFloat){
        self.placeHolderSize = size
    }
    
    public func SetColorPlaceHolder(_ color: UIColor) {
        self.textLabel.foregroundColor = color.cgColor
    }
    
    public func SetFontText(_ font: UIFont) {
        self.textField.font = font
    }
    
    public func SetColorText(_ color: UIColor) {
        self.textField.textColor = color
    }
    
    public func SetTextSize(_ size: CGFloat) {
        self.textSize = size
    }
    
    override public func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        self.checkPositionPlaceHolder(0.0)
    }
}
