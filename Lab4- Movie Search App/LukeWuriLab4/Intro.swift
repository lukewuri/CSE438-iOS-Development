//
//  Intro.swift
//  LukeWuriLab4
//
//  Created by Wuri on 10/24/17.
//  Copyright © 2017 Wuri. All rights reserved.
//https://www.youtube.com/watch?v=-MsDDau4c6s for playing mp3 files
import UIKit
import Foundation
import AVFoundation

class Intro: UIViewController {
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

 var play:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        music(name: "intro")
    }
}
