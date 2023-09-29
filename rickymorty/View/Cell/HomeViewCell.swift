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
        imageView.image = UIImage(named: "image1")
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
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Adiciona espaçamento ao conteúdo da célula
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    private func setupSubviews() {
        // Adicione as visualizações à célula
        addSubview(leftImageView)
        addSubview(titleLabel)
        addSubview(statusLabel)
        addSubview(locationLabel)
        addSubview(memoriesLabel)
    }
    
    private func setupAppearance() {
        // Adicione uma borda arredondada cinza
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        // Adicione uma sombra simples
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
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
            // Restrições para a imagem à esquerda
               leftImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
               leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
               leftImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
               leftImageView.widthAnchor.constraint(equalToConstant: 100),
               leftImageView.heightAnchor.constraint(equalToConstant: 100),
               

               // Restrições para os rótulos de texto
               titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
               titleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 16),
               titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

               statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
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
    
    func configure(title: String, status: String, location: String, memories: String, imageName: String) {
          titleLabel.text = title
          statusLabel.text = status
          locationLabel.text = location
          memoriesLabel.text = memories
          leftImageView.image = UIImage(named: imageName)
      }
}
