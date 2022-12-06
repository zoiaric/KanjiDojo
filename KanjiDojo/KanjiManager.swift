//
//  KanjiManager.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//

import Foundation

public class KanjiManager: ObservableObject {
    //var data = KanjiData
    //var data: [Kanji] = Kanji.allKanji
    
    
    @Published var weights: [Int] = UserDefaults.standard.weights == [] ? allKanji.map { $0.weight } : UserDefaults.standard.weights
    
    static func saveWeights() {
        UserDefaults.standard.set(allKanji.map { $0.weight }, forKey: "weights")
    }

    static func setWeightsStandardMode(kanji : inout [Kanji]){
        let userDefWeights = UserDefaults.standard.weights
        if(userDefWeights.count == kanji.count || userDefWeights == []){
            for index in 0..<kanji.count{
                //kanji[index].weight = UserDefaults.standard.weights[index]
                kanji[index].weight = userDefWeights[index]
            }
        }
        else{
            UserDefaults.standard.set(allKanji.map{ $0.weight }, forKey: "weights")
        }
    }
    
    static func resetUserDefaults(){
        UserDefaults.standard.set(allKanji.map{ $0.weight }, forKey: "weights")
    }
    /*TEMPORANEAMENTE BLOCCATO, VECCHIO FUNZIONAMENTO
    @Published var weights: [Int] = UserDefaults.standard.weights == [] ? [5,5,5] : UserDefaults.standard.weights {
        didSet {
            UserDefaults.standard.weights = self.weights
        }
    }
    
    func saveWeights() {
        UserDefaults.standard.set(weights, forKey: "weights")
    }
    func resetWeights(){
        weights = [5,5,5]
    }
    */
}

/*
extension KanjiManager {
    static var KanjiData: [Kanji] {
        [
        Kanji(kanji: "一",
                  furiganaKunyomi: "ひと-",
                  furiganaOnyomi: "イチ",
                  traduzioneKunyomi: "1",
                  traduzioneOnyomi: "1",
                  weight: 30),
        Kanji(    kanji: "二",
                  furiganaKunyomi: "ふた",
                  furiganaOnyomi: "ニ",
                  traduzioneKunyomi: "2",
                  traduzioneOnyomi: "2",
                  weight: 30),
        Kanji(    kanji: "三",
                  furiganaKunyomi: "(み)",
                  furiganaOnyomi: "サン",
                  traduzioneKunyomi: "3",
                  traduzioneOnyomi: "3",
                  weight: 30)
    ]
        
    }
}
*/
