//
//  MenuDetailBottomViewWithAnimation.swift
//  SwiftLayout-Sample
//

import Foundation
import UIKit
import SwiftLayout

final class MenuDetailBottomViewWithAnimation: MenuDetailBottomBaseView, Layoutable {
    @LayoutProperty var menu: Menu
    @AnimatableLayoutProperty(duration: 0.3) var isShowTopping: Bool = true

    override init(menu: Menu) {
        self.menu = menu
        super.init(menu: menu)
        self.sl.updateLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var activation: Activation?
    var layout: some Layout {
        self.sublayout {
            toppingTitleLabel.anchors {
                Anchors.top.leading
            }

            showToppingButton.config {
                if isShowTopping {
                    $0.setImage(.init(systemName: "chevron.down"), for: .normal)
                } else {
                    $0.setImage(.init(systemName: "chevron.up"), for: .normal)
                }
            }.anchors {
                Anchors.centerY.equalTo(toppingTitleLabel, attribute: .centerY, constant: 0)
                Anchors.trailing
                Anchors.size(width: 40, height: 30)
            }

            // For smooth animation, the toppingStackView is always attached to the view.
            // Change the appearance of the view simply by using the alpha value.
            toppingStackView.config {
                if isShowTopping {
                    $0.alpha = 1
                    $0.isUserInteractionEnabled = true
                } else {
                    $0.alpha = 0
                    $0.isUserInteractionEnabled = false
                }
            }.anchors {
                Anchors.top.equalTo(toppingTitleLabel, attribute: .bottom, constant: 10)
                Anchors.horizontal()
            }.sublayout {
                for (topping, toppingItemView) in zip(menu.availableToppings, toppingItemViews) {
                    toppingItemView.config {
                        $0.topping = topping
                    }
                }
            }

            (menu.isSoldOut ? soldOutLabel : orderButton).anchors {
                if self.isShowTopping {
                    Anchors.top.equalTo(toppingStackView, attribute: .bottom, constant: 15)
                } else {
                    Anchors.top.equalTo(toppingTitleLabel, attribute: .bottom, constant: 15)
                }
                Anchors.height.equalTo(constant: 40)
                Anchors.shoe()
            }
        }
    }

    override func updateMenu(_: Menu) {
        self.menu = menu
    }

    @objc
    override func toggleToppingView(_ sender: Any) {
        isShowTopping.toggle()
    }
}
