//
//  License.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 22/11/22.
//

import SwiftUI

struct License: View {
    var body: some View {
        VStack(spacing: 30){
            Text("This app use data from an extensive kanji dictionary, provided by the \(Text("**[kanji-data](https://github.com/davidluzgouveia/kanji-data)**").underline()) github repository by **David Gouveia**.")
                .padding()
                .frame(width: screenWidth*(6/7))
                //.border(.green)
                .foregroundColor(Color("AccentColor"))
            /*
            Link(destination: URL(string: "https://kanjiapi.dev")!, label: {
                Text("Kanji Api WebSite").bold()
            })
             */
            /*Text("The API uses the **EDICT** and **KANJIDIC** dictionary files that are property of the **Electronic Dictionary Research and Development Group**, and are used in conformance with the \(Text("**[Group's License](http://www.edrdg.org/edrdg/licence.html)**").underline()).")
                .padding()
                .frame(width: screenWidth*(6/7))
                //.border(.green)
                .foregroundColor(Color("AccentColor"))
             */
            /*
             Link(destination: URL(string: "http://www.edrdg.org/edrdg/licence.html")!, label: {
                Text("License").bold()
            })
             */
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
    }
}

struct License_Previews: PreviewProvider {
    static var previews: some View {
        License()
    }
}
