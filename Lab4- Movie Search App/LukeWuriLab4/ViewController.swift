//
//  ViewController.swift
//  LukeWuriLab4
//
//  Created by Wuri on 10/22/17.
//  Copyright © 2017 Wuri. All rights reserved.
//
//Sources:https://www.youtube.com/watch?v=VoRMzCc7yjo for showing how to do multiple controllers/views/tabs
//http://www.kaleidosblog.com/uiimage-from-url-with-swift https://stackoverflow.com/questions/39813497/swift-3-display-image-from-urlto cross refenced these sources to get image contents from URL
//https://www.youtube.com/watch?v=ggptRs89DNk for image saving, modified to JPEG/JPG version
//https://www.youtube.com/watch?v=nPf5X5z0eA4 picked up bits for setting up collection and cells
//https://stackoverflow.com/questions/24056205/how-to-use-background-thread-in-swift/25070476#25070476 asynchronous updates to prevent UI locking
//https://stackoverflow.com/questions/40228837/restrict-the-characters-that-can-be-entered-in-a-uitextfield-in-swift filtering out unwanted characters
//https://www.youtube.com/watch?v=dLfOdObZW7k loading spinners https://stackoverflow.com/questions/44391367/swift-4-uiapplication-registerforremotenotifications-must-be-called-from-mai/46363608 loading spinners outside of main thread
//https://www.youtube.com/watch?v=-MsDDau4c6s playing sounds

import UIKit
import AVFoundation

var imageURL = "https://image.tmdb.org/t/p/w500/"
var searchURL = "https://api.themoviedb.org/3/search/movie"
var singularURL = "https://api.themoviedb.org/3/movie/"
var key = "?api_key=0434236408c11a419f51c7609fd00b48"
var posterPath = "xd"
var movieNum = "76341"
var pageNum = "1"
var imagePath = ""
var searched = false
var searchSelectedID = "0"
var indexNum = 0
var globalImageNamer = 0

var jglURL = "https://api.myjson.com/bins/1bgedb"


var favoritesArray = [String]()

extension String{
    var containsValidCharacter: Bool {
        let characterSet = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstu vwxyz")
        let range = (self as NSString).rangeOfCharacter(from: characterSet)
        return range.location != NSNotFound
    }
}


struct movieSearch{
    var title = " "
    var arrayID = 0
    var imageID = 0
    var imageName = ""
    var vote_average = "10.0"
    var descrip = "Once upon a time..."
    var date = "1996-12-12"
    var poster = UIImage()
}

struct movieFavorites{
    var title = " "
    var arrayID = 0
    var imageID = 0
    var imageName = ""
    var vote_average = "10.0"
    var descrip = "Once upon a time..."
    var date = "1996-12-12"
    var poster = NSData()
}
var movieFavoritesArray: [movieFavorites] = []
var movieSearchArray: [movieSearch] = []

var fav = movieFavorites()
var sear = movieSearch()

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var searchCollection: UICollectionView!
    
    
    
    let collection:[String] = ["1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.global(qos: .background).async {
            if (searchBar.text == nil || searchBar.text == "") {
                
            }else {
                
                searched = true
                self.getSearch(searchBar.text!)
            }
            DispatchQueue.main.async{
                self.searchCollection.reloadData()

            }
        }
        DispatchQueue.main.async(execute:  {
            UIApplication.shared.registerForRemoteNotifications()
            self.activityIndicator.startAnimating()
        })
    }
    
    func getSearch (_ searchTerm: String){
        DispatchQueue.main.async(execute:  {
            UIApplication.shared.registerForRemoteNotifications()
            self.activityIndicator.center = self.view.center
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        })
        
        
        let test1 = !searchTerm.containsValidCharacter
        
        
        if (!test1){
            movieSearchArray.removeAll()
            let superFixedSearchTerm = searchTerm.replacingOccurrences(of: " ", with: "%20", options: .regularExpression)
            
            let searchMovies = searchURL + key + "&query=" + superFixedSearchTerm + "&page=" + pageNum
            
            var JSONsearch = getJSON(path: searchMovies)
            var numResults = JSONsearch["total_results"].int! - 1

            
            if numResults > 19 {
                numResults = 19
            }
            
            if numResults < 1 {
                return
            }
            for x in 0...numResults{
                sear.arrayID = x
                sear.imageID = x
                let stringX = String(x)
                
                
                sear.title = JSONsearch["results"][x]["title"].stringValue
                sear.descrip = JSONsearch["results"][x]["overview"].stringValue
                sear.date = JSONsearch["results"][x]["release_date"].stringValue
                sear.vote_average = JSONsearch["results"][x]["vote_average"].stringValue
                
                if (JSONsearch["results"][x]["poster_path"] != JSON.null) {
                    let searchImageURL = imageURL + JSONsearch["results"][x]["poster_path"].stringValue
                    
                    let finalURL = URL(string: searchImageURL)
                    
                    let rawImg = try? Data(contentsOf: finalURL!)
                    let thing = UIImage(data: rawImg!)
                    let imageEnc:NSData = UIImageJPEGRepresentation(thing!, 1.0)! as NSData
                    UserDefaults.standard.set(imageEnc, forKey: stringX)
                    let decoded = UserDefaults.standard.object(forKey: stringX) as! NSData
                    sear.poster = UIImage(data: decoded as Data)!
                }else{
                    sear.poster = UIImage(named: "noposter.jpg")!
                }
                
                movieSearchArray.append(sear)
            }
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieSearchArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(searched == false){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! asdfCell
            cell.imageCell.image = UIImage(named: collection[indexPath.row] + ".jpg")
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! asdfCell
            cell.imageCell.image = movieSearchArray[indexPath.row].poster
            cell.titleCell.text = movieSearchArray[indexPath.row].title
            
            return cell
        }
        
    }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        music(name: "detailedsearch")
        indexNum = indexPath.row
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
    
}




