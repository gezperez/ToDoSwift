//
//  ValidatedTextField.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 01/08/2023.
//

import SwiftUI

struct ValidatedTextField: View {
    @ObservedObject private var viewModel: ValidatedTextFieldViewModel
    
    @State  private var isSecureEnabled: Bool = true
    
    init(viewModel: ValidatedTextFieldViewModel) { // Pass the view model explicitly from the parent view
            _viewModel = ObservedObject(wrappedValue: viewModel)
        }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(viewModel.label)
                .font(.caption)
            
            HStack {
                Group{
                    if viewModel.isSecure && isSecureEnabled {
                        SecureField(viewModel.label, text: $viewModel.text, onCommit: {
                            withAnimation {
                                viewModel.validate()
                            }
                        })
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .font(.headline)
                        .foregroundColor(viewModel.isValid ? Color("AccentColor") : Color.red)
                        .onChange(of: viewModel.text) { _ in
                            withAnimation {
                                viewModel.resetValidation()
                            }
                        }
                        
                    } else {
                        TextField(viewModel.label, text: $viewModel.text, onCommit: {
                            withAnimation {
                                viewModel.validate()
                            }
                        })
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .font(.headline)
                        .foregroundColor(viewModel.isValid ? Color("AccentColor") : Color.red)
                        .onChange(of: viewModel.text) { _ in
                            withAnimation {
                                viewModel.resetValidation()
                            }
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.2), value: isSecureEnabled)
                if viewModel.isSecure {
                    Button(action: {
                        isSecureEnabled.toggle()
                    }, label: {
                        Image(systemName: !isSecureEnabled ? "eye" : "eye.slash" )
                            .foregroundColor(viewModel.isValid ? Color("AccentColor") : Color.red)
                    })
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 52.0)
            .cornerRadius(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(viewModel.isValid ? Color("AccentColor") : Color.red, lineWidth: 1.5)
            )
            
            Text(viewModel.errorMessage)
                .font(.caption)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .opacity(viewModel.isValid ? 0 : 1)
                .offset(y: viewModel.isValid ? -5 : 0)
        }
        .padding(.vertical, 6)
    }
}

