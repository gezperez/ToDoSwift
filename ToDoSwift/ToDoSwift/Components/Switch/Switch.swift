//
//  Switch.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 06/08/2023.
//

import SwiftUI

import SwiftUI

struct CustomSwitch: View {
    @Binding var isOn: Bool
    
    var onColor: Color = Color("AccentColor")
    var offColor: Color = Color("SwitchBackground")
    var thumbColor: Color = Color("SwitchColor")
    
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            if !isOn {
                RoundedRectangle(cornerRadius: 15)
                    .fill(offColor)
                    .frame(width: 50, height: 30)
            }
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("SwitchBorderColor"), lineWidth: 2)
                .frame(width: 50, height: 30)
            if isOn {
                RoundedRectangle(cornerRadius: 15)
                    .fill(onColor)
                    .frame(width: 50, height: 30)
            }
            Circle()
                .fill(thumbColor)
                .frame(width: 25, height: 25)
                .offset(x: isOn ? 10 + dragOffset : -10 + dragOffset)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            withAnimation {
                                let newPosition = value.location.x
                                let switchWidth = CGFloat(50)
                                isOn = newPosition >= switchWidth / 2
                            }
                        }
                )
        }
    }
}
