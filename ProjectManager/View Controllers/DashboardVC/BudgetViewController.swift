//
//  BudgetViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/29/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    
    var receiptController = ReceiptController()

    @IBOutlet var sliderOutlet: UISlider!
    @IBOutlet var budgetTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        budgetTotal.text = receiptController.floatToStringConversion(sliderOutlet.value)
        createGraph(UIColor.white.cgColor, 2 * CGFloat.pi, 1.0)
        createGraph(UIColor.systemBlue.cgColor, 1 * CGFloat.pi, 1.0)

    }
    func createGraph(_ color: CGColor, _ endAngle: CGFloat, _ animated: CFTimeInterval) {
        let shapeLayer = CAShapeLayer()
        
        let center = CGPoint(x: 210, y: 450)
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: endAngle, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.strokeEnd = 0
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 20
        shapeLayer.lineCap =  CAShapeLayerLineCap.round
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        
        view.layer.addSublayer(shapeLayer)
        
        let animcolor = CABasicAnimation(keyPath: "strokeEnd")
        animcolor.fromValue = UIColor.green.cgColor
        animcolor.toValue = UIColor.orange.cgColor
        animcolor.duration = animated
        animcolor.isRemovedOnCompletion = false
        animcolor.fillMode = CAMediaTimingFillMode.forwards
        
        shapeLayer.add(animcolor, forKey: "strokeEnd")
        
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        budgetTotal.text = receiptController.floatToStringConversion(sliderOutlet.value)
    }
    
}
