//
//  ViewDidLoadModifier.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 27/11/22.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier{
    @State private var didLoad = false
    private let action: (() -> Void )?
    
    init(perform action: (()-> Void)?) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            if !didLoad {
                didLoad = true
                action?()
            }
        }
    }
}

extension View {
    func onLoad(perform action: (() -> Void)?) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
