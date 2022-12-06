//
//  KanjiGrid.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 11/10/22.
//

import SwiftUI

struct KanjiGrid: View {
    @Binding var JLPT1: Bool
    @Binding var JLPT2: Bool
    @Binding var JLPT3: Bool
    @Binding var JLPT4: Bool
    @Binding var JLPT5: Bool
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
            ScrollView{
                ZStack{
                    Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118).ignoresSafeArea(.all)
                    LazyVGrid(columns: columns, spacing: 25){
                        ForEach(allKanji, id: \.kanji) {
                            /*
                             item in if item.weight != 0{ Text(item.kanji).squareKanjiDisplayer().overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(.green, lineWidth: item.weight != 0 ? 5 : 0))}
                             */
                            /*
                            item in
                            //VStack{
                                Text(item.kanji).squareKanjiDisplayer().overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(.green, lineWidth: item.weight != 0 ? 5 : 0))
                                //Text("ciao")}
                            */
                            item in if JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5 : JLPT5).contains(item.jlpt_new){ Text(item.kanji).squareKanjiDisplayer().overlay(RoundedRectangle(cornerRadius: 25)
                               .stroke(.green, lineWidth: item.weight != 0 ? 5 : 0))}
                            
                            /*
                             item in VStack{
                                 Text(item.kanji).squareKanjiDisplayer()
                                 Text("ciao")
                             }
                             */
                }
                    }.padding(.top)
                }
                .onTapGesture {
                    print(allKanji.map { $0.weight });
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Kanji list")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.light, for: .navigationBar)
            //.toolbarBackground(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            //.edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    
    struct KanjiGrid_Previews: PreviewProvider {
        static var previews: some View {
            KanjiGrid(JLPT1: .constant(false), JLPT2: .constant(false), JLPT3: .constant(false), JLPT4: .constant(false), JLPT5: .constant(true))
        }
    }
}
