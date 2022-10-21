//
//  ToppingItemView.swift
//  SwiftLayout-Sample
//

import Foundation
import UIKit
import SwiftLayout

class ToppingItemView: UIView, Layoutable {
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

    @LayoutProperty var topping: Topping

    init(topping: Topping) {
        self.topping = topping
        super.init(frame: .zero)
        self.sl.updateLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var activation: Activation?
    var layout: some Layout {
        self.anchors {
            Anchors.height.equalTo(constant: 35)
        }.sublayout {
            titleLabel.config {
                $0.text = topping.displayName
            }.anchors {
                Anchors.leading.equalToSuper(constant: 0)
                Anchors.centerY
            }

            countLabel.anchors {
                Anchors.centerY
            }

            stepper.anchors {
                Anchors.leading.equalTo(countLabel, attribute: .trailing, constant: 20)
                Anchors.centerY
                Anchors.trailing.equalToSuper(constant: 0)
            }
        }
    }

    @objc
    func didChangeStepperValue(_ sender: UIStepper) {
        countLabel.text = String(Int(sender.value))
    }
}
