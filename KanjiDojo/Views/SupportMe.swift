//
//  SupportMe.swift
//  KanjiDojo
//
//  Created by Riccardo Zoia on 06/12/22.
//

import SwiftUI

struct SupportMe: View {
    var body: some View {
        VStack(spacing: 30){
            Text("Hey there! My name is **Riccardo** and I love Japanese.\nI developed this app becuase I was looking for something to **learn kanjis** from my phone in which i would have feel comfortable. If you have any question about the functioning of the app or you want to give me some hints to improve it, please reach me out at **infokanjidojo@gmail.com** or click on my instagram account down below.\n **ありがとうございます!!!** 🙏")
                .padding()
                .frame(width: screenWidth*(6/7))
                //.border(.green)
                .foregroundColor(Color("AccentColor"))
                
            Link(destination: URL(string: "https://www.instagram.com/kanjidojoapp/")!, label: {
                Text("KanjiDojo")
                //Text("KanjiDojo \(Image(systemName: "heart.fill"))")
                    .bold()
                    .font(.system(size:18))
                    .frame(width: screenWidth*(2/7), height: 15)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    //.linkButton()
                    
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
    }
}

struct SupportMe_Previews: PreviewProvider {
    static var previews: some View {
        SupportMe()
    }
}
