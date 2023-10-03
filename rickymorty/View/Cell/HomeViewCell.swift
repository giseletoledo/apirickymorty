//
//  HomeViewCell.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit

class HomeViewCell:UITableViewCell {
    
    let listViewCellIdentifier = "HomeViewCellIdentifier"
    
    // Informações que aparecem dentro de cada cell da tabela
    
    //container
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //titulo
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
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
    
    //imagem
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        // Configurar a imagem à esquerda
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupSubviews() {
        // Adicione as visualizações à célula
        addSubview(containerView)
        containerView.addSubview(leftImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(statusLabel)
        containerView.addSubview(locationLabel)
        containerView.addSubview(memoriesLabel)
    }
    
    private func setupAppearance() {
        // Adicione uma borda arredondada cinza
        self.containerView.layer.cornerRadius = 10
        
        let borderColor = UIColor(named: "ColorBorderGreen")
        let shadowColor = UIColor(named: "ColorShadowGreen")
        
        // Crie uma nova cor verde com um valor alpha (transparência)
      
        self.containerView.layer.borderColor = borderColor?.cgColor
        
        self.containerView.layer.borderWidth = 1
        
        // Adicione uma sombra simples
        self.containerView.layer.shadowColor = shadowColor?.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.containerView.layer.shadowRadius = 2
        self.containerView.layer.masksToBounds = false
    }
    
    private func setupConstraints() {
        // Defina as restrições para posicionar as visualizações
        // Você pode ajustar os valores de espaçamento, alinhamento, conforme necessário
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        memoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Restrições para o containerView
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            // Restrições para a imagem à esquerda
            leftImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            leftImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            leftImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            leftImageView.widthAnchor.constraint(equalToConstant: 100),
            leftImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Restrições para os rótulos de texto
            titleLabel.topAnchor.constraint(equalTo: leftImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            memoriesLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            memoriesLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            memoriesLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            memoriesLabel.bottomAnchor.constraint(equalTo: leftImageView.bottomAnchor)
        ])
        
    }
    
    
    func configure(model:RickModel) {
        titleLabel.text = model.title
        statusLabel.text = model.status
        locationLabel.text = model.lastKnownLocation
        memoriesLabel.text = model.memories
        let imageURLString = model.imageNames
        
        if let imageURL = URL(string: imageURLString) {
            // Use URLSession para baixar a imagem de forma assíncrona
            URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                if let error = error {
                    print("Erro ao baixar a imagem: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    // Configure a imagem na thread principal
                    DispatchQueue.main.async {
                        self.leftImageView.image = image
                    }
                }
            }.resume()
        }
        
    }
}
