//
//  ViewController.swift
//  student Introduction App
//
//  Created by Maheen Khan on 12/29/22.
//
//  Hi! :)

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitcher: UISwitch!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var changeColor: UIColorWell!{
        didSet{
            changeColor.supportsAlpha = true
            changeColor.title = "What's a color you like?"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor.addTarget(self, action: #selector(changeBackground), for: .valueChanged)
    }

    
    @IBAction func changeBackground() {
        view.backgroundColor = changeColor.selectedColor
}
    
        @IBAction func stepperDidChange(_ sender: UIStepper) {
            numberOfPetsLabel.text = "\(Int(sender.value))"
        }
        
        @IBAction func introduceSelfDidTapped(_ sender: UIButton){
            let year = yearSegmentControl.titleForSegment(at: yearSegmentControl.selectedSegmentIndex)
            var morePets = "don't "
            if (morePetsSwitcher.isOn == true){
                morePets = ""
            }
            let birthday = birthdayPicker.date.formatted(date: .long, time: .omitted)
            
            let introduction = "Hi! My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!) as a \(year!) year student. I own \(numberOfPetsLabel.text!) pets and \(morePets)want more pets. My birthday is \(birthday) - Woohoo!"
            
            let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
            
            alertController.addAction(action)
            
            present(alertController, animated: true, completion: nil)
        }

    
}

