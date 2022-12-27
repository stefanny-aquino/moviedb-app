//
//  LastSeasonView.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import UIKit

class LastSeasonView: UIView {
    
    var lastSeason: Season? {
        didSet {
            titleLabel.text = lastSeason?.name
            airDateLabel.text = lastSeason?.airDate.formatDate()
        }
    }
    var titleLabel: UILabel = UILabel()
    private var airDateLabel: UILabel = UILabel()
    private var viewAllButton: UIButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.textColor = .white
        
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        airDateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        airDateLabel.textColor = UIColor(named: "primary.green")
        
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        viewAllButton.setTitle("View All Seasons", for: .normal)
        viewAllButton.backgroundColor = UIColor(named: "primary.green")
        viewAllButton.titleLabel?.font =  UIFont.preferredFont(forTextStyle: .caption2)
        viewAllButton.layer.cornerRadius = 5
        
        addSubview(titleLabel)
        addSubview(airDateLabel)
        addSubview(viewAllButton)
        NSLayoutConstraint.activate([
            airDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            viewAllButton.topAnchor.constraint(equalTo: airDateLabel.bottomAnchor, constant: 12),
            viewAllButton.widthAnchor.constraint(equalToConstant: 120),
            viewAllButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
