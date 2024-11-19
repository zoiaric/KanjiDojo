//
//  ContentView.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var allKanji = kanjis
    @State var expl = true
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
    @State private var showingReset = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()
                //UIImage(systemName: "pencil")
                //Image(systemName: "pencil")
                    //.foregroundColor(.red)
                VStack(spacing: 20) {
                    /*Text("Kanji Dojo")
                        .foregroundColor(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))*/
                    Text("Kanji Dojo")
                        .lilacTitle()
                        .padding(.top,screenHeight*(1/12))
                        //.border(.green)
                        /*.onTapGesture {
                            print("kanji weights:")
                            print(allKanji.map { $0.weight })
                            print("user default weights(ora però saranno resettati):")
                            print(UserDefaults.standard.weights)
                            KanjiManager.resetUserDefaults()
                        }*/
                        .onLoad{
                            //KanjiManager.saveWeights()
                            if(standardModeTapped){ setStandardMode(kanji: &allKanji)}
                        }
                    Text("Are you ready to learn other **kanjis**?")
                        .foregroundColor(Color("AccentColor"))
                        .onTapGesture {
                            //print("kanji weights:")
                            //print(allKanji.map { $0.weight });
                            //print("user default weights:")
                            //print(UserDefaults.standard.weights);
                            //setWeights(kanji: &allKanji);
                        }
                }
                //.padding(.top, 120)
                VStack(spacing: 20){
                    NavigationLink {
                        KanjiDisplayedView(allKanji: $allKanji, expl: $expl, isTapped: $isTapped, standardModeTapped: $standardModeTapped,survivorModeTapped: $survivorModeTapped, JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5)
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
                        KanjiGrid(allKanji: $allKanji, survivorModeTapped: $survivorModeTapped, standardModeTapped: $standardModeTapped, JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5)
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
                        ModeSelection(allKanji: $allKanji,survivorModeTapped: $survivorModeTapped, standardModeTapped: $standardModeTapped, firstKanji: $firstKanji, lastKanji: $lastKanji,JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5)
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
                        LevelSelectionJLPT(allKanji: $allKanji, survivorModeTapped: $survivorModeTapped, JLPT1: $JLPT1, JLPT2: $JLPT2, JLPT3: $JLPT3, JLPT4: $JLPT4, JLPT5: $JLPT5, firstKanji: $firstKanji, lastKanji: $lastKanji)
                    } label: {
                        Text("JLPT Level")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                    /*
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
                     */
                    NavigationLink {
                        SupportMe()
                    } label: {
                        Text("Support me!")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                    /*
                    NavigationLink {
                        Instructions()
                    } label: {
                        Text("Instructions")
                            .frame(width: screenWidth*(3/7), height: 50)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .bold()
                    }
                    */
                }
                Spacer()
                HStack(spacing: 15){
                    Spacer()
                    NavigationLink {
                        Instructions()
                    } label: {
                        Text("How it works").padding(.bottom,screenWidth*(1/10)).underline()//.border(.green)
                    }
                    .frame(width: screenWidth*(25/100))
                    //.border(.green)
                    Spacer()
                    Button(action: {showingReset=true},
                           label: {Text("Reset").underline().padding(.bottom,screenWidth*(1/10))
                    }
                    )
                    .alert("Are you sure you want to reset your progresses?",isPresented: $showingReset){
                        Button("Cancel", role: .cancel) { }
                        Button("Reset") {resetWeights(kanji: &allKanji)}
                        }
                    .frame(width: screenWidth*(23/100))
                    //.border(.green)
                    Spacer()
                    NavigationLink {
                        License()
                    } label: {
                        Text("License").padding(.bottom,screenWidth*(1/10)).underline()
                    }
                    .frame(width: screenWidth*(23/100))
                    //.border(.green)
                    Spacer()
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
                .onAppear{
                    expl = !UserDefaults.standard.bool(forKey: "showExpl")
                    print("expl : \(expl)")
                }
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

