//
//  ProfilViewController.swift
//  authorization_UIKit
//
//  Created by Artem Sulzhenko on 22.10.2022.
//

import UIKit

class ProfilViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var closeButton: UIButton!
    
    // MARK: - Public properties
    var userName: String!
    
    // MARK: - Colors for gradient
    private let colorOne = UIColor(red: 232/255, green: 82/255, blue: 122/255, alpha: 1)
    private let colorTwo = UIColor(red: 238/255, green: 166/255, blue: 160/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVerticalGradientLayer(topColor: colorOne, bottomColor: colorTwo)

        setItemsSettings()
    }
}

extension ProfilViewController {
    // MARK: - Set background color
    private func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    // MARK: - Set items settings
    private func setItemsSettings(){
        userNameLabel.text = "Hello \(userName ?? "No name")!"
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.layer.cornerRadius = 15
        closeButton.backgroundColor = .purple
    }
}
