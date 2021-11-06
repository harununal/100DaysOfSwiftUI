import UIKit
import SwiftUI

// MARK:- Day 8
// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-4

enum rootError: Error {
    case outOfBounds, noRoot
}

func checkRoot(_ isHaveRoot: Int) throws -> Int {
    
    if (1...1000).contains(isHaveRoot) == false {
        throw rootError.outOfBounds
    }
    
    var root = 0
    
    for i in 1...isHaveRoot {
        if isHaveRoot == i*i {
            root = i
        }
    }
    
    if root == 0{
        throw rootError.noRoot
    }
    
    return root
}

let number = 2

do {
    let root = try checkRoot(number)
    print("Good! \(number) has a root : \(root)")
}   catch rootError.noRoot {
    print("Error: Sorry, \(number) hasn't a root!")
}   catch rootError.outOfBounds {
    print("Error: Number must be between 1...1000")
}   catch {
    print("Error: Undefined")
}


