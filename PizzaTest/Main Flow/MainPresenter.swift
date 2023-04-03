//
//  MainPresenter.swift
//  PizzaTest
//
//  Created by Konstantin on 03.04.2023.
//

import Foundation

protocol MainPresenterProtocol {
    func viewDidload()
}

class MainPresenter: MainPresenterProtocol {
    
    private var someArray: [PizzaModel]? {
        didSet {
            guard let model = someArray else { return }
            view?.updateUI(with: model)
        }
    }
    
    weak var view: MainViewControllerProtocol?
    
    func viewDidload() {
        someArray = PizzaModel.getPizzaArray()
    }
    
    
}
