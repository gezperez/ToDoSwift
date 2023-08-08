//
//  SwitchItem.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 06/08/2023.
//

import SwiftUI

struct SwitchItem: View {
    @Binding var isOn: Bool

    let label: String

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            CustomSwitch(isOn: $isOn)
        }
    }
}
