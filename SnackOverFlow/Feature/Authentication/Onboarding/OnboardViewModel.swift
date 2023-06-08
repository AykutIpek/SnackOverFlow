//
//  OnboardViewModle.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 8.06.2023.
//

import Foundation


final class OnboardViewModel: ObservableObject {
    //MARK: - Properties
    @Published var currentIndex: Int = 0
    @Published var isHomeRedirect: Bool = false
    private let cache = UserDefaultCache()
   
}

//MARK: - Functions
extension OnboardViewModel{
    
    private func isUserFirstLogin() -> Bool {
        return cache.read(key: .onboard).isEmpty
    }
    
    func checkUserFirstTime() {
        removeCacheFirstLogin()
        guard !isUserFirstLogin() else {
            updateCacheFirstLogin()
            return
        }
        redirectToHome()
    }
    
    private func updateCacheFirstLogin(){
        cache.save(key: .onboard, value: UserCacheKeys.dummyValue)
    }
    
    func saveUserLoginAndRedirect(){
        updateCacheFirstLogin()
        redirectToHome()
    }
    
    private func redirectToHome(){
        isHomeRedirect = true
    }
    
    private func removeCacheFirstLogin(){
        cache.remove(key: .onboard)
    }
}
