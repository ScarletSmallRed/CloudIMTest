//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Inputs: OptionSet {
    let rawValue: Int
    
    static let user = Inputs(rawValue: 1)  //1
    static let pass = Inputs(rawValue: 1 << 1) //10
    static let mail = Inputs(rawValue: 1 << 2) //100
    
}

extension Inputs {
    
    var boolValue: Bool {
        return self.rawValue == 0b111
    }
    
}

var testSet: Inputs = [.pass, .mail, .user]
testSet.rawValue
testSet.boolValue
testSet.subtract(.pass)
testSet.boolValue
testSet.rawValue
testSet.formUnion(.pass)
testSet.boolValue
testSet.rawValue