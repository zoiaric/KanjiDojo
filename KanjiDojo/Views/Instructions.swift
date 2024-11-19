//
//  Instructions.swift
//  KanjiDojo
//
//  Created by Riccardo Zoia on 06/12/22.
//

import SwiftUI

struct Instructions: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 30){
                //Text("This **app** is quiet easy to use but I'll explain anyway here its basic mechanics.").frame(width: screenWidth*(6/7)).border(.green).foregroundColor(Color("AccentColor"))
                Text("**Start**:\nA **random** kanji will be generated. If you remember its readings and meanings tap **correct**, otherwise you can **tap on the eye icon** to display them and then you can tap **wrong**. After tapping correct/wrong the next one will be generated.")
                    .frame(width: screenWidth*(6/7))
                //.border(.green)
                    .foregroundColor(Color("AccentColor"))
                Text("**JLPT Level** section:\nHere you can select **which level of JLPT** you would like to practise. Just tap on 1 of the 5 levels and you will see a **green border** around it, now it is selected! Tap again to de-select it.")
                    .frame(width: screenWidth*(6/7))
                //.border(.green)
                    .foregroundColor(Color("AccentColor"))
                Text("**Mode** section:\nHere you can choose between 2 different mode: **Standard** and **Survivor**.\n**Standard** -> it **saves your progresses** and after **5** consecutives correct kanjis will be **unlocked** the next one. You can select more than 1 JLPT level.\n**Survivor** -> select only 1 JLPT level and you can also set an **interval** of kanjis that you want to practise. Each kanji of the selected interval will be proposed **3 times**.")
                    .frame(width: screenWidth*(6/7))
                //.border(.green)
                    .foregroundColor(Color("AccentColor"))
                Text("**Go to Kanji list** section:\nHere you can have a look at all the kanjis in your **current selection** of JLPT levels with a completion bar below (a kanji is selected when you see a red border around the completion bar).\nIf you are in **survivor** mode tapping on one kanji will select/deselect it.")
                    .frame(width: screenWidth*(6/7))
                //.border(.green)
                    .foregroundColor(Color("AccentColor"))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationTitle("Instructions").foregroundColor(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.light, for: .navigationBar)
        //.toolbarBackground(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
