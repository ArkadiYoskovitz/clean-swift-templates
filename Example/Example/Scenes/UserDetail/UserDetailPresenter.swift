//
//  UserDetailPresenter.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright (c) 2016 HELM S.C.P. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//

import UIKit

protocol UserDetailPresenterInput {
    func presentUser(response:UserDetail.GetUser.Response)
}

protocol UserDetailPresenterOutput: class {
    func displayUser(viewModel:UserDetail.GetUser.ViewModel)
}

class UserDetailPresenter: UserDetailPresenterInput {
    
    weak var output: UserDetailPresenterOutput!
    
    // MARK: Presentation logic
    func presentUser(response:UserDetail.GetUser.Response) {
        let viewModel = mapGetUserResponseToViewModel(response)
        output.displayUser(viewModel)
    }
    
    func mapGetUserResponseToViewModel(response:UserDetail.GetUser.Response) -> UserDetail.GetUser.ViewModel {
        let user = response.user
        let attributes = mapUserToAttributesViewModel(user)
        let viewModelUser = UserDetail.GetUser.ViewModel.User(attributes: attributes, imageURLString: user.imageURLString)
        return UserDetail.GetUser.ViewModel(user: viewModelUser)
    }
    
    func mapUserToAttributesViewModel(user:User) -> [UserDetail.ViewModel.Attribute] {
        let name = user.name.fullName()
        var attributes:[UserDetail.ViewModel.Attribute] = []
        
        attributes.append(UserDetail.ViewModel.Attribute(title: "Name:", value: name))
        attributes.append(UserDetail.ViewModel.Attribute(title: "e-mail:", value: user.email))
        attributes.append(UserDetail.ViewModel.Attribute(title: "Phone:", value:user.phone))
        
        return attributes
    }
}
