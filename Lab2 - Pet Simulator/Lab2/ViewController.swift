	//
//  ViewController.swift
//  Lab2
//
//  Created by Luke Wuri on 9/24/17.
//  Copyright © 2017 Luke Wuri. All rights reserved.
//

import UIKit
import Foundation
    
class ViewController: UIViewController {
    var currentPet = "bird"
    
    
    var birdHappiness = 50.0
    var birdFood = 50.0
    var birdHapBar = 0.5
    var birdFoodBar = 0.5
    
    var bunnyHappiness = 50.0
    var bunnyFood = 50.0
    var bunnyHapBar = 0.5
    var bunnyFoodBar = 0.5
    
    var catHappiness = 50.0
    var catFood = 50.0
    var catHapBar = 0.5
    var catFoodBar = 0.5
    
    var dogHappiness = 50.0
    var dogFood = 50.0
    var dogHapBar = 0.5
    var dogFoodBar = 0.5
    
    var fishHappiness = 50.0
    var fishFood = 50.0
    var fishHapBar = 0.5
    var fishFoodBar = 0.5
    

    
    
    @IBOutlet weak var banner: UIView!
    @IBOutlet weak var petImage: UIImageView!

    @IBOutlet weak var happinessBar: DisplayView!
  
    @IBOutlet weak var foodBar: DisplayView!
    
    @IBOutlet weak var happinessValue: UILabel!
    
    @IBOutlet weak var foodValue: UILabel!
    
    @IBAction func birdButton(_ sender: Any) {
        currentPet = "bird"
        banner.backgroundColor = .yellow
        happinessBar.color = .yellow
        foodBar.color = .yellow
        
       
        happinessValue.text = String(format:"%.0f", birdHappiness)
        happinessBar.animateValue(to: CGFloat(birdHapBar))
        happinessBar.value = CGFloat(birdHapBar)
        
        foodValue.text = String(format:"%.0f", birdFood)
        foodBar.animateValue(to: CGFloat(birdFoodBar))
        foodBar.value = CGFloat(birdFoodBar)
        petImage.image = #imageLiteral(resourceName: "bird")
    }
    
    @IBAction func bunnyButton(_ sender: Any) {
        currentPet = "bunny"
        banner.backgroundColor = .blue
        happinessBar.color = .blue
        foodBar.color = .blue
        
        
        happinessValue.text = String(format:"%.0f", bunnyHappiness)
        happinessBar.animateValue(to: CGFloat(bunnyHapBar))
        happinessBar.value = CGFloat(bunnyHapBar)
        
        
        foodValue.text = String(format:"%.0f", bunnyFood)
        foodBar.animateValue(to: CGFloat(bunnyFoodBar))
        foodBar.value = CGFloat(bunnyFoodBar)
        petImage.image = #imageLiteral(resourceName: "bunny")
    }
    
    @IBAction func catButton(_ sender: Any) {
        currentPet = "cat"
        banner.backgroundColor = .orange
        happinessBar.color = .orange
        foodBar.color = .orange
        
        
        happinessValue.text = String(format:"%.0f", catHappiness)
        happinessBar.animateValue(to: CGFloat(catHapBar))
        happinessBar.value = CGFloat(catHapBar)
        
        
        foodValue.text = String(format:"%.0f", catFood)
        foodBar.animateValue(to: CGFloat(catFoodBar))
        foodBar.value = CGFloat(catFoodBar)
        petImage.image = #imageLiteral(resourceName: "cat")
    }
    
    @IBAction func dogButton(_ sender: Any) {
        currentPet = "dog"
        banner.backgroundColor = .red
        happinessBar.color = .red
        foodBar.color = .red
        
        happinessValue.text = String(format:"%.0f", dogHappiness)
        happinessBar.animateValue(to: CGFloat(dogHapBar))
        happinessBar.value = CGFloat(dogHapBar)
        
        foodValue.text = String(format:"%.0f", dogFood)
        foodBar.animateValue(to: CGFloat(dogFoodBar))
        foodBar.value = CGFloat(dogFoodBar)
        petImage.image = #imageLiteral(resourceName: "dog")
    }
    
    @IBAction func fishButton(_ sender: Any) {
        currentPet = "fish"
        banner.backgroundColor = .green
        happinessBar.color = .green
        foodBar.color = .green
        
        happinessValue.text = String(format:"%.0f", fishHappiness)
        happinessBar.animateValue(to: CGFloat(fishHapBar))
        happinessBar.value = CGFloat(fishHapBar)
        
        foodValue.text = String(format:"%.0f", fishFood)
        foodBar.animateValue(to: CGFloat(fishFoodBar))
        foodBar.value = CGFloat(fishFoodBar)
        petImage.image = #imageLiteral(resourceName: "fish")
    }
  
    
    
