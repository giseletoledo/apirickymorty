//
//  HomeView.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class HomeView:UIView {
    
    private lazy var titleLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.font = UIFont.boldSystemFont(ofSize: 24)
           label.textColor = .darkGray
           label.text = "Characters"
           return label
       }()
       
       private lazy var searchBar: UISearchBar = {
           let searchBar = UISearchBar()
           searchBar.backgroundColor = .white
           searchBar.translatesAutoresizingMaskIntoConstraints = false
           return searchBar
       }()
        
    private lazy var tableView: UITableView = {
        
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
    func configureProtocols(datasource: UITableViewDataSource, delegate: UITableViewDelegate, searchBarDelegate: UISearchBarDelegate){
        tableView.dataSource = datasource
        tableView.delegate = delegate
        searchBar.delegate = searchBarDelegate
    }

    func updateTableView() {
        tableView.reloadData()
    }
}

extension HomeView{
    
    func configureSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(searchBar)
        self.addSubview(tableView)
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                       
                       searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
                       searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                       searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                       
                       tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
                       tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                       tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                       tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}




