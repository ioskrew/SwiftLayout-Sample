//
//  UIKitMenuDetailViewController.swift
//  SwiftLayout-Sample
//

import UIKit

class UIKitMenuDetailViewController: UIViewController {
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue.withAlphaComponent(0.2)
        return imageView
    }()

    let contentView = UIView()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        return titleLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 15)
        return descriptionLabel
    }()

    lazy var menuDetailBottomView = UIKitMenuDetailBottomView(menu: self.menu)
    
    func updateLayout() {
        
        thumbnailImageView.image = menu.thumbnailImage
        titleLabel.text = menu.name
        descriptionLabel.text = menu.description
        menuDetailBottomView.menu = menu
        
        view.addSubview(thumbnailImageView)
        view.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(menuDetailBottomView)
        
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        menuDetailBottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor),
            thumbnailImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            thumbnailImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            thumbnailImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            contentView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 20),
            contentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            contentView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            menuDetailBottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            menuDetailBottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuDetailBottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    var menu: Menu

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
        self.updateLayout()
    }
}

import SwiftUI
struct UIKitMenuDetail_Previews: PreviewProvider, UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        UIKitMenuDetailViewController(menu: MilkIceCream())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    static var previews: some View {
        ForEach(["iPhone 13 mini", "iPhone 13 Pro", "iPhone 13 Pro Max"], id: \.self) { device in
            UIKitMenuDetail_Previews()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }

    }
}