    @IBAction func playButton(_ sender: Any) {
        if (currentPet == "bird"){
            if((birdHappiness >= 100)||(birdHappiness <= 0)){
                return
            }
            birdHappiness += 5
            bunnyHappiness -= 5
            dogFood -= 5
            birdHapBar = (birdHappiness/100)
            happinessValue.text = String(format:"%.0f", birdHappiness)
            happinessBar.animateValue(to: CGFloat(birdHapBar))
            happinessBar.value = CGFloat(birdHapBar)
        }
        if (currentPet == "bunny"){
            if((bunnyHappiness >= 100)||(bunnyHappiness <= 0)){
                return
            }
            bunnyHappiness += 5
            dogHappiness -= 5
            bunnyHapBar = (bunnyHappiness/100)
            happinessValue.text = String(format:"%.0f", bunnyHappiness)
            happinessBar.animateValue(to: CGFloat(bunnyHapBar))
            happinessBar.value = CGFloat(bunnyHapBar)
        }
        if (currentPet == "cat"){
            if((catHappiness >= 100)||(catHappiness <= 0)){
                return
            }
            catHappiness += 5
            birdHappiness -= 5
            catHappiness -= 5
            catHapBar = (catHappiness/100)
            happinessValue.text = String(format:"%.0f", catHappiness)
            happinessBar.animateValue(to: CGFloat(catHapBar))
            happinessBar.value = CGFloat(catHapBar)
        }
        if (currentPet == "dog"){
            if((dogHappiness >= 100)||(dogHappiness <= 0)){
                return
            }
            dogHappiness += 5
            bunnyHappiness -= 5
            dogHapBar = (dogHappiness/100)
            happinessValue.text = String(format:"%.0f", dogHappiness)
            happinessBar.animateValue(to: CGFloat(dogHapBar))
            happinessBar.value = CGFloat(dogHapBar)
        }
        if ((currentPet == "fish")||(fishHappiness <= 0)){
            if(fishHappiness >= 100){
                return
            }
            fishHappiness += 5
            fishFood -= 5
            catFood += 5
            fishHapBar = (fishHappiness/100)
            happinessValue.text = String(format:"%.0f", fishHappiness)
            happinessBar.animateValue(to: CGFloat(fishHapBar))
            happinessBar.value = CGFloat(fishHapBar)
        }
    
        

    }
    
    @IBAction func feedButton(_ sender: Any) {
        
        if (currentPet == "bird"){
            if ((birdFood >= 100)||(birdFood <= 0)){
                return
            }
            birdFood += 5
            birdHappiness += 5
            fishHappiness -= 5
            birdFoodBar = (birdFood/100)
            foodValue.text = String(format:"%.0f", birdFood)
            foodBar.animateValue(to: CGFloat(birdFoodBar))
            foodBar.value = CGFloat(birdFoodBar)
        }
        if (currentPet == "bunny"){
            if ((bunnyFood >= 100)||(bunnyFood <= 0)){
                return
            }
            bunnyFood += 5
            dogHappiness += 5
            birdHappiness += 5
            bunnyFoodBar = (bunnyFood/100)
            foodValue.text = String(format:"%.0f", bunnyFood)
            foodBar.animateValue(to: CGFloat(bunnyFoodBar))
            foodBar.value = CGFloat(bunnyFoodBar)
        }
        if (currentPet == "cat"){
            if ((catFood >= 100)||(catFood <= 0)){
                return
            }
            catFood += 5
            catHappiness += 5
            fishHappiness += 5
            catFoodBar = (catFood/100)
            foodValue.text = String(format:"%.0f", catFood)
            foodBar.animateValue(to: CGFloat(catFoodBar))
            foodBar.value = CGFloat(catFoodBar)
        }
        if (currentPet == "dog"){
            if ((dogFood >= 100)||(dogFood <= 0)){
                return
            }
            dogFood += 5
            dogHappiness += 5
            dogFoodBar = (dogFood/100)
            foodValue.text = String(format:"%.0f", dogFood)
            foodBar.animateValue(to: CGFloat(dogFoodBar))
            foodBar.value = CGFloat(dogFoodBar)
        }
        if ((currentPet == "fish")||(fishFood <= 0)){
            if (fishFood >= 100){
                return
            }
            fishFood += 5
            catHappiness += 5
            fishFoodBar = (fishFood/100)
            foodValue.text = String(format:"%.0f", fishFood)
            foodBar.animateValue(to: CGFloat(fishFoodBar))
            foodBar.value = CGFloat(fishFoodBar)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        happinessBar.value = CGFloat(birdHapBar)
        foodBar.value = CGFloat(birdFoodBar)
        happinessBar.color = .yellow
        foodBar.color = .yellow
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
   
}

