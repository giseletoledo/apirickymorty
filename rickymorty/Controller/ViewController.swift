//
//  ViewController.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    private var arrayRickModel:[RickModel] = []
    
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
        fetchModel()
        homeView.configureProtocols(datasource: self)
        navigationController?.delegate = self
    }
    
    fileprivate func fetchModel() {
        arrayRickModel.append(RickModel(title: "Item 1", status: "Status 1", lastKnownLocation: "Location 1", memories: "Memories 1", imageNames: "image1"))
        arrayRickModel.append(RickModel(title: "Item 2", status: "Status 2", lastKnownLocation: "Location 2", memories: "Memories 2", imageNames: "image2"))
        arrayRickModel.append(RickModel(title: "Item 3", status: "Status 3", lastKnownLocation: "Location 3", memories: "Memories 3", imageNames: "image3"))
        arrayRickModel.append(RickModel(title: "Item 4", status: "Status 4", lastKnownLocation: "Location 4", memories: "Memories 4", imageNames: "image4"))
        arrayRickModel.append(RickModel(title: "Item 5", status: "Status 5", lastKnownLocation: "Location 5", memories: "Memories 5", imageNames: "image1"))
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
        return arrayRickModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell().listViewCellIdentifier) as? HomeViewCell else {
            // Lida com o erro de desembrulhar a célula
            fatalError("A célula personalizada não pode ser desembrulhada.")
        }
        
        // Verifique se o índice está dentro dos limites do array de nomes de imagem
        cell.configure(model: arrayRickModel[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Crie uma instância da DetailViewController com os dados da célula selecionada
        let detailViewController = DetailViewController(selectedModel: arrayRickModel[indexPath.row])
        
        // Apresente a DetailViewController
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

