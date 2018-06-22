//
//  Enigma.swift
//
//
//  Created by Hèctor Díaz Ramoneda on 12/4/18.
//

import Foundation

let txtAlphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ") //The Normal alphabet Uppercased
//var txtAbc = "Abc".uppercased()

func convAbcTo123(_ iString: String, offset: Int = 0)->[Int]{
    var tmp : [Int] = []
    for charString in iString{
        for i in 0..<26{
            if txtAlphabet[i] == charString{
                tmp.append(((i+offset)%26)+1)
                break
            }
        }
        
    }
    return tmp
}

func conv123ToAbc(_ iAofInt: [Int], offset:Int = 0)->String{
    var tmp = String ()
    for ind in 0..<iAofInt.count{
        tmp.append(txtAlphabet[(26+(iAofInt[ind]-1-offset))%26])
    }
    return tmp
}

class Rotor {
    
    public let txtConf:String //The Enigma rotor configuration in human readable alphabet
    private var intConf:[Int]{//The Enigma rotor configuration in integers to accelerate the execution
        return convAbcTo123(txtConf)
    }
    ////
    public var intCurrentLtr: Int = 1
    
    public var txtCurrentLtr: Character {
        return txtAlphabet[intCurrentLtr-1]
    }
    ////
    let txtStepNextWheel: String? //
    
    public var intStepNextWheel:[Int] {// Conversion of the previous dataset to boost the execution time
        if txtStepNextWheel != nil{//Due the fact that Greek Rotors doesn't spin it's possible that txtStepNextWheel doesnt exist
            return convAbcTo123(txtStepNextWheel!)
        }
        else{
            return []
        }
    }
    ////
    func useLR(_ iInt:Int) -> Int{//Path of the rotor from keyboard to reflector
        return intConf[intCurrentLtr + iInt-2]//
    }
    
    func useRL(_ iInt:Int) -> Int{//Path of the rotor from reflector to lamp panel
        var tmp = Int ()
        for i in 0..<26{
            if (iInt + intCurrentLtr - 1) == intConf[i]{
                tmp = i
                break
            }
        }
        return tmp + 1
        /*
         if let i = students.index(where: { $0.hasPrefix("A") }) {
         print("\(students[i]) starts with 'A'!")
         }*/
    }
    mutating func stepWheel(_ iBool: Bool){
        if iBool == true{
            intCurrentLtr += 1
            if intCurrentLtr > 26 {intCurrentLtr = intCurrentLtr%26}
            return
        }
    }
    mutating func stepNextWheel(_: Void) -> Bool{//This function should be used every time the machine is used because it won't do anything unless it's required
        if txtStepNextWheel != nil{
            return false
        }
        else {
            for i in 0..<intStepNextWheel.count{
                if intStepNextWheel[i]-1 == 0 {
                    stepWheel(true)
                    return true
                }
            }
            return false
        }
        
    }
}

class Reflector{
    public let txtConf:String //The Enigma Reflector configuration configuration in human readable alphabet
    private var intConf:[Int]{//The Enigma Reflector configuration in
        return convAbcTo123(txtConf)
    }
    var isValid:Bool{
        if intConf.count != 26{// In all historical Enigma machines only the alphabet is a part of the machine so the reflector is only supposed to have 26 letters
            return false
        }
        for i in 0..<intConf.count{
            if intConf[intConf[i]-1] != i+1{//All the Numbers in a reflector should have a solidary couple (i. e. if A -> Y then Y->A) if not then it isn't valid
                print(i)
                return false
            }
        }
        return true
    }
    
    public func use (_ iChar: Int)-> Int{
        return intConf[iChar-1]
    }
}

var reflectorB = Reflector(txtConf: "YRUHQSLDPXNGOKMIEBFZCWVJAT")

reflectorB.txtConf
reflectorB.isValid

conv123ToAbc([reflectorB.use(1)])

var rotorI = Rotor(txtConf: "EKMFLGDQVZNTOWYHXUSPAIBRCJ", intCurrentLtr: 2, txtStepNextWheel: "R")
rotorI.txtCurrentLtr
rotorI.useLR(14)
rotorI.useRL(25)
rotorI.txtStepNextWheel

var rotorGamma = Rotor(txtConf: "FSOKANUERHMBTIYCWLQPZXVGJD", intCurrentLtr: 1, txtStepNextWheel: nil)

rotorGamma.intStepNextWheel
rotorGamma.txtStepNextWheel
