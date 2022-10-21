//
//  MenuModel.swift
//  SwiftLayout-Sample
//

import UIKit

protocol Menu {
    var thumbnailImage: UIImage? { get }
    var name: String { get }
    var description: String { get }

    var isSoldOut: Bool { get }
    var availableToppings: [Topping] { get }
}
