//
//  InterfaceApp.swift
//  Interface
//
//  Created by Lucas Neves dos santos pompeu on 12/11/23.
//

import SwiftUI

@main
struct InterfaceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
