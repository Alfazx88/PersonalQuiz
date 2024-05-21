//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023 and fulfilled on 22.05.2024
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answersFinal: [Answer] = []
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        getMostFrequentAnimal(from: answersFinal)
    }
    
    private func getMostFrequentAnimal(from answers: [Answer]) {
        var animalsCount: [Animal: Int] = [:]

        for answer in answers {
            animalsCount[answer.animal, default: 0] += 1
        }
        
        let matchingAnimal = animalsCount.max(by: { $0.value < $1.value })
        
        resultLabel.text = "Вы - \(matchingAnimal!.key.rawValue)"
        resultDescriptionLabel.text = matchingAnimal!.key.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
//    deinit {
//        print("\(type(of: self)) has been deallocated")
//    }
}
