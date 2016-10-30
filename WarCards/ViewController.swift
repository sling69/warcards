//
//  ViewController.swift
//  WarCards
//
//  Created by Sye Declerck on 28/10/16.
//  Copyright © 2016 Daquiri. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var enemyScoreLabel: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    var playerScore:Int = 0
    var enemyScore:Int = 0
    
    var cardNamesArray:[String] = ["aceclub", "2club", "3diamond", "4spade", "5heart", "6diamond", "7club", "8heart", "9spade", "10diamond", "jackspade", "queenheart", "kingspade"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            
            //TODO: Reduce volume to ambient
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource: "ButtonClick", ofType: "wav")!))
            audioPlayer.prepareToPlay()
            
        }
        catch {
            print(error)
        
        }
        
        
        
        //self.playRoundButton.setTitle("Play", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playRoundTapped(_ sender: UIButton) {
    
        //TODO: Button sound doesnt alays play?? check
        audioPlayer.play()
        
        //Randomise  number for the first image view
        let firstRandomNumber:Int = Int(arc4random_uniform(13))
        
        //Construct a string with the random number
        let firstCardString:String = self.cardNamesArray[firstRandomNumber]
        
        //Set the first card image view to the asset corresponding to the random number
        self.firstCardImageView.image = UIImage(named: firstCardString)
        
        //Randomise  number for the second image view
        let secondRandomNumber:Int = Int(arc4random_uniform(13))
        
        //Construct a string with the random number
        let secondCardString:String = self.cardNamesArray[secondRandomNumber]
        
        //Set the second card image view to the asset corresponding to the random number
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        //self.playRoundButton.setTitle(firstCardString + secondCardString, for: UIControlState.normal)
        
        //determine the higher value card
        
        if firstRandomNumber > secondRandomNumber {
            //TODO: First card is larger
            self.playerScore += 1
            self.playerScoreLabel.text = String(self.playerScore)
            
        }
        else if firstRandomNumber == secondRandomNumber {
            //TODO: Numbers are equal
        }
        else {
            //TODO: Second card is larger
            self.enemyScore += 1
            self.enemyScoreLabel.text = String(self.enemyScore)
        }

    }

}

