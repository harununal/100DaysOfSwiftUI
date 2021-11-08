import UIKit
import SwiftUI

// MARK:- Day 9 : Closures
// https://www.hackingwithswift.com/100/swiftui/9

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let evensFilteredList = luckyNumbers.filter {$0.isMultiple(of: 2)==false}

let sortedList = evensFilteredList.sorted{$0 < $1}

sortedList.map{print("\($0) is a lucky number")}
