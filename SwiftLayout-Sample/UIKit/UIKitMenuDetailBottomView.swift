//
//  MenuDetailBottomView.swift
//  SwiftLayout-Sample
//

import Foundation
import UIKit

final class UIKitMenuDetailBottomView: UIView {
    let orderView = UIView()
    lazy var showToppingButton = UIButton().config {
        $0.tintColor = .label
        $0.addTarget(self, action: #selector(toggleToppingView(_:)), for: .touchUpInside)
    }

    let toppingTitleLabel = UILabel().config {
        $0.text = "Topping"
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    let toppingStackView = UIStackView().config {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }

    let orderButton = UIButton().config {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemGray3
        $0.setTitle("Order", for: .normal)
    }
    let soldOutLabel = UILabel().config {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = .systemGray5
        $0.textColor = .systemRed
        $0.text = "Sold out"
        $0.textAlignment = .center
    }

    var menu: Menu
    var isShowTopping: Bool = true {
        didSet {
            if isShowTopping {
                showToppingButton.setImage(.init(systemName: "chevron.down"), for: .normal)
            } else {
                showToppingButton.setImage(.init(systemName: "chevron.up"), for: .normal)
            }
        }
    }

    init(menu: Menu) {
        self.menu = menu
        super.init(frame: .zero)
        self.updateLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateLayout() {
        addSubview(toppingTitleLabel)
        addSubview(showToppingButton)
        addSubview(toppingStackView)
        
        addSubview(soldOutLabel)
        addSubview(orderButton)
        
        soldOutLabel.isHidden = !menu.isSoldOut
        orderButton.isHidden = menu.isSoldOut
        
        toppingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        showToppingButton.translatesAutoresizingMaskIntoConstraints = false
        toppingStackView.translatesAutoresizingMaskIntoConstraints = false
        soldOutLabel.translatesAutoresizingMaskIntoConstraints = false
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        
        for topping in menu.availableToppings {
            toppingStackView.addArrangedSubview(ToppingItemView(topping: topping))
        }
        
        NSLayoutConstraint.activate([
            toppingTitleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            toppingTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            showToppingButton.centerXAnchor.constraint(equalTo: toppingTitleLabel.centerXAnchor),
            showToppingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            showToppingButton.widthAnchor.constraint(equalToConstant: 40),
            showToppingButton.heightAnchor.constraint(equalToConstant: 30),
            
            toppingStackView.topAnchor.constraint(equalTo: toppingTitleLabel.bottomAnchor, constant: 10),
            toppingStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            toppingStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            soldOutLabel.topAnchor.constraint(equalTo: toppingStackView.bottomAnchor, constant: 15),
            soldOutLabel.heightAnchor.constraint(equalToConstant: 40),
            soldOutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            soldOutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            soldOutLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            orderButton.topAnchor.constraint(equalTo: toppingStackView.bottomAnchor, constant: 15),
            orderButton.heightAnchor.constraint(equalToConstant: 40),
            orderButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            orderButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            orderButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc
    func toggleToppingView(_ sender: Any) {
        isShowTopping.toggle()
    }
    
}
