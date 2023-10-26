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
    
    private lazy var aliveRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "radio_unchecked"), for: .normal)
        button.setImage(UIImage(named: "radio_checked"), for: .selected)
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        button.tag = 0 // Tag para identificar o botão "alive"
        return button
    }()

    private lazy var deadRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "radio_unchecked"), for: .normal)
        button.setImage(UIImage(named: "radio_checked"), for: .selected)
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        button.tag = 1 // Tag para identificar o botão "dead"
        return button
    }()

    private lazy var unknownRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "radio_unchecked"), for: .normal)
        button.setImage(UIImage(named: "radio_checked"), for: .selected)
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        button.tag = 2 // Tag para identificar o botão "unknown"
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
        addSubview(aliveRadioButton)
        addSubview(deadRadioButton)
        addSubview(unknownRadioButton)

        // Adiciona ações para os botões de seleção
        aliveRadioButton.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        deadRadioButton.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        unknownRadioButton.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
    }

    // Configurando os botões de seleção horizontalmente
    private func configureConstraints() {
        NSLayoutConstraint.activate([
           
            aliveRadioButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aliveRadioButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            deadRadioButton.leadingAnchor.constraint(equalTo: aliveRadioButton.trailingAnchor, constant: 16),
            deadRadioButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            unknownRadioButton.leadingAnchor.constraint(equalTo: deadRadioButton.trailingAnchor, constant: 16),
            unknownRadioButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            // Configurar o tamanho dos botões
            aliveRadioButton.widthAnchor.constraint(equalToConstant: 30),
            aliveRadioButton.heightAnchor.constraint(equalToConstant: 30),

            deadRadioButton.widthAnchor.constraint(equalToConstant: 30),
            deadRadioButton.heightAnchor.constraint(equalToConstant: 30),

            unknownRadioButton.widthAnchor.constraint(equalToConstant: 30),
            unknownRadioButton.heightAnchor.constraint(equalToConstant: 30),
        ])
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

        // Agora você pode usar o valor da tag para identificar o botão selecionado
        let selectedStatus: String
        switch sender.tag {
        case 0:
            selectedStatus = "alive"
        case 1:
            selectedStatus = "dead"
        case 2:
            selectedStatus = "unknown"
        default:
            selectedStatus = "" // Valor padrão ou tratamento de erro, se necessário
        }
        
        delegate?.radioButtonView(self, didSelectStatus: selectedStatus)
        
    }

}
