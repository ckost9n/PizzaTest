//
//  MainTabBarController.swift
//  PizzaTest
//
//  Created by Konstantin on 03.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let mainFactory = MainFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создание вкладок
        
        let firstTab = mainFactory.mainFlow()
        let secondTab = UIViewController()
        secondTab.view.backgroundColor = .orange
        let thirdTab = UIViewController()
        thirdTab.view.backgroundColor = .gray
        let fourthTab = UIViewController()
        fourthTab.view.backgroundColor = .yellow
        
        firstTab.title = "Первая вкладка"
        secondTab.title = "Вторая вкладка"
        thirdTab.title = "Третья вкладка"
        fourthTab.title = "Четвертая вкладка"
        
        // Добавление вкладок в таб-бар
        
        let tabs = [firstTab, secondTab, thirdTab, fourthTab]
        viewControllers = tabs.map { UINavigationController(rootViewController: $0)}
        
        // Установка стандартных иконок для вкладок
        
        tabBar.items?[0].image = UIImage(systemName: "house")
        tabBar.items?[1].image = UIImage(systemName: "cart")
        tabBar.items?[2].image = UIImage(systemName: "person")
        tabBar.items?[3].image = UIImage(systemName: "person")
    }
}
