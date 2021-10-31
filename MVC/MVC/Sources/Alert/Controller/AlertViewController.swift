//
//  AlertViewController.swift
//  MVC
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

final class AlertViewController: UIViewController {
    
    //MARK: - Properties
    lazy private var mainView = AlertView(subscriber: self)
    lazy private var model = AlertModel()
    
    //MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func loadView() {
        super.loadView()
        view = mainView
        followGestureDown()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.animateShowView()
        mainView.update(model: model)
    }
    
    //MARK: - Methods
    private func followGestureDown() {
        mainView.swipeDownAction = {
            self.backButtonAction()
        }
    }
}

//MARK: - MainView Delegate
extension AlertViewController: AlertViewDelegate {
    func backButtonAction() {
        mainView.animateHideView { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: false)
        }
    }
    
    func continueButtonAction() {
        mainView.animateHideView { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: false)
        }
    }
}
