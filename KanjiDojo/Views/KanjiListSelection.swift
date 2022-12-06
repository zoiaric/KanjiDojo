//
//  KanjiListSelection.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 15/10/22.
//

import SwiftUI

struct KanjiListSelection: View {
    @Binding var firstKanji: String
    @Binding var lastKanji: String
    @Binding var survivorModeTapped: Bool
    @Binding var JLPT1: Bool
    @Binding var JLPT2: Bool
    @Binding var JLPT3: Bool
    @Binding var JLPT4: Bool
    @Binding var JLPT5: Bool
    var body: some View {
            VStack{
                HStack(spacing: 40){
                    Spacer()
                    Text("First Kanji")
                        .foregroundColor(Color("AccentColor"))
                        .font(.system(size: 17))
                        .bold()
                    Spacer()
                    Text("Last Kanji")
                        .foregroundColor(Color("AccentColor"))
                        .font(.system(size: 17))
                        .bold()
                    Spacer()
                }
                HStack(spacing: 40){
                    Spacer()
                    TextField("", text: $firstKanji)
                        .font(.system(size:18))
                        .foregroundColor(Color("AccentColor"))
                    //.fontWeight(.heavy)
                        .disableAutocorrection(true)
                        .textFieldStyle(.roundedBorder)
                        .bold()
                    Spacer()
                    TextField("", text: $lastKanji)
                        .font(.system(size:18))
                        .foregroundColor(Color("AccentColor"))
                    //.fontWeight(.heavy)
                        .disableAutocorrection(true)
                        .textFieldStyle(.roundedBorder)
                        .bold()
                    Spacer()
                }
                Button(action: {kanjiSelection(kanji: &allKanji, first: Int(firstKanji) ?? 0, last: Int(lastKanji) ?? 0,jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5)}, label: {Text("Set Kanji List").padding(20)})
                    .bold()
                /* QUI SETTO I PESI SIA DI STANDARD CHE SURVIVOR
                Button(action: {kanjiSelection(kanji: &allKanji, first: Int(firstKanji) ?? 0, last: Int(lastKanji) ?? 0, survivor: survivorModeTapped)}, label: {Text("Set Kanji List").padding(20)})
                    .bold()
                 */
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
    }
}

struct KanjiListSelection_Previews: PreviewProvider {
    static var previews: some View {
        KanjiListSelection(firstKanji: .constant("1"), lastKanji: .constant(String(allKanji.count)), survivorModeTapped: .constant(false),JLPT1:.constant(false),JLPT2:.constant(false),JLPT3:.constant(false),JLPT4:.constant(false),JLPT5:.constant(false))
    }
}
