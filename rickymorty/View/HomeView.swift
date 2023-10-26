//
//  HomeView.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class HomeView:UIView {
    
    var isToggled = false
    
    var radioButtonsViewHeightVisible: CGFloat!
    var radioButtonsViewHeightConstraint: NSLayoutConstraint!

    private lazy var titleLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.font = UIFont.boldSystemFont(ofSize: 24)
           label.textColor = .darkGray
           label.text = "Characters"
           return label
       }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Menu", for: .normal)
        button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        button.backgroundColor = .systemPink
        return button
    }()
    
    public lazy var radioButtonsView: RadioButtonsView = {
        let view = RadioButtonsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
       
    lazy var searchBar: UISearchBar = {
           let searchBar = UISearchBar()
           searchBar.backgroundColor = .white
           searchBar.translatesAutoresizingMaskIntoConstraints = false
           return searchBar
       }()
        
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell().listViewCellIdentifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleRadioButtonVisibility(animated: Bool = true) {
        if radioButtonsViewHeightConstraint.constant != 0 {
            radioButtonsViewHeightVisible = radioButtonsViewHeightConstraint.constant
            radioButtonsViewHeightConstraint.constant = 0
        } else {
            radioButtonsViewHeightConstraint.constant = radioButtonsViewHeightVisible
        }
        if animated {
            UIView.animate(withDuration: 0.2, animations: {
                self.layoutIfNeeded()
            }, completion: nil)
        } else {
            self.layoutIfNeeded()
        }
    }
    
    
    @objc func menuButtonTapped() {
        // Alterna a visibilidade da view `radioButtonsView`
        toggleRadioButtonVisibility()

        // Atualiza a aparência do botão
        if radioButtonsViewHeightConstraint.constant != 0 {
            menuButton.backgroundColor = .systemGreen
            menuButton.setTitle("Fechar", for: .normal)
        } else {
            menuButton.backgroundColor = .systemPink
            menuButton.setTitle("Menu", for: .normal)
        }
    }
    
    func configureProtocols(datasource: UITableViewDataSource, delegate: UITableViewDelegate, searchBarDelegate: UISearchBarDelegate){
        tableView.dataSource = datasource
        tableView.delegate = delegate
        searchBar.delegate = searchBarDelegate
    }
}

extension HomeView{
    
    func configureSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(searchBar)
        self.addSubview(menuButton)
        self.addSubview(radioButtonsView)
        self.addSubview(tableView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            // Posicione o botão ao lado da searchBar
            menuButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            menuButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            menuButton.heightAnchor.constraint(equalToConstant: 36),
            menuButton.widthAnchor.constraint(equalToConstant: 36),
            
            radioButtonsView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            radioButtonsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            radioButtonsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            radioButtonsView.heightAnchor.constraint(equalToConstant: 200),
            
            tableView.topAnchor.constraint(equalTo: radioButtonsView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}




