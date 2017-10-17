//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by EzhR on 17/10/17.
//  Copyright © 2017 ezhr. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    var countries: [String] = []
    var score = 0
    var correctAnswer = 0
    
    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button0.layer.borderWidth = 1
        button0.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
        
        button0.setImage(UIImage(named: countries[0]), for: .normal)
        button1.setImage(UIImage(named: countries[1]), for: .normal)
        button2.setImage(UIImage(named: countries[2]), for: .normal)
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if (sender.tag == correctAnswer) {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong!"
            score = 0
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

