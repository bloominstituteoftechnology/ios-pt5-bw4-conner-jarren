//
//  DashboardMainViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/27/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class DashboardMainViewController: UIViewController {
    
    @IBOutlet var totalAmountSpent: UILabel!
    @IBOutlet var percentageToBudgetLabel: UILabel!
    @IBOutlet var numberOfSavedProductsLabel: UILabel!
    @IBOutlet var notesTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if ReceiptsTableViewController.totalAmount == "" {
            totalAmountSpent.text = "$0.00"
        } else {
            totalAmountSpent.text = ReceiptsTableViewController.totalAmount
        }
        createGraph(UIColor.white.cgColor, 2 * CGFloat.pi, 1.0)
        createGraph(UIColor.systemBlue.cgColor, 1 * CGFloat.pi, 1.0)

    }
    
    func createGraph(_ color: CGColor, _ endAngle: CGFloat, _ animated: CFTimeInterval) {
        let shapeLayer = CAShapeLayer()
        
        let center = CGPoint(x: 300, y: 250)
        let circularPath = UIBezierPath(arcCenter: center, radius: 47, startAngle: 0, endAngle: endAngle, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.strokeEnd = 0
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 10
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
}
