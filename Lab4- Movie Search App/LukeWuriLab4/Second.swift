//
//  second.swift
//  LukeWuriLab4
//
//  Created by Wuri on 10/23/17.
//  Copyright © 2017 Wuri. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Second: UIViewController{

    @IBOutlet weak var detTitle: UILabel!
    @IBOutlet weak var detScore: UILabel!
    
    @IBOutlet weak var detPoster: UIImageView!
    @IBOutlet weak var detDescript: UITextView!
    @IBOutlet weak var detDate: UILabel!
    

    var play:AVAudioPlayer = AVAudioPlayer()
    func music(name: String){
        do{
            let path = Bundle.main.path(forResource: name, ofType: "wav")
            try play = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: path!) as URL)
        }
        catch{
            
        }
        let sess = AVAudioSession.sharedInstance()
        
        do{
            try sess.setCategory(AVAudioSessionCategoryPlayback)
        }catch{
            
        }
        play.play()
    }
    
    @IBAction func Favorite(_ sender: Any) {
        globalImageNamer += 1
        music(name: "favorite")


        //source :https://stackoverflow.com/questions/25179668/how-to-save-and-read-array-of-array-in-nsuserdefaults-in-swift
        
        favoritesArray.append(movieSearchArray[indexNum].title)
        let defaults = UserDefaults.standard
        defaults.set(favoritesArray, forKey: "favoritesArray")
        defaults.synchronize()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var textPlace = ""
        textPlace = movieSearchArray[indexNum].title
        detTitle.text = textPlace
        
        textPlace = "Release: " + movieSearchArray[indexNum].date
        detDate.text = textPlace
            
        textPlace = movieSearchArray[indexNum].descrip
        detDescript.text = textPlace
        
        
        detScore.text = movieSearchArray[indexNum].vote_average + " out of 10"
        detPoster.image = movieSearchArray[indexNum].poster
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
