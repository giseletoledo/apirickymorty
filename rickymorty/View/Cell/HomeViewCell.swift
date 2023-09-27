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
    
    
    //titulo
    private lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    //status
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    //localização
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    //memórias
    private lazy var memoriesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    //imagem
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        // Configurar a imagem à esquerda
        imageView.image = UIImage(named: "image1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        // Adicione as visualizações à célula
        addSubview(leftImageView)
        addSubview(tituloLabel)
        addSubview(statusLabel)
        addSubview(locationLabel)
        addSubview(memoriesLabel)
    }
    
    private func setupConstraints() {
        // Defina as restrições para posicionar as visualizações
        // Você pode ajustar os valores de espaçamento, alinhamento, etc., conforme necessário
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        tituloLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        memoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Restrições para a imagem à esquerda
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 50),
            leftImageView.heightAnchor.constraint(equalToConstant: 50),
            
            // Restrições para os rótulos de texto
            tituloLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            tituloLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            tituloLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            locationLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            memoriesLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            memoriesLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
            memoriesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            memoriesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    
}

extension UITableViewCell {
    var configure: (String, String, String, String) -> Void {
        get {
            return { titulo, status, location, memories in
                self.tituloLabel.text = titulo
                self.statusLabel.text = status
                self.locationLabel.text = location
                self.memoriesLabel.text = memories
            }
        }
    }
}
