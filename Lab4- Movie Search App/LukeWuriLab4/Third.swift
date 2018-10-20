//
//  third.swift
//  LukeWuriLab4
//
//  Created by Wuri on 10/23/17.
//  Copyright © 2017 Wuri. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
var favCount = 0

class Third: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

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
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {

           
            favoritesArray.remove(at: Int(indexPath.row))
            UserDefaults.standard.set(favoritesArray, forKey: "favoritesArray")
            UserDefaults.standard.synchronize()
            if favoritesArray.count >= 0{
            tableView.reloadData()
                music(name: "delete")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = favoritesArray[indexPath.row]
        return cell
    }
    
    @IBAction func clearAll(_ sender: Any) {
        favoritesArray = []
        UserDefaults.standard.set(favoritesArray, forKey: "favoritesArray")
        UserDefaults.standard.synchronize()
            tableView.reloadData()
            music(name: "delete")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let temp :[String] = UserDefaults.standard.stringArray(forKey: "favoritesArray") ?? [String]()
        favCount = temp.count
        if favCount > 0 {
        favoritesArray = temp
            tableView.reloadData()
        }
        
    
    }
}

