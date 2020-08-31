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
    static var budgetTotalFloat: Float = 0.0

    @IBOutlet var sliderOutlet: UISlider!
    @IBOutlet var budgetTotal: UILabel!
    @IBOutlet var widgetView: UIView!
    @IBOutlet var percentageOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        budgetTotal.text = receiptController.floatToStringConversion(sliderOutlet.value, "%.2f", "$")
        createGraph(UIColor.white.cgColor, 2 * CGFloat.pi, 1.0, 20)
        createGraph(UIColor.systemBlue.cgColor, 1 * CGFloat.pi, 1.0, 20)
        percentageOutlet.text = "0%"
    }
    
    func run(after seconds: Int, completion: @escaping () -> Void) {
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }
    }
    
    func calcPercentage(_ x: Float, _ y: Float) -> Float {
        return (x / y) * 100.0
    }
    
    func createGraphReset() {
        run(after: 1) {
            self.createGraph(UIColor.white.cgColor, 2 * CGFloat.pi, 1.0, 20)
            self.createGraph(UIColor.systemBlue.cgColor, 1 * CGFloat.pi, 1.0, 20)
        }
        createGraph(widgetView.backgroundColor!.cgColor, 2 * CGFloat.pi, 1.0, 50)
    }
    
    func createGraph(_ color: CGColor, _ endAngle: CGFloat, _ animated: CFTimeInterval, _ lineWidth: CGFloat) {
        let shapeLayer = CAShapeLayer()
        
        let center = CGPoint(x: 210, y: 450)
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: endAngle, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.strokeEnd = 0
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = lineWidth
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
        BudgetViewController.budgetTotalFloat = sliderOutlet.value
        BudgetViewController.budgetTotalFloat = calcPercentage(BudgetViewController.budgetTotalFloat, ReceiptsTableViewController.totalAmount)
        budgetTotal.text = receiptController.floatToStringConversion(sliderOutlet.value, "%.2f", "$")
        run(after: 1) {
            self.createGraphReset()
        }
        run(after: 2) {
            self.percentageOutlet.text = self.receiptController.floatToStringConversion(BudgetViewController.self.budgetTotalFloat, "rounded", "%")
        }
    }
    
}
