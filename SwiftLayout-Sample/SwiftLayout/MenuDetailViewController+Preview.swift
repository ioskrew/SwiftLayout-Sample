//
//  MenuDetailViewController+Preview.swift
//  SwiftLayout-Sample
//

import Foundation
import SwiftUI

struct MenuDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13 mini", "iPhone 13 Pro", "iPhone 13 Pro Max"], id: \.self) { device in
            MenuDetailViewController(menu: MilkIceCream()).sl.swiftUI
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }

    }
}
