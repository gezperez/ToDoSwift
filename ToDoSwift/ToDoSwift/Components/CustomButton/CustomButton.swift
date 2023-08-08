//
//  CustomButton.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 06/08/2023.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("AccentColor"))
                    .frame(height: 52)
                Text(label)
                    .foregroundColor(Color.white)
                    .font(.headline)
            }
            .scaleEffect(isPressed ? 0.85 : 1.0)
        }
        .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
            withAnimation {
                self.isPressed = isPressing
            }
        }) {
            // Handle long press event if needed
        }
    }
}
