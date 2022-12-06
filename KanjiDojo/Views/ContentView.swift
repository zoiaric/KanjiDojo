//
//  ContentView.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var survivorModeTapped = false
    @State var standardModeTapped = true
    @State var isTapped = false
    @State var firstKanji = "1"
    //@State var lastKanji = String(allKanji.count)
    @State var lastKanji = ""
    @State var JLPT1 = false
    @State var JLPT2 = false
    @State var JLPT3 = false
    @State var JLPT4 = false
    @State var JLPT5 = true
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                //UIImage(systemName: "pencil")
                //Image(systemName: "pencil")
                    //.foregroundColor(.red)
                VStack(spacing: 20) {
                    Text("Learning Kanji")
                        .foregroundColor(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
                    Text("Learning Kanji")
                        .lilacTitle()
                        .onTapGesture {
                            print("kanji weights:")
                            print(allKanji.map { $0.weight })
                            print("user default weights(ora però saranno resettati):")
                            print(UserDefaults.standard.weights)
                            KanjiManager.resetUserDefaults()
                        }
                        .onLoad{
                            if(standardModeTapped){ setStandardMode(kanji: &allKanji)}
                        }
                    Text("Are you ready to learn other kanji?")
                        .foregroundColor(Color("AccentColor"))
                        .onTapGesture {
                            print("kanji weights:")
                            print(allKanji.map { $0.weight });
                            print("user default weights:")
                            print(UserDefaults.standard.weights);
                            //setWeights(kanji: &allKanji);
                        }
                }
                //.padding(.top, 120)
                VStack(spacing: 20){
                    NavigationLink {
                        KanjiDisplayedView(isTapped: $isTapped, standardModeTapped: $standardModeTapped,survivorModeTapped: $survivorModeTapped, JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5)
                    } label: {
                        Text("Start")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                    NavigationLink {
                        KanjiGrid(JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5)
                    } label: {
                        Text("Go to Kanji list")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                    NavigationLink {
                        ModeSelection(survivorModeTapped: $survivorModeTapped, standardModeTapped: $standardModeTapped, firstKanji: $firstKanji, lastKanji: $lastKanji,JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5)
                    } label: {
                        Text("Mode Selection")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                    NavigationLink {
                        LevelSelectionJLPT(survivorModeTapped: $survivorModeTapped, JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5)
                    } label: {
                        Text("JLPT Level")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                    /* Per ora lasciamo commentato, lo metterò forse in futuro per la
                     survivor mode
                     
                    NavigationLink {
                        KanjiListSelection(firstKanji: $firstKanji, lastKanji: $lastKanji, survivorModeTapped: $survivorModeTapped)
                    } label: {
                        Text("Kanji Selection")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                     */
                    NavigationLink {
                        License()
                    } label: {
                        Text("License")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                }
                /*
                VStack{
                    HStack(spacing: 40){
                        Spacer()
                        Text("First Kanji")
                            .foregroundColor(Color("AccentColor"))
                            .font(.system(size: 17))
                            .bold()
                            .onTapGesture {
                                print("survivor mode: \(survivorModeTapped)");
                                print("standard mode: \(standardModeTapped)")
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
                    Button(action: {kanjiSelection(kanji: &allKanji, first: Int(firstKanji) ?? 0, last: Int(lastKanji) ?? 0, survivor: survivorModeTapped)}, label: {Text("Set Kanji List").padding(20)})
                        .bold()
                }
                .padding(.top, 90)
                //.border(.green)
                 */
                
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //ContentView().preferredColorScheme(.dark)
        //ContentView().preferredColorScheme(.light)
    }
}
