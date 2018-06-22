//
//  EnigmaRotors.swift
//  
//
//  Created by Hèctor Díaz Ramoneda on 22/6/18.
// This file defines the Configurations of the Parts of the Machine

import Foundation



/////////
//The Following Rotors are historical so they're constants
////////////

let strRotorI     = "EKMFLGDQVZNTOWYHXUSPAIBRCJ"
let strRotorII    = "AJDKSIRUXBLHWTMCQGZNPYFVOE"
let strRotorIII   = "BDFHJLCPRTXVZNYEIWGAKMUSQO"
let strRotorIV    = "ESOVPZJAYQUIRHXLNFTGKDCMWB"
let strRotorV     = "VZBRGITYUPSDNHLXAWMJQOFECK"

//The Following declared characters are the "Unstables" when the rotor is in the center of the machine

let aCharRotorI   = ['Q']
let aCharRotorII  = ['E']
let aCharRotorIII = ['V']
let aCharRotorIV  = ['J']
let aCharRotorV   = ['Z']

//Special Rotors of the Kriegsmarine - Normal Sized

let strRotorVI    = "JPGVOUMFYQBENHZRDKASXLICTW"
let strRotorVII   = "NZJHGRCXMYSWBOUFAIVLPEKQDT"
let strRotorVIII  = "FKQHTLXOCBJSPDZRAMEWNIUYGV"

let aCharRotorVI2VIII = ['Z', 'M'] //These Rotors use the same points for stepping

//Special Rotors of the Kriegsmarine - Thin Sized
let strRotorBeta  = "LEYJVCNIXWPBQMDRTAKZGFUHOS"
let strRotorGamma = "FSOKANUERHMBTIYCWLQPZXVGJD"

//This Two rotors don't step

////////////
//Now we have the reflectors of the Machine this reflectors as their name says connect two letters one with the other
////////////

//More Generic Ones Used by the Wehrmacht & Luftwaffe

let strReflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT"
let strReflectorC = "FVPJIAOYEDRZXWGCTKUQSBNMHL"

//Thin Ones for the Kriegsmarine

let strReflectorBThin = "ENKQAUYWJICOPBLMDXZVFTHRGS"
let strReflectorCThin = "RDOBJNTKVEHMLFCWZAXGYIPSUQ"

//Note: If you use a
