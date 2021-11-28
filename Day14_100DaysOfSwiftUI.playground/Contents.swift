import UIKit
import SwiftUI

// MARK:- Day 14 : Optionals
// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-9



func x(a : [Int]?) -> Int {a?.randomElement() ?? Int.random(in: 1...100)}

x(a: nil)
x(a: [1, 5, 6, 25])
x(a: [])
