//
//  FinancialPieChart.swift
//  ProjectManager
//
//  Created by conner on 8/24/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class FinancialPieChart: UIView {

    let rainbow: [UIColor] = [.systemRed,
                             .systemOrange,
                             .systemYellow,
                             .systemGreen,
                             .systemBlue,
                             .systemIndigo,
                             .systemPurple]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    
    func drawPieChart(with data: [String:Float], lineWidth: CGFloat = 30.00, radius: CGFloat = 75.00) {
        let center = CGPoint(x: self.bounds.maxX/2, y: self.bounds.maxY/2)
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        // Calculate total of all spending in dictionary
        var total: Float = 0
        for (_, spending) in data {
            total += spending
        }
        
        // Sort keys of dictionary in ascending order
        let sortedKeys: [String] = sortData(data)
        
        var rainbowIndex = 0
        var start: CGFloat = 0
        var occupiedSpace: CGFloat = 0
        for key in sortedKeys {
            let spending: Float = data[key]!
            let end = CGFloat(spending/total) + occupiedSpace
            occupiedSpace = end

            let layer = CAShapeLayer()
            layer.path = circularPath.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = rainbow[rainbowIndex].cgColor
            layer.lineWidth = lineWidth
            
            layer.strokeStart = start
            layer.strokeEnd = end
            
            self.layer.addSublayer(layer)
            rainbowIndex += 1
            if(rainbowIndex >= rainbow.count) { rainbowIndex = 0 }
            start = end
        }
    }
    
    // Helper func, Sort keys of data in ascending order
    func sortData(_ data: [String:Float]) -> [String] {
        var sortedKeys: [String] = []
        var keys = Set(data.keys)
        
        var smallestKey: String? = nil
        var lastKey: String? = nil
        
        for _ in keys {
            for key in keys {
                if smallestKey != nil, lastKey != nil {
                    if data[lastKey!]! > data[key]! {
                        smallestKey = key
                        lastKey = key
                    }
                } else {
                    smallestKey = key
                    lastKey = key
                }
            }
            sortedKeys.append(smallestKey!)
            keys.remove(smallestKey!)
            smallestKey = nil
            lastKey = nil
        }
        return sortedKeys
    }
}

