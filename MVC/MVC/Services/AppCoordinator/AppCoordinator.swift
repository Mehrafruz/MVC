//
//  AppCoordinator.swift
//  MVP+Coordinator
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

/// Отдельный метод необходимый для координации первого экрана приложения
/// Он отдельный потому-что тут могут добавится экраны онбординга, АВ тестов и тому подобного

protocol AppCoordinatorProtocol: AnyObject {
    func startApplication() -> UIViewController
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    //MARK: - Methods
    func startApplication() -> UIViewController {
        return ViewController()
    }

}



