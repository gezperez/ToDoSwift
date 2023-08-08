//
//  IntroVIew.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 05/08/2023.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
            NavigationView {
                VStack {
                    // Your source view content goes here

                    // Create a NavigationLink to the DestinationView
                    NavigationLink("Sign In", destination: LoginView())
                        .padding()
                    NavigationLink("Sign Up", destination: LoginView())
                        .padding()
                }
            }
        }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
