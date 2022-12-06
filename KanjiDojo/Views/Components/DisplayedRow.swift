//
//  DisplayedRow.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//

import Foundation
import SwiftUI

struct DisplayedRow: View {
    var row: Kanji
    //@State private var isTapped = false
    @Binding var isTapped: Bool
    var body: some View {
        VStack(spacing: 20) {
            Text(row.kanji)
                .bold()
                .font(.system(size: 40))
                .onTapGesture{isTapped = !isTapped}
            VStack(spacing: 20){
                titleRow(text: "FURIGANA KUNYOMI")
                Text(row.kun_readings).bold().frame(minHeight:50)
                titleRow(text: "FURIGANA ONYOMI")
                Text(row.on_readings).bold().frame(minHeight:50)
                titleRow(text: "TRADUZIONE")
                Text(row.meanings).bold()
                    //.frame(height: 20)
                    //.border(.green)
                    .frame(minHeight:50)
            }
            .font(.system(size: 20))
            .foregroundColor(isTapped ? Color("AccentColor") : .white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
    }
    
    struct DisplayedRow_Previews: PreviewProvider {
        static var previews: some View {
            DisplayedRow(row: Kanji(kanji: "一", meanings: "1", kun_readings: "ひと-", on_readings: "イチ", jlpt_old: 1,jlpt_new: 1, weight: 30, index: 0, index_jlpt: 0),isTapped:.constant(true))
        }
    }
}

struct titleRow: View{
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.black)
            .font(.system(size: 12))
    }
}
