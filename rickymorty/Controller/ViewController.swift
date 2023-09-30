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


    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.setTableViewDelegate(self)
        return homeView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        view = homeView

        // Carregue os dados da API quando a vista é carregada
        loadMoreData()

        homeView.configureProtocols(datasource: self)
        navigationController?.delegate = self
    }

    // Função para carregar os dados da API
    func fetchRickModels() async throws -> [RickModel] {
        // Faça a requisição HTTP aqui
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.rickandmorty.com/api/character/?page=\(1)")!)

        // Decodifica os dados da resposta
        let rickModels = try JSONDecoder().decode([RickModel].self, from: data)

        return rickModels
    }

    @objc func loadMoreData() {
        // Faça a requisição HTTP com base na página atual
            let urlString = "https://api.rickandmorty.com/api/character/?page=\(currentPage)"
            DispatchQueue.global().async {
                Task {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: URL(string: urlString)!)
                        let rickModels = try JSONDecoder().decode([RickModel].self, from: data)
                        
                        // Adicione os novos dados à matriz existente
                        self.arrayRickModel += rickModels
                        
                        // Atualize a tabela na thread principal
                        DispatchQueue.main.async {
                            self.homeView.updateTableView()
                        }
                        
                        // Incremente a página atual para carregar mais dados na próxima vez
                        self.currentPage += 1
                    } catch {
                        // Trate os erros aqui, se necessário
                        print("Erro ao buscar dados: \(error)")
                    }
                }
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
