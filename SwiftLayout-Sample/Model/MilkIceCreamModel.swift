//
//  MilkIceCreamModel.swift
//  SwiftLayout-Sample
//

import Foundation
import UIKit

struct MilkIceCream: Menu {
    var thumbnailImage: UIImage? {
        UIImage(named: "milkIceCream")
    }
    var name: String {
        "Milk ice cream🍦"
    }
    var description: String {
        "Ice cream that you can feel the soft milk taste in your mouth. Enjoy the sweetness that everyone loves."
    }

    var isSoldOut: Bool
    var availableToppings: [Topping]

    init() {
        self.isSoldOut = false
        self.availableToppings = Topping.allCases
    }
}
