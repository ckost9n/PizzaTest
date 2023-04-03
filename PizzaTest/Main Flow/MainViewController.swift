//
//  MainViewController.swift
//  PizzaTest
//
//  Created by Konstantin on 03.04.2023.
//

import UIKit
import SnapKit

protocol MainViewControllerProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    
    func updateUI(with: [PizzaModel])
}

class MainViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - UI

    private var menuTableView = UITableView()
    
    // MARK: - Private Properties
    
    var menuList: [PizzaModel] = []
    
    // MARK: - Life cycle
    
    init(presenter: MainPresenterProtocol?) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        assertionFailure()
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        
        setupViews()
        setDelegate()
    }
    
    private func setDelegate() {
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

}

extension MainViewController: MainViewControllerProtocol {
    func updateUI(with model: [PizzaModel]) {
        DispatchQueue.main.async {
            self.menuList = model
            self.menuTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        let model = menuList[indexPath.row]
        cell.textLabel?.text = model.name
        
        return cell
    }
    
}

// MARK: - Setup Views

extension MainViewController {
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(menuTableView)
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "123")
        
        menuTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
}
