//
//  NavigationViewWithBackButton.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 06/08/2023.
//

import SwiftUI

struct NavigationViewWithBackButton<Content: View>: View {
    var title: String
    var action: () -> Void
    var content: Content

    init(title: String, action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.title = title
        self.action = action
        self.content = content()
    }

    var body: some View {
        NavigationView {
            content
                .navigationBarTitle(title, displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: BackButtonView(action: action))
        }
    }
}

