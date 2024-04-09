//
//  ViewController.swift
//  Project2
//
//  Created by Mag isb-10 on 08/04/2024.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var btn1: UIButton!
  @IBOutlet weak var btn2: UIButton!
  @IBOutlet weak var btn3: UIButton!
  
  var countries = [String]()
  var score = 0
  var correctAnswer = 0
  var questionAsked = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us "]
    
    //    btn1.layer.borderWidth = 1
    //    btn2.layer.borderWidth = 1
    //    btn3.layer.borderWidth = 1
    //
    //    btn1.layer.borderColor = UIColor.lightGray.cgColor
    //    btn2.layer.borderColor = UIColor.lightGray.cgColor
    //    btn3.layer.borderColor = UIColor.lightGray.cgColor
    
    askQuestion()
  }
  
  func askQuestion(action: UIAlertAction! = nil)  {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    
    btn1.setImage(UIImage(named: countries[0]), for: .normal)
    btn2.setImage(UIImage(named: countries[1]), for: .normal)
    btn3.setImage(UIImage(named: countries[2]), for: .normal)
    
    var flagTitle = countries[correctAnswer].uppercased()
    title = "Guess: \(flagTitle) Score: \(score)"
    
    questionAsked += 1
    
    if questionAsked == 11 {
      showFinalAlert()
    }
  }
  
  func showFinalAlert() {
    let finalAC = UIAlertController(title: "Quiz Comleted", message: "Your final score is \(score) out of 10", preferredStyle: .alert)
    finalAC.addAction(UIAlertAction(title: "Restart", style: .default, handler: resetGame))
    present(finalAC, animated: true)
  }
  
  func resetGame(action: UIAlertAction! = nil) {
    score = 0
    questionAsked = 0
    askQuestion()
  }
  
  @IBAction func buttonTapped(_ sender: UIButton) {
    var title: String
    var message: String
    
    let selectedCountry = countries[sender.tag].uppercased()
    
    if sender.tag == correctAnswer {
      title = "Correct Answer"
      score += 1
      message = "Your answer is correct"
    } else {
      title = "Wrong Answer"
      if score > 0 {
        score -= 1
      }
      message = "Its \(selectedCountry)'s flag"
    }
    
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
    
    present(ac, animated: true)
  }
  
}

