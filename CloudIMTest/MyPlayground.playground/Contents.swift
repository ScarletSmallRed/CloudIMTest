//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class ClassA {
    // takes a closure (non-escaping by default)
    func someMethod(closure: @escaping () -> Void) {
        // secret stuff
    }
}

class ClassB {
    let classA = ClassA()
    var someProperty = "Hello"
    
    func testClosure() {
        classA.someMethod {
            // self is captured!
            self.someProperty = "Inside the closure!"
        }
    }
}