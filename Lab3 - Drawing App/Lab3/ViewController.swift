//
//  ViewController.swift
//  Lab3
//
//  Created by Luke Wuri on 10/3/17.
//  Copyright © 2017 Luke Wuri. All rights res/Users/wuri/Desktop/Lab3/Lab3/ViewController.swifterved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var CustomDrawingPlace: CustomDrawing!
    @IBOutlet weak var CurrentDrawingPlace: CurrentStroke!
    
  
    @IBAction func widthSlider(_ sender: UISlider) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        let width = Double(sender.value)
        
        main.currWidth = width
        current.currWidth = width
    }
    
    
    @IBAction func clear(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
      
        main.clear = "true"
        current.clear = "true"
 
        main.setNeedsDisplay()
        current.setNeedsDisplay()
        
        main.numOld = 0
        main.oldLines = []
        

        
        
    }
    
    @IBAction func undo(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        

        
        if ((main.totLines >= 1)||(current.totLines >= 1)) {
        main.totLines -= 1
        current.totLines -= 1
        
        main.currLine.currPoints = []
        current.currLine.currPoints = []
        
        main.oldLines.append(main.totalLines.popLast()!)
     
        
        main.numOld += 1
      
        
        main.setNeedsDisplay()
        current.setNeedsDisplay()
        }
        

    }
    
    @IBAction func redo(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        if ((main.numOld >= 1)||(current.numOld >= 1)) {
            main.numOld -= 1
       
            
            main.currLine.currPoints = []
            current.currLine.currPoints = []
            
            main.totalLines.append(main.oldLines.popLast()!)
            
            main.totLines += 1
            current.totLines += 1
            
            main.setNeedsDisplay()
            current.setNeedsDisplay()
        }
        
    }
    @IBAction func save(_ sender: Any) {
        //Modified method https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift to create the pop up dialog box to let the user know their image saved
        //Modified method https://stackoverflow.com/questions/40188126/swift-how-to-save-screenshot-of-a-view-with-its-subviews to save an image to camera roll
        
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        
        UIGraphicsBeginImageContext(main.frame.size)
        main.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Save Successful", message: "Saved to Camera Roll", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))

        self.present(alert, animated: false, completion: nil)
    }
 
    @IBAction func eraser(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        
        main.currColor = "eraser"
        current.currColor = "eraser"
    }
    @IBAction func blue(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        
        main.currColor = "blue"
        current.currColor = "blue"
        
    }
    
    @IBAction func green(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        
        main.currColor = "green"
        current.currColor = "green"
    }
    
    @IBAction func yellow(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        
        main.currColor = "yellow"
        current.currColor = "yellow"
    }
    
    @IBAction func red(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        
        main.currColor = "red"
        current.currColor = "red"
    }
    
    @IBAction func black(_ sender: Any) {
        let main : CustomDrawing = CustomDrawingPlace as CustomDrawing
        let current : CurrentStroke = CurrentDrawingPlace as CurrentStroke
        
        main.currColor = "black"
        current.currColor = "black"
    }
    
}

