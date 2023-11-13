//
//  RegisterView.swift
//  Interface
//
//  Created by Lucas Neves dos santos pompeu on 12/11/23.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var goHome: Bool = false
    @State var isPresentedAlert: Bool = false
    @State var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack(spacing: 25) {
                Image("homem_foguete")
                    .resizable()
                    .frame(width: 300, height: 200)
                    .clipShape(.rect(cornerRadius: 23))
    
                Text("Register to use the app")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .padding()
                
                Group {
                    TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                        .keyboardType(.emailAddress)
                    SecureField("", text: $password, prompt: Text("Password").foregroundStyle(.white))
                    SecureField("", text: $confirmPassword, prompt: Text("Confirm Password").foregroundStyle(.white))
                }
                .frame(height: 40)
                .padding(7)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 14).stroke(Color.white, lineWidth: 2)
                })
                .padding(7)
                .foregroundStyle(.white)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                
                Button("Register") {
                    registerUser()
                }
                .frame(width: 320, height: 50)
                .foregroundStyle(.black)
                .background(isDisableRegisterButton ? Color.green.opacity(0.6) : Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .padding(.vertical, 30)
                .disabled(isDisableRegisterButton)
            }
            .padding(.horizontal, 20)
        }
        .alert("Something gone wrong", isPresented: $isPresentedAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(errorMessage)
        }
        .navigationDestination(isPresented: $goHome) {
            HomeView()
        }
    }
    
    var isDisableRegisterButton: Bool {
        return email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    private func registerUser() {
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error {
                    errorMessage = error.localizedDescription
                    isPresentedAlert.toggle()
                } else {
                    goHome.toggle()
                }
            }
        } else {
            errorMessage = "Check password and confirm password and please try again."
            isPresentedAlert.toggle()
        }
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
    
}
