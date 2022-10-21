//
//  MenuDetailBottomView.swift
//  SwiftLayout-Sample
//

import Foundation
import UIKit
import SwiftLayout

final class MenuDetailBottomView: MenuDetailBottomBaseView, Layoutable {
    @LayoutProperty var menu: Menu
    @LayoutProperty var isShowTopping: Bool = true

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
                Anchors.top
                Anchors.leading
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

            if isShowTopping {
                toppingStackView.anchors {
                    Anchors.top.equalTo(toppingTitleLabel, attribute: .bottom, constant: 10)
                    Anchors.horizontal()
                }.sublayout {
                    for (topping, toppingItemView) in zip(menu.availableToppings, toppingItemViews) {
                        toppingItemView.config {
                            $0.topping = topping
                        }
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
