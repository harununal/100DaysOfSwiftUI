import UIKit
import SwiftUI

// MARK:- Day 12 : Classes
// https://www.hackingwithswift.com/100/swiftui/12

class Animal {
    var legs : Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog : Animal{
     func speak(){
        print("Woof")
    }
}

class Corgi : Dog{
    override func speak() {
        print("Corgi-Woof")
    }
}

class Poodle : Dog{
    override func speak() {
        print("Poodle-Woof")
    }
}

//
class Cat : Animal{
    var isTame : Bool
    func speak(){
        print("Meow")
    }
    init(isTame : Bool, legs : Int){
        self.isTame = isTame
        super.init(legs: legs)
    }
}

class Persian : Cat{
    override func speak() {
        print("Persian-Meow")
    }
}

class Lion : Cat{
    override func speak() {
        print("Lion-Roarrr")
    }
}

Animal(legs: 4)
Cat(isTame: true, legs: 4)
Dog(legs: 4)
Corgi(legs: 4)
Poodle(legs: 4)
Persian(isTame: true, legs: 4)
Lion(isTame: false, legs: 4)
