//
//  ViewController.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    // Configure a célula com dados fictícios para teste
    let titles = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    let statuses = ["Status 1", "Status 2", "Status 3", "Status 4", "Status 5"]
    let locations = ["Location 1", "Location 2", "Location 3", "Location 4", "Location 5"]
    let memories = ["Memories 1", "Memories 2", "Memories 3", "Memories 4", "Memories 5"]
    
    // Especifique o nome da imagem com base no índice da linha
    let imageNames = ["image1", "image2", "image3", "image4", "image1"]
    
    private lazy var homeView:HomeView = {
        let homeView = HomeView()
        homeView.setTableViewDelegate(self)
        
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        view = homeView
        homeView.configureProtocols(datasource: self)
        navigationController?.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController == self {
            // Esta condição verifica se estamos voltando para a lista principal
            // Você pode atualizar a lista principal aqui, se necessário.
            homeView.updateTableView()
        }
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell().listViewCellIdentifier) as? HomeViewCell else {
            // Lida com o erro de desembrulhar a célula
            fatalError("A célula personalizada não pode ser desembrulhada.")
        }
        
        // Verifique se o índice está dentro dos limites do array de nomes de imagem
        if indexPath.row < imageNames.count {
            cell.configure(title: titles[indexPath.row], status: statuses[indexPath.row], location: locations[indexPath.row], memories: memories[indexPath.row], imageName: imageNames[indexPath.row])
        }
        
        cell.backgroundColor = .white
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Verifique se o índice está dentro dos limites do array de nomes de imagem
        guard indexPath.row < imageNames.count else {
            return
        }
        
        // Obtenha os dados da célula selecionada
        let title = titles[indexPath.row]
        let status = statuses[indexPath.row]
        let location = locations[indexPath.row]
        let memories = memories[indexPath.row]
        let imageName = imageNames[indexPath.row]
        
        // Crie uma instância da DetailViewController com os dados da célula selecionada
        let detailViewController = DetailViewController(title: title, status: status, location: location, memories: memories, image: UIImage(named: imageName))
        
        // Apresente a DetailViewController
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

