//
//  RadioButtosView.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/10/23.
//

import UIKit

protocol RadioButtonsViewDelegate: AnyObject {
    func radioButtonView(_ view: RadioButtonsView, didSelectStatus status: String)
}

class RadioButtonsView: UIView {
    
    weak var delegate: RadioButtonsViewDelegate?
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    // UILabel para identificar o RadioButton "alive"
    private lazy var aliveLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alive"
        label.textColor = .black
        return label
    }()

    // UILabel para identificar o RadioButton "dead"
    private lazy var deadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dead"
        label.textColor = .black
        return label
    }()

    // UILabel para identificar o RadioButton "unknown"
    private lazy var unknownLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unknown"
        label.textColor = .black
        return label
    }()
    
    private lazy var aliveRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "smallcircle.circle"), for: .normal)
        button.setImage(UIImage(systemName: "smallcircle.filled.circle"), for: .selected)
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        button.tag = 0 // Tag para identificar o botão "alive"
        button.backgroundColor = .green
        return button
    }()

    private lazy var deadRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "smallcircle.circle"), for: .normal)
        button.setImage(UIImage(systemName: "smallcircle.filled.circle"), for: .selected)
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        button.tag = 1 // Tag para identificar o botão "dead"
        button.backgroundColor = .blue
        return button
    }()

    private lazy var unknownRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "smallcircle.circle"), for: .normal)
        button.setImage(UIImage(systemName: "smallcircle.filled.circle"), for: .selected)
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        button.tag = 2 // Tag para identificar o botão "unknown"
        button.backgroundColor = .yellow
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureRadioButtons()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    private func configureRadioButtons() {
        addSubview(container)
        container.addSubview(aliveLabel)
        container.addSubview(aliveRadioButton)
        container.addSubview(deadLabel)
        container.addSubview(deadRadioButton)
        container.addSubview(unknownLabel)
        container.addSubview(unknownRadioButton)
    }
    
    
    @objc func radioButtonTapped(_ sender: UIButton) {
        // Alterna o estado de seleção do botão pressionado
        sender.isSelected = !sender.isSelected

        // Desmarque os outros botões
        for button in [aliveRadioButton, deadRadioButton, unknownRadioButton] {
            if button != sender {
                button.isSelected = false
            }
        }

        // Valor da tag para identificar o botão selecionado
        let selectedStatus: String
        switch sender.tag {
        case 0:
            selectedStatus = "alive"
        case 1:
            selectedStatus = "dead"
        case 2:
            selectedStatus = "unknown"
        default:
            selectedStatus = ""
        }
        delegate?.radioButtonView(self, didSelectStatus: selectedStatus)
    }

    // Configurando os botões de seleção horizontalmente
    private func configureConstraints() {
        NSLayoutConstraint.activate([
       // Container
        container.topAnchor.constraint(equalTo: topAnchor, constant: 8),
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        // Labels
        aliveLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
        deadLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
        unknownLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),

        aliveLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -60),
        deadLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        unknownLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 60),

        // RadioButtons
        aliveRadioButton.topAnchor.constraint(equalTo: aliveLabel.bottomAnchor, constant: 8),
        deadRadioButton.topAnchor.constraint(equalTo: deadLabel.bottomAnchor, constant: 8),
        unknownRadioButton.topAnchor.constraint(equalTo: unknownLabel.bottomAnchor, constant: 8),

        aliveRadioButton.centerXAnchor.constraint(equalTo: aliveLabel.centerXAnchor),
        deadRadioButton.centerXAnchor.constraint(equalTo: deadLabel.centerXAnchor),
        unknownRadioButton.centerXAnchor.constraint(equalTo: unknownLabel.centerXAnchor),
        ])
    }
}
