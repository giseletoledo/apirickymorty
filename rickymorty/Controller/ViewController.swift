//
//  ViewController.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    private var arrayRickModel: [RickModel] = []
    var currentPage = 1 // Mantenha o controle da página atual
    
    private let networkManager: NetworkManagerProtocol = NetworkManager()
        
    private lazy var homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        view.backgroundColor = .white
        // Carregue os dados da API quando a vista é carregada
        loadMoreData { _ in
            print("arrayRickModel: \(self.arrayRickModel)")
            print("arrayRickModel.count \(self.arrayRickModel.count)")
            DispatchQueue.main.async {
                self.homeView.updateTableView()
            }
        }
        
        homeView.configureProtocols(datasource: self, delegate: self)
        navigationController?.delegate = self
    }

    
    func loadMoreData(_ completion: @escaping (Result<RickAPI, Error>) -> Void) {
        // Faça a requisição HTTP com base na página atual
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(currentPage)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let request = URLRequest(url: url)
        networkManager.get(request: request) { (result: Result<RickAPI, Error>) in
            switch result {
            case .success(let apiresults):
                print("apiresults: \(apiresults)")
                    let data = apiresults
                    if let characters = data.results {
                        for item in characters {
                            self.arrayRickModel.append(RickModel(title: item.name, status: item.status, lastKnownLocation: item.location?.name ?? "TESTE", memories: item.species, imageNames: item.image))
                        }
                    }
                completion(.success(apiresults))
            case .failure(let error):
                print("Erro ao buscar dados: \(error)")
                completion(.failure(error))
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell().listViewCellIdentifier) as? HomeViewCell else {
            // Lida com o erro de desembrulhar a célula
            fatalError("A célula personalizada não pode ser desembrulhada.")
        }
        
        // Verifique se o índice está dentro dos limites do array de nomes de imagem
        cell.configure(model: arrayRickModel[indexPath.section])
        cell.backgroundColor = .white
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Crie uma instância da DetailViewController com os dados da célula selecionada
        let selectedModel = arrayRickModel[indexPath.section]
        let detailViewController = DetailViewController(selectedModel: selectedModel)
        detailViewController.imageURL = URL(string: selectedModel.imageNames)
        // Apresente a DetailViewController
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayRickModel.count
    }
}


protocol NetworkManagerProtocol {
    func get<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                let statusCode = httpResponse.statusCode
                let localizedDescription = HTTPURLResponse.localizedString(forStatusCode: statusCode)
                completion(.failure(NSError(domain: "HTTP Error", code: statusCode, userInfo: [NSLocalizedDescriptionKey: localizedDescription])))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
