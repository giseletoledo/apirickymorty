//
//  HomeView.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class HomeView:UIView {
        
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
    func configureProtocols(datasource: UITableViewDataSource){
        tableView.dataSource = datasource
    }
    func setTableViewDelegate(_ delegate: UITableViewDelegate) {
           tableView.delegate = delegate
    }
    func updateTableView() {
            tableView.reloadData()
        }
}

extension HomeView{
    func configureSubviews() {
        
        self.addSubview(self.tableView)
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}


