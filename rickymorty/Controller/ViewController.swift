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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell().listViewCellIdentifier) as? HomeViewCell else {
                return UITableViewCell()
            }
            
            // Configure a célula com dados fictícios para teste
        let titles = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
           let statuses = ["Status 1", "Status 2", "Status 3", "Status 4", "Status 5"]
           let locations = ["Location 1", "Location 2", "Location 3", "Location 4", "Location 5"]
           let memories = ["Memories 1", "Memories 2", "Memories 3", "Memories 4", "Memories 5"]
           
           // Especifique o nome da imagem com base no índice da linha
           let imageNames = ["image1", "image2", "image3", "image4", "image5"]
           
           // Verifique se o índice está dentro dos limites do array de nomes de imagem
           if indexPath.row < imageNames.count {
               cell.configure(title: titles[indexPath.row], status: statuses[indexPath.row], location: locations[indexPath.row], memories: memories[indexPath.row], imageName: imageNames[indexPath.row])
           }
            
            cell.backgroundColor = .yellow
        //cell.textLabel?.text = self.listItems[indexPath.row]
            return cell
    }
    
    
}
