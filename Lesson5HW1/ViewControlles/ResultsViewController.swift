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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateUI()
    }


    private func updateUI() {
        let resultAnimalType = findResultAnimalType()

/*      // Алексей, сразу не нашел как цивилизованно вывести мордашку из AnimalType
        // и ты не подсказал в чате
        // Пришлось выкрутиться через switch
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
*/
        // Потом нашел параметр .rawValue и переделал поизящнее
        resultLabel.text = "Вы - " + String(resultAnimalType.rawValue)
        textLabel.text = resultAnimalType.definition
    }
    
    private func findResultAnimalType() -> AnimalType {
        var counterTypes : [AnimalType : Int] = [
            .cat : 0,
            .dog : 0,
            .rabbit : 0,
            .turtle : 0
        ]

        answersChoosen.forEach { (answer) in
            counterTypes[answer.type]! += 1
        }
        
/*
        // Такая же история: сначала сделал классический алгоритм поиска наибольшего элемента
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
*/
        
        // А потом нашел, что можно сделать .sorted и снова переделал
        let resultAnimalType = counterTypes.sorted(by: { $0.value > $1.value}).first!.key
        return resultAnimalType
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }

}
