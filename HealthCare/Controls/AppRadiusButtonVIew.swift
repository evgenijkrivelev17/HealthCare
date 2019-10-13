//
//  AppRadiusButtonVIew.swift
//  HealthCare
//
//  Created by Евгений on 9/16/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

public class AppRadiusButtonView: UIButton {
    
    private var isSetCornerRadius: Bool = false
    private var cornerRounded: CGFloat = 0 {
        didSet {
            UpdateCorners(value: cornerRounded)
        }
    }
    
    private func UpdateCorners(value: CGFloat) {
        self.layer.cornerRadius = cornerRounded
        if(self.cornerRounded != 0){
            self.isSetCornerRadius = true
        }
    }
    
    public func SetRadius(_ radius:CGFloat){
        self.cornerRounded = radius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func InitializeSetUp(){
        self.layer.masksToBounds = true
        self.addTarget(self, action: #selector(touchHandle), for: UIControl.Event.touchDown)
        guard isSetCornerRadius else {
            self.layer.cornerRadius = self.frame.height / 2
            return
        }
        self.layer.cornerRadius = self.cornerRounded
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        InitializeSetUp()
    }
    
    @objc func touchHandle(_ event:Any){
        let minimumScale = CABasicAnimation(keyPath: "transform.scale")
        minimumScale.repeatCount = 1
        minimumScale.duration = 0.2
        minimumScale.toValue = 0.75
        minimumScale.autoreverses = true
        self.layer.add(minimumScale, forKey: nil)
    }
    
    
}
