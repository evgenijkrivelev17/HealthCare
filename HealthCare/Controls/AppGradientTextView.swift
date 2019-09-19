//
//  AppGradientTextView.swift
//  HealthCare
//
//  Created by Евгений on 9/11/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

class AppGradientTextView:UIView, UITextFieldDelegate {
    
    public var textLayer:CATextLayer!
    public var gradientLayer:CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CreateGradients()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        CreateGradients()
    }
    
    private func CreateGradients(){
        self.backgroundColor = UIColor.clear
        self.gradientLayer = CAGradientLayer()
        self.textLayer = CATextLayer()
        self.textLayer.alignmentMode = .center
        self.textLayer.contentsScale = UIScreen.main.scale
        self.textLayer.isWrapped = true
        self.gradientLayer.mask = self.textLayer
        self.gradientLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(gradientLayer)
    }
    
    private func updateFrameGradients(){
        self.gradientLayer.frame = self.bounds
        self.textLayer.frame = self.bounds
        self.layoutIfNeeded()
    }
    
    
    public func SetText(_ text: String){
        if textLayer != nil{
           textLayer.string = text
        }
    }
    
    public func SetFont(_ font: UIFont){
        self.textLayer.font = font
        self.layoutIfNeeded()
    }
    
    public func SetFontSize(_ size: CGFloat){
        self.textLayer.fontSize = size
        self.layoutIfNeeded()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateFrameGradients()
    }
    
    
    public func SetColors(_ colors: [Any]?){
        self.gradientLayer.colors = colors
    }
    
    public func SetLocationsGradient(_ locations:[NSNumber]){
        self.gradientLayer.locations = locations
    }
    
    public func SetStartPosition(_ startPosition: CGPoint){
        self.gradientLayer.startPoint = startPosition
    }
    
    public func SetEndPosition(_ endPosition: CGPoint){
        self.gradientLayer.endPoint = endPosition
    }
    
    public func add(_ animation: CABasicAnimation){
        self.gradientLayer.add(animation, forKey: nil)
    }
    
   
}
