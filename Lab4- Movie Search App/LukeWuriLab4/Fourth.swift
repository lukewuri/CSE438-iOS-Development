//
//  Fourth.swift
//  LukeWuriLab4
//
//  Created by Wuri on 10/23/17.
//  Copyright © 2017 Wuri. All rights reserved.
//

import Foundation
import UIKit

let min = 0
let max = 56
class Fourth: UIViewController{
    
    @IBOutlet weak var JGLposter: UIImageView!
    
    @IBOutlet weak var JGLdescrip: UITextView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    override func viewDidLoad() {

 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var jglJSONsearch = getJSON(path: jglURL)
        let Y = generateRandomNumber(min: 0, max: 19)
        JGLdescrip.text = jglJSONsearch["results"][Y]["overview"].stringValue
        
        
        let searchImageURL2 = imageURL + jglJSONsearch["results"][Y]["poster_path"].stringValue
        
         let finalURL2 = URL(string: searchImageURL2)
         let rawImg2 = try? Data(contentsOf: finalURL2!)
         let thing2 = UIImage(data: rawImg2!)
         JGLposter.image = thing2
    }
    
    private func getJSON(path: String) -> JSON {
        guard let url = URL(string: path) else { return JSON.null }
        do {
            let data = try Data(contentsOf: url)
            let json = try? JSON(data: data)
            return json!
        } catch {
            return JSON.null
        }
    }

    //https://stackoverflow.com/questions/24256564/generating-random-values-in-swift-between-two-integer-values
    func generateRandomNumber(min min: Int, max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
        return randomNum
    }
}

