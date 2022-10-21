//
//  Topping.swift
//  SwiftLayout-Sample
//

import Foundation

enum Topping: Hashable, CaseIterable {
    case oreo
    case lotus
    case brownRiceCrunch

    var displayName: String {
        switch self {
        case .oreo:
            return "Oreo"
        case .lotus:
            return "Lotus"
        case .brownRiceCrunch:
            return "Brown rice Crunch"
        }
    }
}
