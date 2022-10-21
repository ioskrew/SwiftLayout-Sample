//
//  ToppingItemView.swift
//  SwiftLayout-Sample
//

import Foundation
import UIKit

class UIKitToppingItemView: UIView {
    let titleLabel = UILabel().config {
        $0.font = .systemFont(ofSize: 15)
    }

    let countLabel = UILabel().config {
        $0.text = "0"
    }

    lazy var stepper = UIStepper().config {
        $0.value = 0
        $0.minimumValue = 0
        $0.maximumValue = 5
        $0.addTarget(self, action: #selector(didChangeStepperValue(_:)), for: .valueChanged)
    }

    var topping: Topping

    init(topping: Topping) {
        self.topping = topping
        super.init(frame: .zero)
        
        self.updateLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateLayout() {
        
        titleLabel.text = topping.displayName
        
        addSubview(titleLabel)
        addSubview(countLabel)
        addSubview(stepper)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 35),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.countLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.stepper.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stepper.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.stepper.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    @objc
    func didChangeStepperValue(_ sender: UIStepper) {
        countLabel.text = String(Int(sender.value))
    }
}

