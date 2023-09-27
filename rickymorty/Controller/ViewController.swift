//
//  ViewController.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var homeView:HomeView = {
        let homeView = HomeView()
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        view = homeView
        homeView.configureProtocols(datasource: self)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell().listViewCellIdentifier)!
        // Configure a célula com dados fictícios para teste
        cell.configure("Quantum Rick",
                       "Unknown",
                       "Last known location: Earth",
                       "Rick's Memories: Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        //cell.textLabel?.text = self.listItems[indexPath.row]
        cell.backgroundColor = .yellow
        return cell
    }
    
    
}
