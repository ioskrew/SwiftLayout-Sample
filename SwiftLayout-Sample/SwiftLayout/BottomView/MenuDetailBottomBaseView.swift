//
//  MenuDetailBottomBaseView.swift
//  SwiftLayout-Sample
//

import Foundation
import UIKit
import SwiftLayout

class MenuDetailBottomBaseView: UIView {
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
    let toppingItemViews: [ToppingItemView] = [
        ToppingItemView(topping: .oreo),
        ToppingItemView(topping: .oreo),
        ToppingItemView(topping: .oreo)
    ]

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

    init(menu: Menu) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateMenu(_: Menu) {
    }

    @objc
    func toggleToppingView(_ sender: Any) {
    }
}

