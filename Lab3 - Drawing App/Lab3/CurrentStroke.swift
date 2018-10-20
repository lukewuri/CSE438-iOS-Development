//
//  CurrentStroke.swift
//  Lab3
//
//  Created by Luke Wuri on 10/4/17.
//  Copyright © 2017 Luke Wuri. All rights reserved.
//

import UIKit

class CurrentStroke: UIView {

 @IBOutlet weak var CustomDrawingPlace: CustomDrawing!
    
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
    var currWidth = 1.0
    var totalLines: [Line]	 = []
    var seg = UIBezierPath()
    var currColor = "black"
    var totLines = 0
    var numOld = 0
    var oldLines: [Line] = []
    var currLine: Line = Line(startPoint: CGPoint(x:0, y: 0), endPoint: CGPoint(x:0, y: 0))
    var blank = UIBezierPath()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        
        currLine.width = currWidth
        main.currLine.width = currWidth
        
        currLine.color = currColor
        main.currLine.color = currColor
        
        guard let touchPoint = touches.first?.location(in: self) else { return }
        
        currLine.currPoints = []
        currLine.startPoint = touchPoint
        currLine.endPoint = touchPoint
        currLine.currPoints.append(currLine.startPoint)
        currLine.currPoints.append(currLine.startPoint)
        
        main.currLine.currPoints = []
        main.currLine.startPoint = touchPoint
        main.currLine.endPoint = touchPoint
        main.currLine.currPoints.append(main.currLine.startPoint)
        main.currLine.currPoints.append(main.currLine.startPoint)
        
        self.setNeedsDisplay()
        self.backgroundColor = UIColor.clear

    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: self) else { return }

        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        currLine.width = currWidth
        main.currLine.width = currWidth
        
        currLine.color = currColor
        main.currLine.color = currColor
        
        
        currLine.currPoints.append(touchPoint)
        main.currLine.currPoints.append(touchPoint)
       
        
        
        self.setNeedsDisplay()
        self.backgroundColor = UIColor.clear

    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        guard let touchPoint = touches.first?.location(in: self) else { return }
        
        currLine.endPoint = touchPoint
        currLine.currPoints.append(touchPoint)
        
        
        main.totalLines.append(main.currLine)
        main.totLines += 1
        totLines += 1
        main.setNeedsDisplay()
    }
    
    
    
    override func draw(_ rect: CGRect) {
        
        if (clear == "true"){
            totalLines = []
            totLines = 0
            currLine.currPoints = []
            blank.lineWidth = 0
            blank.stroke()
            clear = "false"
            return
        }

        if currColor == "black"{
            UIColor.black.setStroke()
        }
        if currColor == "yellow"{
            UIColor.yellow.setStroke()
        }
        if currColor == "red"{
            UIColor.red.setStroke()
        }
        if currColor == "green"{
            UIColor.green.setStroke()
        }
        if currColor == "blue"{
            UIColor.blue.setStroke()
        }
        if currColor == "eraser"{
            UIColor.white.setStroke()
        }
        
        
        seg = createQuadPath(points: currLine.currPoints)
        seg.lineWidth = CGFloat(currWidth)
        seg.lineCapStyle = .round
        seg.stroke()
        


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
    

}
