//
//  ViewController.swift
//  Lab1Attempt2
//
//  Created by Luke Wuri on 9/13/17.
//  Copyright © 2017 Luke Wuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var ogPrice: UITextField!
    @IBOutlet weak var quan: UITextField!
    @IBOutlet weak var flatDisc: UITextField!
    @IBOutlet weak var perDisc: UITextField!
    @IBOutlet weak var tax: UITextField!
    @IBOutlet weak var final: UILabel!
    @IBOutlet weak var blankMsg: UILabel!
    @IBOutlet weak var rollingSum: UILabel!
  
    @IBOutlet weak var plswork: UITextView!
   
    var listString = ""
    
    @IBAction func editogPrice(_ sender: UITextField) {
        calc()
    }
    @IBAction func editQuan(_ sender: UITextField) {
        calc()
    }
    @IBAction func editFlatDisc(_ sender: UITextField) {
        calc()
    }
    @IBAction func editPerDisc(_ sender: UITextField) {
        calc()
    }
    @IBAction func editTax(_ sender: UITextField) {
        calc()
    }
    
 

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
   func calc() {
        let valOGPrice: Double? = Double(ogPrice.text!)
        let valQuanItem: Double? = Double(quan.text!)
        let valFDiscount: Double? = Double(flatDisc.text!)
        let valPDiscount: Double? = Double(perDisc.text!)
        let valTax: Double? = Double(tax.text!)
        
        if itemName.text == nil || valOGPrice == nil || valQuanItem == nil || valFDiscount == nil || valPDiscount == nil || valTax == nil{
            blankMsg.text = "Please fill in all information correctly!"
                    return
        }else{
        blankMsg.text = ""

        let finalVal = (((valOGPrice!)*(1-(valPDiscount!/100)) - valFDiscount!)*(valQuanItem!))*(1 + (valTax!)/100)
        /*number formatter idea from https://stackoverflow.com/questions/39884554/how-to-set-maximumfractiondigits-in-swift-3-with-numberformatter */
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            formatter.roundingMode = .down
            let moneyString = formatter.string(from: NSNumber(value:finalVal))
            
    final.text = "\(moneyString!)"
        }
        
        
        
    }

    @IBAction func addList(_ sender: AnyObject) {
        let varItemName: String = itemName.text!
        let varQuantity: String = quan.text!
        let varPrice: String = final.text!
        
        let mathItemPrice: Double? = Double(final.text!)
        let stringSum: String = rollingSum.text!
        let mathListPrice = Double(stringSum)
        let newRollingSum = (mathItemPrice! + mathListPrice!)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.roundingMode = .down
        let formNewRollingSum = formatter.string(from: NSNumber(value:newRollingSum))
        rollingSum.text = "\(formNewRollingSum!)"
        listString += "Quantity:" + "\(varQuantity)" + " Name: " + "\(varItemName)" + " Cost: " + "$ " + "\(varPrice) \n"
        plswork.text = "\(listString)"


    }
}

