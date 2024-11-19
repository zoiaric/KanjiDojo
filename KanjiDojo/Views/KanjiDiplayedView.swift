//
//  KanjiDisplayedView.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//

import Foundation
import SwiftUI

struct KanjiDisplayedView: View {
    @Binding var allKanji: [Kanji]
    @Binding var expl: Bool
    @Binding var isTapped: Bool
    @Binding var standardModeTapped: Bool
    @Binding var survivorModeTapped: Bool
    @Binding var JLPT1: Bool
    @Binding var JLPT2: Bool
    @Binding var JLPT3: Bool
    @Binding var JLPT4: Bool
    @Binding var JLPT5: Bool
    //@State var index = generateIndex(kanji: &allKanji)
    @State private var contentSize = CGFloat.zero
    @State var index = 0
    @State var arrayOf: [Kanji] = []
    @State var arrayOfColour: [Color] = []
    //correctCount non dovrebbe essere una variabile della view ma definita fuori globalmente, se no viene re-inizializzata ogni volta che faccio back e torno qui
    @State var correctCount = 0
    let rows = [GridItem(.flexible())]
    var body: some View {
        ZStack{
            if(allKanji.map { $0.weight }.reduce(0, +) != 0){
                VStack(spacing: 20) {
                    HStack {
                        
                        Text("Kanji Dojo 漢字の道場")
                            .lilacTitle()
                        //Spacer()
                        
                        //Text("powered by rzoia")
                            .font(.system(size:15))
                            .foregroundColor(Color("AccentColor"))
                            .fontWeight(.heavy)
                            /*.onTapGesture {
                                print("userdefaults: \(UserDefaults.standard.bool(forKey: "showExpl"))")
                                print("expl: \(expl)")
                                //UserDefaults.standard.set(false, forKey: "showExpl")
                            }*/
                    }
                    .onAppear(perform: {index = generateIndex(kanji: &allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5 : JLPT5, survMode: survivorModeTapped, stdMode: standardModeTapped)})
                    VStack(alignment: .leading, spacing: 20) {
                        DisplayedRow(row: Kanji(kanji: allKanji[index].kanji,meanings: allKanji[index].meanings, kun_readings: allKanji[index].kun_readings, on_readings: allKanji[index].on_readings,jlpt_old: allKanji[index].jlpt_old,jlpt_new: allKanji[index].jlpt_new, weight: allKanji[index].weight, index: allKanji[index].index, index_jlpt: allKanji[index].index_jlpt),isTapped: $isTapped)
                    }
                    HStack(){
                        Spacer()
                        PrimaryButton(text: "Correct")
                            .onTapGesture{
                                //print(allKanji[index].weight);
                                appendKanji(kanjiToAppend: allKanji[index], theArray: &arrayOf);
                                //Kanji.addWeight(kan: &allKanji, index: index, weightModifier: -1);
                                addWeight(kanji: &allKanji, index: index, weightModifier: -1, stdMode: standardModeTapped, survMode: survivorModeTapped)
                                if standardModeTapped {
                                    correctCount == 4 ? (index = getUnlockedKanjiIndex(kanji: &allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5)):(index = generateIndex(kanji: &allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5, survMode: survivorModeTapped, stdMode: standardModeTapped));
                                    if correctCount == 4 {correctCount = 0};
                                    if correctCount != 4 {correctCount += 1};
                                }
                                else {
                                    index = generateIndex(kanji: &allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5, survMode: survivorModeTapped, stdMode: standardModeTapped)
                                }
                                print("correct count: \(correctCount)")
                                isTapped = false;
                                setColour(color: .green, arrayOfColor: &arrayOfColour);
                                standardModeTapped ? UserDefaults.standard.set(allKanji.map { $0.weight }, forKey: "weights"): print("siamo nella survivor");
                                //print(allKanji.map { $0.weight });
                                //print(UserDefaults.standard.weights)
                            }
                        Spacer()
                        PrimaryButton(text: "Wrong")
                            .onTapGesture{
                                correctCount = 0
                                //print(allKanji[index].weight);
                                //print(index);
                                appendKanji(kanjiToAppend: allKanji[index], theArray: &arrayOf);
                                //Kanji.addWeight(kan: &allKanji, index: index, weightModifier: 1);
                                addWeight(kanji: &allKanji, index: index, weightModifier: 1, stdMode: standardModeTapped, survMode: survivorModeTapped)
                                index = generateIndex(kanji: &allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5, survMode: survivorModeTapped, stdMode: standardModeTapped);
                                isTapped = false;
                                setColour(color: .red, arrayOfColor: &arrayOfColour);
                                standardModeTapped ? UserDefaults.standard.set(allKanji.map { $0.weight }, forKey: "weights"): print("siamo nella survivor");
                                //print(allKanji.map { $0.weight });
                                //print(UserDefaults.standard.weights)
                            }
                        Spacer()
                    }
                    ScrollView(.horizontal){
                        LazyHGrid(rows: rows, spacing: 25){
                            /*ForEach(arrayOf, id: \.weight) {
                             item in Text(item.kanji).previousKanjiDisplayer(color: .green)
                             }*/
                            ForEach(Array(arrayOf.enumerated()), id: \.offset) { index, element in Text(element.kanji).previousKanjiDisplayer(color: arrayOfColour[index])
                            }
                        }
                        .padding()
                        //.fixedSize()
                    }
                    .frame(height: contentSize + 100)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
                //.navigationBarHidden(true)
                //.navigationBarTitle("Back", displayMode: .inline)
                .onAppear{
                    isTapped = false
                }
            }
            //if(allKanji.map { $0.weight }.reduce(0, +) == 0){
            if(allLearned(kanji: allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5 : JLPT5) == (allKanji.filter { $0.weight == 1 }).map { $0.weight }.reduce(0, +)){
                VStack{
                    Text("Congratulations!").lilacTitle().padding(.bottom)
                    Image("ninja")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipped()
                        .cornerRadius(30)
                        .onTapGesture {
                            //print(allLearned(kanji: allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5 : JLPT5))
                            //print((allKanji.map { $0.weight }).reduce(0, +))
                        }
                    Text("おめでとう!").lilacTitle().padding(.top)
                    //Text("Imparati tutti! 🤩").lilacTitle()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
            }
        }
        .onAppear {
            if(standardModeTapped){
                setStandardMode(kanji: &allKanji)
            }
        }
        .alert("Tap on the eye icon to show Furigana and traduction. Tap again to hide them",isPresented: $expl){
            Button("OK", role: .cancel) {
                UserDefaults.standard.set(true, forKey: "showExpl")
                expl = !UserDefaults.standard.bool(forKey: "showExpl")
                //print(UserDefaults.standard.bool(forKey: "showExpl"))
                //print(expl)
            }
        }
    }
}

struct KanjiDisplayedView_Previews: PreviewProvider {
    static var previews: some View {
        KanjiDisplayedView(allKanji:.constant(kanjis), expl: .constant(true), isTapped: .constant(false), standardModeTapped: .constant(true), survivorModeTapped: .constant(false), JLPT1: .constant(false), JLPT2: .constant(false), JLPT3: .constant(false), JLPT4: .constant(false), JLPT5 : .constant(true))
    }
}
