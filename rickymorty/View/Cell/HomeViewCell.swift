//
//  HomeViewCell.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 26/09/23.
//

import UIKit



class HomeViewCell:UITableViewCell {
    
    let listViewCellIdentifier = "HomeViewCellIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           //setupSubviews()
           //setupContraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
