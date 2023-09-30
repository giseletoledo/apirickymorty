//
//  DetailViewController.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 29/09/23.
//

import UIKit

class DetailViewController: UIViewController {
    // Declare as visualizações e rótulos necessários para mostrar os dados detalhados e a imagem.
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    //status
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    //localização
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    //memórias
    private lazy var memoriesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Declare propriedades para armazenar os dados que serão exibidos na view de detalhe.
    var titleText: String?
    var image: UIImage?
    var statusText: String?
    var locationText: String?
    var memoriesText: String?
    
    // Inicializador personalizado para receber os dados.
    init(selectedModel:RickModel) {
        super.init(nibName: nil, bundle: nil)
        self.titleText = selectedModel.title
        self.statusText = selectedModel.status
        self.locationText = selectedModel.lastKnownLocation
        self.memoriesText = selectedModel.memories
        self.image = UIImage(named: selectedModel.imageNames)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Implemente a configuração das visualizações com os dados.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        
        // Configure as visualizações com os dados passados.
        titleLabel.text = titleText
        statusLabel.text = statusText
        locationLabel.text = locationText
        memoriesLabel.text = memoriesText
        imageView.image = image
    }
    
    private func setupSubviews() {
        // Adicione as visualizações à view da detalhe e defina as restrições.
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(statusLabel)
        view.addSubview(locationLabel)
        view.addSubview(memoriesLabel)
    }
    
    private func setupConstraints() {
        // Implemente as restrições de posicionamento das subviews.
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        memoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Restrições para a imageView
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Restrições para a titleLabel
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Restrições para a statusLabel
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Restrições para a locationLabel
            locationLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Restrições para a memoriesLabel
            memoriesLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            memoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            memoriesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

}
