//
//  ContentView.swift
//  Interface
//
//  Created by Lucas Neves dos santos pompeu on 12/11/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var goRegister: Bool = false
    @State var isPresentedAlert: Bool = false
    @State var errorMessage: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack(spacing: 25) {
                    Image("medticacao")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .clipShape(.rect(cornerRadius: 23))
                    
                    Text("Login to use the app")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                        .padding()
                    
                    Group {
                        TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                            .keyboardType(.emailAddress)
                        SecureField("", text: $password, prompt: Text("Password").foregroundStyle(.white))
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
                    
                    
                    Button("Login") {
                        print(#function)
                    }
                    .frame(width: 320, height: 50)
                    .foregroundStyle(.black)
                    .background(isDisabledLoginButton ? Color.green.opacity(0.6) : Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .padding(.vertical, 30)
                    
                    Button("Doesn't have an account? Register now") {
                        goRegister.toggle()
                    }
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                    .disabled(isDisabledLoginButton)
                }
                .padding(.horizontal, 20)
            }
            .alert("Something gone wrong", isPresented: $isPresentedAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            .navigationDestination(isPresented: $goRegister) {
                RegisterView()
            }
        }
    }
    
    private func loginUser() {
        
    }
    
    var isDisabledLoginButton: Bool {
        return email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    LoginView()
}
