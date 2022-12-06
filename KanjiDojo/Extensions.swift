//
//  Extensions.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//

import Foundation
import SwiftUI

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

extension Text {
    
    func lilacTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
    func linkButton() -> some View{
        self.frame(width: 200, height: 30)
            .foregroundColor(.white)
            .padding()
            .background(Color("AccentColor"))
            .cornerRadius(30)
            .shadow(radius: 10)
            .font(.system(size: 25))
            .multilineTextAlignment(.center)
    }
    func squareKanjiDisplayer() -> some View{
        self.frame(width: 60, height: 60)
            //.background()
            .foregroundColor(.white)
            .padding()
            .background(Color("AccentColor"))
            .cornerRadius(30)
            .shadow(radius: 10)
            .font(.system(size: 40))
            .bold()
    }
    func previousKanjiDisplayer(color: Color) -> some View{
        self.frame(width: 30, height: 30)
            //.background()
            .foregroundColor(Color("AccentColor"))
            .padding()
            .background(.white)
            .cornerRadius(5)
            .shadow(radius: 10)
            .font(.system(size: 30))
            .bold()
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(color, lineWidth: 5))
    }
}

extension UserDefaults {
    var weights: [Int] {
        get {
            array(forKey: "weights") as? [Int] ?? []
        }
        set {
            set(newValue, forKey: "weights")
        }
    }
}

/*
extension Array {
    func scan<T>(initial: T, _ f: (T, Element) -> T) -> [T] {
        return self.reduce([initial], combine: { (listSoFar: [T], next: Element) -> [T] in
            // because we seeded it with a non-empty
            // list, it's easy to prove inductively
            // that this unwrapping can't fail
            let lastElement = listSoFar.last!
            return listSoFar + [f(lastElement, next)]
        })
    }
}
*/
