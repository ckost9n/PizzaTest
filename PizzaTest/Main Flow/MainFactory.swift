//
//  MainFactory.swift
//  PizzaTest
//
//  Created by Konstantin on 03.04.2023.
//

import UIKit

class MainFactory {
    
    func mainFlow() -> MainViewController {
        let presenter = MainPresenter()
        let view = MainViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
}
