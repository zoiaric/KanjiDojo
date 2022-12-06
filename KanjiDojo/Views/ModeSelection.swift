//
//  ModeSelection.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 11/10/22.
//

import SwiftUI

struct ModeSelection: View {
    let backgroundColor : Color = Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118)
    @Binding var survivorModeTapped: Bool
    @Binding var standardModeTapped: Bool
    @Binding var firstKanji: String
    @Binding var lastKanji: String
    @Binding var JLPT1: Bool
    @Binding var JLPT2: Bool
    @Binding var JLPT3: Bool
    @Binding var JLPT4: Bool
    @Binding var JLPT5: Bool
    @State var isPresented = false
    //@State var isPresentedSurv = false
    //@State var isPresentedStd = false
    var body: some View {
        //GeomtryReader serve per fare in modo che la tastiera non sposti in alto tutta la view nel momento in cui appare. https://www.appsloveworld.com/coding/ios/16/swiftui-in-ios14-keyboard-avoidance-issues-and-ignoressafearea-modifier-issues
        GeometryReader { _ in
            VStack(spacing: 50){
                Spacer()
                //Text("")
                //.frame(height: 10)
                if (!survivorModeTapped){
                    Text("If you select **Survivor Mode** you can only choose **1 level** of JLPT. If more than 1 was selected then it will be set by default only **JLPT5** and then you can modify it.")
                        .frame(width: 320, height: 90)
                        .foregroundColor(Color("AccentColor"))
                    
                }
                else{
                    VStack{
                        HStack(spacing: 40){
                            Spacer()
                            Text("First Kanji")
                                .foregroundColor(Color("AccentColor"))
                                .font(.system(size: 17))
                                .bold()
                                .onTapGesture {
                                    print(allKanji.map { $0.weight })
                                }
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
                        Button(action: {if(survivorModeTapped){
                            isPresented = validateFirstLast(kanji: &allKanji, first: firstKanji, last: lastKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5)}
                            /*
                             else if(standardModeTapped){
                                isPresentedStd = true
                            }*/
                            if(!isPresented){
                            //if(!isPresentedSurv && survivorModeTapped){
                                kanjiSelection(kanji: &allKanji, first: Int(firstKanji) ?? 0, last: Int(lastKanji) ?? 0,jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5)
                            }
                            else{
                                firstKanji = "1"
                                lastKanji = String(getLastKanji(kanji: &allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5))
                            }
                        }, label: {Text("Set Kanji List").padding(10)})
                        .bold()
                    }.frame(height: 90)
                }
                Text("Survivor Mode")
                    .frame(width: 170, height: 170)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .font(.system(size: 40))
                    .bold()
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.green, lineWidth: survivorModeTapped ? 7 : 0))
                    .onTapGesture{
                        if(standardModeTapped){
                            survivorModeTapped = !survivorModeTapped;
                            standardModeTapped = false;
                            if(JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5).count>1){
                                JLPT5 = true;
                                JLPT4=false;
                                JLPT3=false;
                                JLPT2=false;
                                JLPT1=false
                            }
                        }
                    }
                    .onAppear{
                        firstKanji = "1"
                        lastKanji = String(getLastKanji(kanji: &allKanji, jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5))
                    }
                Text("Standard Mode")
                    .frame(width: 170, height: 170)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .font(.system(size: 40))
                    .bold()
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.green, lineWidth: standardModeTapped ? 7 : 0))
                    .onTapGesture{
                        if(survivorModeTapped){
                            standardModeTapped = !standardModeTapped; survivorModeTapped = false;
                        if(standardModeTapped){
                            setStandardMode(kanji: &allKanji)
                        }
                        }
                    }
                //separate le due azioni se no sembrava ci mettesse troppo a fare il caricamento dei pesi
                Spacer()
            }
            .alert("Please revise first and last kanji to be in the correct range",isPresented: $isPresented){
                Button("OK", role: .cancel) { }
            }
            /*
            .alert("Please revise first and last kanji to be in the correct range",isPresented: $isPresentedSurv){
                Button("OK", role: .cancel) { }
            }
            .alert("Select Survivor mode in order to be able to select a list of Kanjis",isPresented: $isPresentedStd){
                        Button("OK", role: .cancel) { }
            }
             */
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.edgesIgnoringSafeArea(.all)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
        
}

struct ModeSelection_Previews: PreviewProvider {
    static var previews: some View {
        ModeSelection(survivorModeTapped:.constant(true), standardModeTapped:.constant(false), firstKanji: .constant("1"), lastKanji: .constant(String(allKanji.count)),JLPT1:.constant(false),JLPT2:.constant(false),JLPT3:.constant(false),JLPT4:.constant(false),JLPT5:.constant(false))
    }
}
