//
//  PizzaModel.swift
//  PizzaTest
//
//  Created by Konstantin on 03.04.2023.
//

import UIKit

struct PizzaModel {
    let name: String
    let ingredients: String
    var image: UIImage?
    let coast: Coast
    
    static func getPizzaArray() -> [PizzaModel] {
        [
            PizzaModel(
                name: "Ветчина и грибы",
                ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                image: UIImage(named: "vetAndCheese"),
                coast: Coast(min: 345, medium: 445, max: 555)
            ),
            PizzaModel(
                name: "Баварские колбаски",
                ingredients: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
                image: UIImage(named: "sausages"),
                coast: Coast(min: 345, medium: 445, max: 555)
            ),
            PizzaModel(
                name: "Нежный лосось",
                ingredients: "Лосось, томаты черри, моцарелла, соус песто",
                image: UIImage(named: "salmon"),
                coast: Coast(min: 345, medium: 445, max: 555)
            ),
            PizzaModel(
                name: "Пицца четыре сыра",
                ingredients: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
                image: UIImage(named: "4 cheese"),
                coast: Coast(min: 345, medium: 445, max: 555)
            )
        ]
        
    }
}

struct Coast {
    let min: Int
    let medium: Int
    let max: Int
}
