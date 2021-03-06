//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___ViewControllerOutput, ___FILEBASENAMEASIDENTIFIER___RouterDataSource, ___FILEBASENAMEASIDENTIFIER___RouterDataDestination {
}

extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___InteractorOutput {
}

class ___FILEBASENAMEASIDENTIFIER___Configurator {
    // MARK: Object lifecycle
    
    class var sharedInstance: ___FILEBASENAMEASIDENTIFIER___Configurator {
        struct Static {
            static var instance: ___FILEBASENAMEASIDENTIFIER___Configurator?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ___FILEBASENAMEASIDENTIFIER___Configurator()
        }
        
        return Static.instance!
    }
    
    // MARK: Configuration
    
    func configure(viewController: ___FILEBASENAMEASIDENTIFIER___ViewController) {
        
        let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter()
        presenter.output = viewController
        
        let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
        interactor.output = presenter
        
        let router = ___FILEBASENAMEASIDENTIFIER___Router(viewController:viewController, dataSource:interactor, dataDestination:interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
