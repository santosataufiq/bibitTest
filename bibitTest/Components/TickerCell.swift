//
//  TickerCell.swift
//  bibitTest
//
//  Created by harrie yusuf on 31/03/22.
//

import UIKit

final class TickerCell: UITableViewCell {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(leftView)
        stackView.addArrangedSubview(rightView)
        addSubview(stackView)
        return stackView
    }()
    
    private let leftView = UIView()
    
    private let rightView = UIView()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "nameLabel"
        leftView.addSubview(label)
        return label
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        leftView.addSubview(label)
        return label
    }()
    
    private lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        rightView.addSubview(label)
        return label
    }()
    
    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        rightView.addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String,
             fullName: String,
             currency: String,
             percentage: String) {
        nameLabel.text = name
        fullNameLabel.text = fullName
        currencyLabel.text = currency
        percentageLabel.text = percentage
    }
    
    private func layoutView() {
        layoutStackLabel()
        layoutNameLabel()
        layoutFullNameLabel()
        layoutCurrencyLabel()
        layoutPercentageLabel()
    }
    
    private func layoutStackLabel() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0)
        ])
    }
    
    private func layoutNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 16),
            leftView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
        ])
    }
    
    private func layoutFullNameLabel() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            leftView.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor, constant: 16),
            leftView.bottomAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16)
        ])
    }
    
    private func layoutCurrencyLabel() {
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyLabel.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 16),
            currencyLabel.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 16),
            rightView.trailingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: 16)
        ])
    }
    
    private func layoutPercentageLabel() {
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            percentageLabel.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 16),
            percentageLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 8),
            rightView.trailingAnchor.constraint(equalTo: percentageLabel.trailingAnchor, constant: 16)
        ])
    }
}
