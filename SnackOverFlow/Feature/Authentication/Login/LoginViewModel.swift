//
//  LoginViewModel.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 9.06.2023.
//

import Foundation


final class LoginViewModel: ObservableObject{
    @Published var emailValue: String = "eve.holt@reqres.in"
    @Published var passwordValue: String = "cityslicka"
    @Published var token: String = ""
    @Published var isLogged: Bool = false
    
    private let networkManager = NetworkManager(config: NetworkConfig(baseUrl: NetworkPath.baseUrlRequest))
    
    func onLoginUser() async{
        token = await onLoginUser(email: emailValue, password: passwordValue)
        isLogged = !token.isEmpty
    }
}

extension LoginViewModel: LoginUseCase{
    
    func onLoginUser(email: String, password: String) async -> String {
        guard !email.isEmpty else {return ""}
        guard !password.isEmpty else {return ""}
        
        let response = await networkManager.post(path: .login, model: LoginRequest(email: email, password: password), type: LoginResponse.self)
        
        return response?.token ?? "ERROR"
    }
    
    func onSaveUserToken(token: String) -> Bool {
        return false
    }
}

protocol LoginUseCase {
    func onLoginUser(email: String, password: String) async -> String
    func onSaveUserToken(token: String) -> Bool
}
