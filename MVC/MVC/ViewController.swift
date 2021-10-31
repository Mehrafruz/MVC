//
//  ViewController.swift
//  MVC
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click here", for: .normal)
        button.backgroundColor = .brown
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 104),
            button.heightAnchor.constraint(equalToConstant: 104*0.92)
        ])
    }
    
    @objc
    func buttonAction() {
        present(AlertViewController(), animated: true, completion: nil)
    }
}

