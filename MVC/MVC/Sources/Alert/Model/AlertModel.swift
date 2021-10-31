//
//  AlertModel.swift
//  MVC
//
//  Created by Мехрафруз on 31.10.2021.
//

import Foundation

final class AlertModel {
    
    //MARK: - Properties
    
    struct BasicAlert {
        let title: String
        let description: String
        let backButtonText: String
        let continueText: String
    }
    
    public let basecAlert = BasicAlert(title: "Do you want to save your changes?",
                                       description: "Your changes will be saved",
                                       backButtonText: "Back",
                                       continueText: "Continue")
}
