//
//  MenuDetailViewController.swift
//  SwiftLayout-Sample
//

import UIKit
import SwiftLayout

class MenuDetailViewController: UIViewController, Layoutable {
    let thumbnailImageView = UIImageView().config {
        $0.backgroundColor = .blue.withAlphaComponent(0.2)
    }

    let contentView = UIView()
    let titleLabel = UILabel().config {
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
    }
    let descriptionLabel = UILabel().config {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15)
    }

    static let withAnimation: Bool = true
    lazy var menuDetailBottomView: MenuDetailBottomBaseView = Self.withAnimation ? MenuDetailBottomViewWithAnimation(menu: self.menu) : MenuDetailBottomView(menu: self.menu)

    var activation: Activation?
    @LayoutBuilder var layout: some Layout {
        view.sublayout {
            thumbnailImageView.config {
                $0.image = menu.thumbnailImage
            }.anchors {
                Anchors.height.equalTo(thumbnailImageView, attribute: .width)
                Anchors.cap(self.view.safeAreaLayoutGuide, offset: 20)
            }

            contentView.anchors {
                Anchors.top.equalTo(thumbnailImageView, attribute: .bottom, constant: 20)
                Anchors.shoe(self.view.safeAreaLayoutGuide, offset: 20)
            }.sublayout {
                titleLabel.config {
                    $0.text = menu.name
                }.anchors {
                    Anchors.top.leading
                }

                descriptionLabel.config {
                    $0.text = menu.description
                }.anchors {
                    Anchors.top.equalTo(titleLabel, attribute: .bottom, constant: 5)
                    Anchors.horizontal()
                }

                menuDetailBottomView.config {
                    $0.updateMenu(self.menu)
                }.anchors {
                    Anchors.shoe()
                }
            }
        }
    }

    @LayoutProperty var menu: Menu

    init(menu: Menu) {
        self.menu = menu
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        // Activate Layout
        self.sl.updateLayout()
    }
}
