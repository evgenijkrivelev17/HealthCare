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
    
    public var textSize: CGFloat =  20 {
        didSet {
            self.textField?.font = UIFont(name: self.textField?.font?.fontName ?? "Avenir", size: textSize)
        }
    }
    
    public var textColor: UIColor  = .white {
        didSet {
            self.textLabel?.foregroundColor = textColor.cgColor
        }
    }
    
    public var succesColor: UIColor = .green
    public var errorColor: UIColor = .red
    
    public var placeHolderSize: CGFloat = 15 {
        didSet {
            self.textLabel?.fontSize = self.placeHolderSize
        }
    }
    
    public var placeHolderColor: UIColor = .black {
        didSet {
            self.textLabel?.foregroundColor = self.placeHolderColor.cgColor
        }
    }
    
    public var placeHolderFont: UIFont = UIFont(name: "Avenir", size: 18)! {
        didSet {
            self.textLabel?.font = self.placeHolderFont
        }
    }
    
    public var textLabel:CATextLayer!
    private var textField:UITextField!
    private var shapeLineLayer: CAShapeLayer!
    private var successLineLayer: CAShapeLayer!
    public var currentStateTextField: stateField?
    
    @objc public dynamic var text: String = ""
    public var errorText: String = ""
    
    public var TIME_ANIMATION: Float = 2
    
    private var placeHolderText: String = "" {
        didSet{
            self.textLabel?.string = placeHolderText
        }
    }
    
    public var ValidationCommand:((String) -> Bool)?
    
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
        
        self.successLineLayer = CAShapeLayer()
        self.textField.layer.addSublayer(successLineLayer)
    }
    
    private func InitializePlaceHolderView() {
        self.textLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height * 0.3)
        self.textLabel.font = UIFont(name: "Avenir-Black", size: self.placeHolderSize)
        self.textLabel.fontSize = self.placeHolderSize
        self.textLabel.contentsScale = UIScreen.main.scale
    }
    
    private func InitializeTextFieldView() {
        self.textField.frame = CGRect(x: 0, y: self.bounds.height * 0.3, width: self.bounds.width, height: self.bounds.height * 0.7)
        self.textField.font = UIFont(name: "Avenir-Black", size: self.textSize)
        self.textField.addTarget(self, action: #selector(chagngedTextField), for: .editingChanged)
        self.textField.addTarget(self, action: #selector(toTopPositionPlaceholder), for: .touchDown)
        self.textField.addTarget(self, action: #selector(getFocused), for: .editingDidBegin)
         self.textField.addTarget(self, action: #selector(checkPositionPlaceHolder), for: .editingDidEnd)
        self.textField.delegate = self
    }
    
    private func InitializeLinesLayerView() {
        self.shapeLineLayer.frame = self.textField.bounds
        self.shapeLineLayer.path = CGPath(roundedRect: CGRect(x: 0, y: self.shapeLineLayer.bounds.height-4, width: self.shapeLineLayer.bounds.width, height: 4), cornerWidth: 2, cornerHeight: 2, transform: nil)
        self.shapeLineLayer.fillColor = UIColor.darkGray.cgColor
        
        self.successLineLayer.frame = self.textField.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.successLineLayer.bounds.height-2))
        path.addLine(to: CGPoint(x: self.successLineLayer.bounds.width, y: self.successLineLayer.bounds.height-2))
        
        self.successLineLayer.path = path.cgPath
        self.successLineLayer.strokeColor = UIColor.clear.cgColor
        self.successLineLayer.lineWidth = 4
        self.successLineLayer.cornerRadius = 2
        
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    @objc private func getFocused() {
        topPositionPlaceholder(TimeInterval(TIME_ANIMATION))
    }
    
    @objc func checkPositionPlaceHolder(_ timeInterval: TimeInterval = 2.0) {
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
        UIView.animate(withDuration: timeInterval, animations: {
          self.textLabel.frame = CGRect(x: 0, y: self.bounds.height * 0.3, width: self.bounds.width, height: self.bounds.height * 0.7)
          self.textLabel.fontSize = self.textSize
        })
    }
    
    private func topPositionPlaceholder(_ timeInterval: TimeInterval) {
        UIView.animate(withDuration: timeInterval, animations: {
            self.textLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height * 0.3)
            self.textLabel.fontSize = self.placeHolderSize
        })
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.checkPositionPlaceHolder(TimeInterval(self.TIME_ANIMATION))
        return true
    }
    
    
    @objc func chagngedTextField(_ textField: UITextField) {
        self.text = textField.text ??  ""
        if self.ValidationCommand != nil {
            self.checkValidationField()
        }
    }
    
    private func checkValidationField() {
        let result = self.ValidationCommand!(self.text)
        let tempState = result ? stateField.valid : stateField.nonvalid
        if tempState != self.currentStateTextField {
            self.currentStateTextField = tempState
            if result {
                self.updateValidView()
            }
            else {
               self.updateNonValidView()
            }
        }
    }
    
    private func updateValidView() {
        CATransaction.begin()
            let faildGroupAnimation = CAAnimationGroup()
            faildGroupAnimation.duration = CFTimeInterval(self.TIME_ANIMATION)
            faildGroupAnimation.repeatCount = 0
            
            let shapeLineColorAnimation = CABasicAnimation(keyPath: "strokeColor")
            shapeLineColorAnimation.fromValue = self.shapeLineLayer.strokeColor
            shapeLineColorAnimation.toValue = self.succesColor.cgColor
        
            let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
            strokeAnimation.fromValue = 0
            strokeAnimation.toValue = 1
            
            faildGroupAnimation.animations = [shapeLineColorAnimation , strokeAnimation]
            self.successLineLayer.add(faildGroupAnimation, forKey: nil)
        
        CATransaction.setCompletionBlock({
            self.successLineLayer.strokeEnd = 1
            self.successLineLayer.strokeColor = self.succesColor.cgColor
            
            self.textLabel.foregroundColor = self.textColor.cgColor
            self.textLabel.string = self.placeHolderText
        })
        CATransaction.commit()
    }
    
    private func updateNonValidView() {
           CATransaction.begin()
               let faildGroupAnimation = CAAnimationGroup()
               faildGroupAnimation.duration = CFTimeInterval(self.TIME_ANIMATION)
               faildGroupAnimation.repeatCount = 0
               
               let shapeLineColorAnimation = CABasicAnimation(keyPath: "strokeColor")
               shapeLineColorAnimation.fromValue = self.shapeLineLayer.strokeColor
               shapeLineColorAnimation.toValue = self.errorColor.cgColor
           
               let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
               strokeAnimation.fromValue = 0
               strokeAnimation.toValue = 1
               
               faildGroupAnimation.animations = [shapeLineColorAnimation , strokeAnimation]
               self.successLineLayer.add(faildGroupAnimation, forKey: nil)
           
           CATransaction.setCompletionBlock({
               self.successLineLayer.strokeEnd = 1
               self.successLineLayer.strokeColor = self.errorColor.cgColor
               
               self.textLabel.foregroundColor = self.errorColor.cgColor
               self.textLabel.string = self.errorText
           })
           CATransaction.commit()
       }
    
    public func SetFontText(_ font: UIFont) {
        self.textField.font = font
    }
    
    public func SetPlaceHolderText(_ text: String) {
        self.placeHolderText = text
    }
    
    public func SetColorText(_ color: UIColor) {
        self.textField.textColor = color
    }
    
    public func SetTextSize(_ size: CGFloat) {
        self.textSize = size
    }
    
    override public func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        self.InitializeTextFieldView()
        self.InitializeLinesLayerView()
        self.InitializePlaceHolderView()
        self.checkPositionPlaceHolder(0.0)
    }
}

public enum stateField {
    case valid
    case nonvalid
}
