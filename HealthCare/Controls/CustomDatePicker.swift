//
//  CustomDatePicker.swift
//  HealthCare
//
//  Created by Евгений on 10/21/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit


public class CustomDatePicker : UIView {
    
    private var dataField : UITextField!
    private var dataPicker : UIDatePicker!
    private var shapeLineLayer: CAShapeLayer!
    @objc public var currentDate: Date?
    public var dateFormmater: DateFormatter?
    
    
    public var textColor: UIColor = .white {
        didSet{
            self.dataField?.textColor = self.textColor
            self.dataField?.placeHolderColor = self.textColor
        }
    }
    
     override public init(frame: CGRect) {
        super.init(frame: frame)
        self.Initialize()
    }
       
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.Initialize()
    }
    
    private func Initialize(){
        self.dataPicker = UIDatePicker()
        
        self.dataField = UITextField()
        self.addSubview(self.dataField)
        
        self.shapeLineLayer = CAShapeLayer()
        self.layer.addSublayer(self.shapeLineLayer)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override public func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        self.SetUpDataPicker()
        self.SetUpDataField()
        self.SetUpLineLayer()
        self.SetToolBarItems()
    }
    
    private func SetUpDataField() {
        self.dataField.translatesAutoresizingMaskIntoConstraints = false
        self.dataField.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.dataField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.dataField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.dataField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.dataField.placeholder = "Birthday"
        self.dataField.font = UIFont(name: "Avenir-Black", size: 20)
        self.dataField.inputView = self.dataPicker
        self.dataField.textColor = self.textColor
        self.dataField.placeHolderColor = self.textColor
        self.dataField.isSelected = false
    }
    
    private func SetUpDataPicker() {
        self.dataPicker.datePickerMode = .date
        self.dataPicker.backgroundColor = .white
        self.dataPicker.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
    }
    
    
    private func SetUpLineLayer() {
        self.shapeLineLayer.strokeColor = UIColor.darkGray.cgColor
        self.shapeLineLayer.frame = self.bounds
        self.shapeLineLayer.lineWidth = 5
        self.shapeLineLayer.lineCap = .round
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.shapeLineLayer.bounds.height))
        path.addLine(to: CGPoint(x: self.shapeLineLayer.bounds.width, y: self.shapeLineLayer.bounds.height))
        
        self.shapeLineLayer.path = path.cgPath
    }
    
    
    open func SetToolBarItems() {
       let toolbar = UIToolbar();
          toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePicker))
        doneButton.tintColor = .darkGray
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker))
        cancelButton.tintColor = .darkGray

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: true)
        dataField.inputAccessoryView = toolbar
    }
    
    @objc func donePicker() {
        self.closeDatePicker()
        self.getCurrentTime()
    }
    
    private func getCurrentTime(){
        self.currentDate = self.dataPicker.date
        self.updateTimeLabel()
    }
    
    @objc func cancelPicker() {
        self.closeDatePicker()
    }
    
    private func closeDatePicker(){
        self.endEditing(true)
    }
    
    @objc func timeChanged(datePicker: UIDatePicker) {
        self.currentDate = datePicker.date
        self.updateTimeLabel()
    }
    
    private func updateTimeLabel() {
        self.dataField?.text = self.getDateString()
    }
    
    private func getDateString() -> String {
        var dateString = ""
        if let formmater = self.dateFormmater {
            dateString = formmater.string(from: self.currentDate!)
        }
        else {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMMM yyyy"
            dateString = formatter.string(from: self.currentDate!)
        }
        return dateString
    }
}
