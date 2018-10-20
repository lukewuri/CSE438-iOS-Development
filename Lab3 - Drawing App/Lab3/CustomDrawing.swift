//
//  CustomDrawing.swift
//  Lab3DrawingApp
//
//  Created by Luke Wuri on 10/3/17.
//  Copyright © 2017 Luke Wuri. All rights reserved.
//

import UIKit

class CustomDrawing: UIView {
    
    //each individual stroke or dot
    struct Line {
        var color: String = "black"
        var width: Double = 1.0
        var startPoint: CGPoint
        var endPoint: CGPoint
   
        init(startPoint: CGPoint, endPoint:CGPoint ) {
            self.startPoint = startPoint
            self.endPoint = endPoint
        }
     
        var currPoints: [CGPoint] = []
        
    }
    
    var clear = "false"
    var numOld = 0
    var currWidth = 1.0
    var totalLines: [Line]	 = []
    var oldLines: [Line] = []
    var drawAll = true
    var seg = UIBezierPath()
    var currColor = "black"
    var totLines = 0
    var currLine: Line = Line(startPoint: CGPoint(x:0, y: 0), endPoint: CGPoint(x:0, y: 0))
    var blank = UIBezierPath()
    

        override func draw(_ rect: CGRect) {
        
            if (clear == "true"){
                totLines = 0
                totalLines = []
                currLine.currPoints = []
                blank.lineWidth = 0
                blank.stroke()
                clear = "false"
                return
            }
 
            
            var x = 0
            while (x < totLines ){
                if totalLines[x].color == "black"{
                    UIColor.black.setStroke()
                }
                if totalLines[x].color == "yellow"{
                    UIColor.yellow.setStroke()
                }
                if totalLines[x].color == "red"{
                    UIColor.red.setStroke()
                }
                if totalLines[x].color == "green"{
                    UIColor.green.setStroke()
                }
                if totalLines[x].color == "blue"{
                    UIColor.blue.setStroke()
                }
                if totalLines[x].color == "eraser" {
                    UIColor.white.setStroke()
                }
                    currWidth = totalLines[x].width
                
            
                    seg = createQuadPath(points: totalLines[x].currPoints)
                    seg.lineCapStyle = .round
                    seg.lineWidth = CGFloat(currWidth)
                    x += 1
                    seg.stroke()
                }
            
            }
    
    
        }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        var mid: CGPoint = CGPoint(x: 0, y: 0)
        mid.x = (first.x + second.x)/2
        mid.y = (first.y + second.y)/2
        return mid
    }
    
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }
    

    


