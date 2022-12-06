//
//  KanjiView.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//

//SERVE A QUALCOSA QUESTA VIEW? in teoria no, da buttare

import SwiftUI

struct KanjiView: View {
    var body: some View {
        KanjiDisplayedView(isTapped: .constant(false), standardModeTapped: .constant(false), survivorModeTapped: .constant(false), JLPT1: .constant(false), JLPT2: .constant(false), JLPT3: .constant(false), JLPT4: .constant(false), JLPT5: .constant(true))
    }
}

struct KanjiView_Previews: PreviewProvider {
    static var previews: some View {
        KanjiView()
    }
}
