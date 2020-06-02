//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    var answersChoosen: [Answer]!
    var counterTypes : [AnimalType : Int] = [
        .cat : 0,
        .dog : 0,
        .rabbit : 0,
        .turtle : 0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateUI()
    }
    
    private func updateUI() {
        let resultAnimalType = findResultAnimalType()
        switch resultAnimalType {
        case .cat:
            resultLabel.text = "Вы - 🐱"
        case .dog:
            resultLabel.text = "Вы - 🐶"
        case .turtle:
            resultLabel.text = "Вы - 🐢"
        case .rabbit:
            resultLabel.text = "Вы - 🐰"
        }
        textLabel.text = resultAnimalType.definition
    }
    
    private func findResultAnimalType() -> AnimalType {
        answersChoosen.forEach { (answer) in
            counterTypes[answer.type]! += 1
        }
        
        var resultAnimalType = counterTypes.first!.key
        var maxValue = counterTypes.first!.value
        
        for (key, value) in counterTypes {
            if value > maxValue {
                maxValue = value
                resultAnimalType = key
            }
            print("\(key): \(value)")
        }
        print("Result is \(resultAnimalType)")
        
        return resultAnimalType
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }

}
