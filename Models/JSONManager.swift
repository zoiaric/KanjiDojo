//
//  JSONManager.swift
//  LearningKanji
//
//  Created by Riccardo Zoia on 02/10/22.
//


import Foundation
import SwiftUI

struct Kanji: Codable {
    //let id = UUID()
    var kanji, meanings, kun_readings, on_readings: String
    var jlpt_old, jlpt_new, weight, index, index_jlpt: Int
    
    //static var allKanji: [Kanji] = Bundle.main.decode(file: "kanji.json")
    //static var sampleKanji: Kanji = allKanji[0]
}

extension Bundle{
    func decode<T: Decodable>(file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project!")
        }
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project!")
        }
        
        return loadedData
    }
}

var allKanji: [Kanji] = Bundle.main.decode(file: "kanji.json")

func kanjiSelection(kanji : inout [Kanji], first : Int, last : Int, jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool){

    //let indicesJLPT1 = getLastKanji(kanji: &kanji, jlpt1: true, jlpt2: false, jlpt3: false, jlpt4: false, jlpt5: false)
    let indicesJLPT2 = getLastKanji(kanji: &kanji, jlpt1: false, jlpt2: true, jlpt3: false, jlpt4: false, jlpt5: false)
    let indicesJLPT3 = getLastKanji(kanji: &kanji, jlpt1: false, jlpt2: false, jlpt3: true, jlpt4: false, jlpt5: false)
    let indicesJLPT4 = getLastKanji(kanji: &kanji, jlpt1: false, jlpt2: false, jlpt3: false, jlpt4: true, jlpt5: false)
    let indicesJLPT5 = getLastKanji(kanji: &kanji, jlpt1: false, jlpt2: false, jlpt3: false, jlpt4: false, jlpt5: true)
    
    var firstKanji = first
    var lastKanji = last
    if(jlpt5){
        print("")
    }
    else if(jlpt4){
        firstKanji += indicesJLPT5
        lastKanji += indicesJLPT5
    }
    else if(jlpt3){
        firstKanji += indicesJLPT5 + indicesJLPT4
        lastKanji += indicesJLPT5 + indicesJLPT4
    }
    else if(jlpt2){
        firstKanji += indicesJLPT5 + indicesJLPT4 + indicesJLPT3
        lastKanji += indicesJLPT5 + indicesJLPT4 + indicesJLPT3
    }
    else if(jlpt1){
        firstKanji += indicesJLPT5 + indicesJLPT4 + indicesJLPT3 + indicesJLPT2
        lastKanji += indicesJLPT5 + indicesJLPT4 + indicesJLPT3 + indicesJLPT2
    }
    for h in 0..<firstKanji-1{
        kanji[h].weight = 0
    }
    for k in firstKanji-1...lastKanji-1{
        kanji[k].weight = 3
    }
    if(lastKanji == kanji.count){
        return
    }
    for j in lastKanji...kanji.count-1{
        kanji[j].weight = 0
    }
    print(firstKanji)
    print(lastKanji)
}

func setStandardMode(kanji : inout [Kanji]){
    //UserDefaults.standard.weights == [] ? KanjiManager.saveWeights() : KanjiManager.setWeightsStandardMode(kanji: &kanji)
    
    let userDefWeights = UserDefaults.standard.weights
    
    if(userDefWeights == [] || userDefWeights.count != kanji.count){
        print(userDefWeights.count)
        UserDefaults.standard.set(kanji.map { $0.weight }, forKey: "weights")
        print("initialize user defaults or overwrite them")
    }
    if(userDefWeights.count == kanji.count){
        for index in 0..<kanji.count{
            //kanji[index].weight = UserDefaults.standard.weights[index]
            kanji[index].weight = userDefWeights[index]
        }
        print("loading saved data")
    }
    //for index in 0..<kanji.count{kanji[index].weight = UserDefaults.standard.weights[index]}
}

func allLearned(kanji : inout [Kanji], jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool) -> Int {
    var JLPT : [Int] = []
    if jlpt1 {JLPT.append(1)}
    if jlpt2 {JLPT.append(2)}
    if jlpt3 {JLPT.append(3)}
    if jlpt4 {JLPT.append(4)}
    if jlpt5 {JLPT.append(5)}
    
    //let filteredArray = kanji.filter { $0.jlpt == 1 }
    let kanjiFiltered = kanji.filter { JLPT.contains($0.jlpt_new) }
    let arrayWeights = kanjiFiltered.map { $0.weight }
    return arrayWeights.reduce(0, +)
}

func JLPTLevels(jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool) -> [Int] {
    var JLPT : [Int] = []
    if jlpt1 {JLPT.append(1)}
    if jlpt2 {JLPT.append(2)}
    if jlpt3 {JLPT.append(3)}
    if jlpt4 {JLPT.append(4)}
    if jlpt5 {JLPT.append(5)}
    return JLPT
}

func validateFirstLast(kanji : inout [Kanji], first : String, last : String, jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool) -> Bool{
    let lastKanjiCalculated = getLastKanji(kanji: &kanji, jlpt1: jlpt1, jlpt2: jlpt2, jlpt3: jlpt3, jlpt4: jlpt4, jlpt5: jlpt5)
    //controlla che i due numeri siano interi
    let firstInt = Int(first) ?? 0
    let lastInt = Int(last) ?? 0
    print("first int = \(firstInt)")
    print("last int = \(lastInt)")
    print("lastKanjiCalculated = \(lastKanjiCalculated)")
    print("(lastInt>lastKanjiCalculated || firstInt < 1 || firstInt >= lastInt || firstInt < 0 || lastInt < 0)")
    print("!(firstInt != 0 && lastInt != 0)")
    if (!(firstInt != 0 && lastInt != 0)){
        return true
    }
    //controllo che il last e first non siano out of range e che il first sia minore del last
    if (lastInt>lastKanjiCalculated || firstInt < 1 || firstInt >= lastInt || firstInt < 0 || lastInt < 0){
        return true
    }
    //se è tutto ok ritorno true
    return false
}

