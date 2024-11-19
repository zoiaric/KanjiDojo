//
//  KanjiGrid.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 11/10/22.
//

import SwiftUI

struct KanjiGrid: View {
    @Binding var allKanji: [Kanji]
    //@State var kanjis = allKanji
    //uso questa variabile kanjis al posto di allKanjis per fare in modo che si possa cambiare la selezione di kanji semplicemente cliccandoci sopra da qui, perchè non avendo il decoratore @State allKanji non fa aggiornare subito la LazyVGrid. Faccio quindi aggiornamento su entrambe le variabili.
    @Binding var survivorModeTapped: Bool
    @Binding var standardModeTapped: Bool
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
                            item in if JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5 : JLPT5).contains(item.jlpt_new){
                                VStack{
                                    ZStack(alignment: .topLeading){
                                        Text(item.kanji).squareKanjiDisplayer()//.overlay(RoundedRectangle(cornerRadius: 25)
                                        //.stroke(.green, lineWidth: item.weight != 0 ? 5 : 0))
                                        Text(String(item.index_jlpt + 1)).padding([.top,.leading], 11).bold().foregroundColor(.white).font(.system(size: 15))
                                    }
                                    .onTapGesture{
                                        //print("kanji weights:")
                                        //print(allKanji.map { $0.weight });
                                        print("item weight: \(item.weight)")
                                        print((85/3)*(4 - item.weight))
                                        print("bar: \(bar(number: item.weight, survMode: survivorModeTapped, stdMode: standardModeTapped))")
                                        if(survivorModeTapped){
                                            if(item.weight != 0){
                                                //kanjis[item.index].weight = 0
                                                allKanji[item.index].weight = 0
                                            }
                                            else{
                                                //kanjis[item.index].weight = 3
                                                allKanji[item.index].weight = 4
                                            }
                                            
                                        }
                                        
                                        //print(item.kanji)
                                    }
                                    ZStack(alignment: .leading){
                                        item.weight == 0 ?
                                        Rectangle()
                                            .fill(.white)
                                            .frame(width: 85, height: 6)
                                            .border(.white):
                                        Rectangle()
                                            .fill(.white)
                                            .frame(width: 85, height: 6)
                                            .border(Color("AccentColor"))
                                        item.weight == 0 ?
                                        Rectangle()
                                            .fill(.blue)
                                            .frame(width: 0, height: 4) :
                                        Rectangle()
                                            .fill(Color("AccentColor"))
                                            //.frame(width:(85*3)/CGFloat(item.weight), height: 5)
                                            .frame(width: CGFloat(bar(number: item.weight, survMode: survivorModeTapped, stdMode: standardModeTapped)), height: 4)
                                    }
                                }
                            }
                            
                            /*
                             item in VStack{
                                 Text(item.kanji).squareKanjiDisplayer()
                                 Text("ciao")
                             }
                             */
                }
                    }.padding(.top)
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
            KanjiGrid(allKanji:.constant(kanjis),survivorModeTapped:.constant(false), standardModeTapped:.constant(true), JLPT1: .constant(false), JLPT2: .constant(false), JLPT3: .constant(false), JLPT4: .constant(false), JLPT5: .constant(true))
        }
    }
}
