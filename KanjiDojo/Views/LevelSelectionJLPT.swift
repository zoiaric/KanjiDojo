//
//  LevelSelectionJLPT.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 22/11/22.
//

import SwiftUI

struct LevelSelectionJLPT: View {
    //let backgroundColor : Color = Color(red: 0.984313725490196, green: 0.9294117647058824, blue:
    @Binding var survivorModeTapped: Bool
    @Binding var JLPT1: Bool
    @Binding var JLPT2: Bool
    @Binding var JLPT3: Bool
    @Binding var JLPT4: Bool
    @Binding var JLPT5: Bool
    var body: some View {
        VStack(spacing: 30){
            Text("JLPT 5")
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .padding()
                .background(Color("AccentColor"))
                .cornerRadius(30)
                .shadow(radius: 10)
                .font(.system(size: 40))
                .bold()
                .multilineTextAlignment(.center)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(.green, lineWidth: JLPT5 ? 7 : 0))
                .onTapGesture{
                    if(!(JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5).count==1 && JLPT5 == true)){
                        if(survivorModeTapped){
                            JLPT5 = !JLPT5; JLPT1 = false; JLPT2 = false; JLPT3 = false; JLPT4 = false}
                        else{
                            JLPT5 = !JLPT5
                        }
                    }
                }
            HStack(spacing: 30){
                Text("JLPT 4")
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .font(.system(size: 40))
                    .bold()
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.green, lineWidth: JLPT4 ? 7 : 0))
                    .onTapGesture{
                        if(!(JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5).count==1 && JLPT4 == true)){
                            if(survivorModeTapped){
                            JLPT4 = !JLPT4; JLPT1 = false; JLPT2 = false; JLPT3 = false; JLPT5 = false}
                            else{
                            JLPT4 = !JLPT4
                            }
                        }
                    }
                Text("JLPT 3")
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .font(.system(size: 40))
                    .bold()
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.green, lineWidth: JLPT3 ? 7 : 0))
                    .onTapGesture{
                        if(!(JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5).count==1 && JLPT3 == true)){
                            if(survivorModeTapped){
                                JLPT3 = !JLPT3; JLPT1 = false; JLPT2 = false; JLPT4 = false; JLPT5 = false}
                            else{
                                JLPT3 = !JLPT3
                            }
                        }
                    }
            }
            HStack(spacing: 30){
                Text("JLPT 2")
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .font(.system(size: 40))
                    .bold()
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.green, lineWidth: JLPT2 ? 7 : 0))
                    .onTapGesture{
                        if(!(JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5).count==1 && JLPT2 == true)){
                            if(survivorModeTapped){
                                JLPT2 = !JLPT2; JLPT1 = false; JLPT3 = false; JLPT4 = false; JLPT5 = false}
                            else{
                                JLPT2 = !JLPT2
                            }
                        }
                    }
                Text("JLPT 1")
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .font(.system(size: 40))
                    .bold()
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.green, lineWidth: JLPT1 ? 7 : 0))
                    .onTapGesture{
                        if(!(JLPTLevels(jlpt1: JLPT1, jlpt2: JLPT2, jlpt3: JLPT3, jlpt4: JLPT4, jlpt5: JLPT5).count==1 && JLPT1 == true)){
                            if(survivorModeTapped){
                                JLPT1 = !JLPT1; JLPT2 = false; JLPT3 = false; JLPT4 = false; JLPT5 = false}
                            else{
                                JLPT1 = !JLPT1
                            }
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        /*.alert("Important message", isPresented: .constant(true)) {
            Button("OK", role: .cancel) { }
        }*/
    }
}

struct LevelSelectionJLPT_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectionJLPT(survivorModeTapped: .constant(true),JLPT1:.constant(false),JLPT2:.constant(false),JLPT3:.constant(false),JLPT4:.constant(false),JLPT5:.constant(false))
    }
}
