//
//  LoginView.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 7.06.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Text(viewModel.token)
                ImageItems.Authentication.login.rawValue.image()
                Text(LocaleKeys.Login.welcomeBack.rawValue.locale()).font(.system(size: FontSizes.title1, weight: .semibold))
                    .foregroundColor(.teflon)
                HTextField(hint: LocaleKeys.General.emailHint.rawValue.locale(), iconName: IconItems.mail, text: $viewModel.emailValue)
                HSecureTextField(hint: LocaleKeys.General.passwordHint.rawValue.locale(), iconName: IconItems.lock, text: $viewModel.passwordValue).padding(.top, PagePadding.All.normal.rawValue)
                Divider().padding(.top, PagePadding.All.normal.rawValue)
                NavigationLink("", isActive: $viewModel.isLogged) {
                    Text("Aykut")
                        .navigationBarBackButtonHidden(true)
                }
                Group {
                    NormalButton(onTap: {
                        Task{
                            await viewModel.onLoginUser()
                        }
                    }, title: LocaleKeys.Login.createAccount.rawValue).padding(.top, PagePadding.All.normal.rawValue)
                    Text(LocaleKeys.Login.terms.rawValue.locale())
                        .environment(\.openURL, OpenURLAction(handler: { url in
                            print(url)
                            return .discarded
                        })).padding(.top, PagePadding.All.normal.rawValue).font(.system(size: FontSizes.caption1, weight: .regular))
                        .foregroundColor(.gandalf)
                        .tint(.flowerBlue)
                    Spacer()
                }
            }.padding(.all, PagePadding.All.normal.rawValue)
        }.modifier(ViewStatusHiddenModifier())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}




private struct HTextField: View {
    let hint: LocalizedStringKey
    let iconName: String
    var text: Binding<String>
    var body: some View {
        HStack {
            iconName.image()
            TextField(hint, text: text)
        }.modifier(TextFieldModifiers())
    }
}


private struct HSecureTextField: View {
    let hint: LocalizedStringKey
    let iconName: String
    var text: Binding<String>
    var body: some View {
        HStack {
            iconName.image()
            SecureField(hint, text: text)
        }.modifier(TextFieldModifiers())
    }
}