func getFirstKanji(kanji : inout [Kanji], jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool) -> Int {
    let JLPT = JLPTLevels(jlpt1: jlpt1, jlpt2: jlpt2, jlpt3: jlpt3, jlpt4: jlpt4, jlpt5: jlpt5)
    let kanjiFiltered = kanji.filter { JLPT.contains($0.jlpt_new) }
    return kanjiFiltered.count
}

func getLastKanji(kanji : inout [Kanji], jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool) -> Int {
    let JLPT = JLPTLevels(jlpt1: jlpt1, jlpt2: jlpt2, jlpt3: jlpt3, jlpt4: jlpt4, jlpt5: jlpt5)
    let kanjiFiltered = kanji.filter { JLPT.contains($0.jlpt_new) }
    return kanjiFiltered.count
}

func generateIndex(kanji : inout [Kanji], jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool) -> Int {
    var JLPT : [Int] = []
    if jlpt1 {JLPT.append(1)}
    if jlpt2 {JLPT.append(2)}
    if jlpt3 {JLPT.append(3)}
    if jlpt4 {JLPT.append(4)}
    if jlpt5 {JLPT.append(5)}
    
    let kanjiFiltered = kanji.filter { JLPT.contains($0.jlpt_new) }
    
    let arrayWeights = kanjiFiltered.map { $0.weight }
    let arrayIndex = kanjiFiltered.map { $0.index }
    
    
    let weightsSum = arrayWeights.reduce(0, +)

    if(weightsSum == 0){
        //significa che ho fatto tutto, mi deve dire che ho finito di imparare tutto
        //rettifica: qua se lasciamo il peso minimo a 1 non si entrerà mai -> addWeight deve funzionare solo se peso > 1
        return 0
    }
    /*
     in modo tale che controllo se ho imparato tutti i kanji di un certo livello di jlpt(?)
    if(weightsSum == kanjiFiltered.count * pesoBase){
        
    }
     */
    let randomValue = Int.random(in: 0..<weightsSum)
    print("random value: \(randomValue)")
    var tempSum = 0
    for index in 0..<(arrayWeights.count-1){
        tempSum += arrayWeights[index]
        //print("temp sum: \(tempSum)")
        if(tempSum > randomValue){
            print("indice selezionato: \(index)")
            return arrayIndex[index]
        }
    }
    return 0
}

func appendKanji(kanjiToAppend : Kanji, theArray : inout[Kanji]){
    //theArray.append(kanjiToAppend)
    theArray.insert(kanjiToAppend, at: 0)
    //theArray[0].weight = UUID()
    theArray[0].weight = theArray.count
}

func setColour(color: Color, arrayOfColor : inout[Color]){
    arrayOfColor.insert(color, at: 0)
}

func getUnlockedKanjiIndex(kanji: inout [Kanji], jlpt1 : Bool, jlpt2 : Bool, jlpt3 : Bool, jlpt4 : Bool, jlpt5 : Bool) -> Int {
    var JLPT : [Int] = []
    if jlpt1 {JLPT.append(1)}
    if jlpt2 {JLPT.append(2)}
    if jlpt3 {JLPT.append(3)}
    if jlpt4 {JLPT.append(4)}
    if jlpt5 {JLPT.append(5)}
    
    let kanjiFiltered = kanji.filter { JLPT.contains($0.jlpt_new) }

    if let first0weight = kanjiFiltered.first(where: {$0.weight == 0}) {
        kanji[first0weight.index].weight = 20
        return first0weight.index
    } else {
        return 0
    }
}

func addWeight(kanji: inout [Kanji], index : Int, weightModifier : Int, stdMode : Bool, survMode : Bool) {
    if(stdMode){
        //sotto al 3 non posso mai andare
        if(weightModifier == -1 && kanji[index].weight <= 3){
            return
        }
        //sopra al 20 non posso mai andare
        else if(weightModifier == 1 && kanji[index].weight >= 20){
            return
        }
        else{
            kanji[index].weight += weightModifier
        }
    }
    else if (survMode){
        //sopra al 3 non posso mai andare
        if(weightModifier == +1 && kanji[index].weight >= 3){
            return
        }
        else{
            kanji[index].weight += weightModifier
        }
    }
}





//da Provare e vedere se funziona per il salvataggio dei progressi

//@Published var weights: [Int] = UserDefaults.standard.weights == [] ? allKanji.map { $0.weight } : allKanji.map { $0.weight }
//UserDefaults.standard.weights
//[20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

/*
func saveWeights() {
    UserDefaults.standard.set(allKanji.map { $0.weight }, forKey: "weights")
}

func setWeights(kanji : inout [Kanji]){
    for index in 0..<kanji.count{
        kanji[index].weight = UserDefaults.standard.weights[index]
    }
}
*/


/*
Per fare la barra di completamento sotto al kanji nella lazyvgrid
la misura di quello rosso sarà fissa mentre la misura dell'altro sarà variabile
in base al peso del kanji -> width = (200 * valore minimo raggiunto dal peso) / peso

ZStack(alignment: .leading){
    Rectangle()
        .fill(.red)
        .frame(width: 200, height: 20)
    Rectangle()
        .fill(.blue)
        .frame(width: 140, height: 20)
}
*/
