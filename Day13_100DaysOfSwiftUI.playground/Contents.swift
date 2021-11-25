import UIKit
import SwiftUI

// MARK:- Day 13 : Protocols and extensions
// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-8

protocol Buildable {
    var typeOfBuilding : String { get }
    var numberOfRooms : Int { get }
    var costOfDollar : Int { get set }
    var nameOfEstateAgentResponsible : String { get set }
    func salesSummary()
}

extension Buildable {

    func salesSummary() {
        print("\nSALES SUMMARY: \nType of building : \(typeOfBuilding) \nNumber of rooms : \(numberOfRooms) \nCost of dollar : \(costOfDollar)$ \nName of estate agent responsible : \(nameOfEstateAgentResponsible)")
    }
}

struct House: Buildable {
    
    let typeOfBuilding : String = "House"
    let numberOfRooms: Int
    var costOfDollar: Int
    var nameOfEstateAgentResponsible: String
}

struct Office: Buildable {
    
    let typeOfBuilding : String = "Office"
    let numberOfRooms: Int
    var costOfDollar: Int
    var nameOfEstateAgentResponsible: String
}

var firstHouse = House(numberOfRooms: 4, costOfDollar: 200_000, nameOfEstateAgentResponsible: "John")

var secondOffice = Office(numberOfRooms: 2, costOfDollar: 300_000, nameOfEstateAgentResponsible: "Michael")

firstHouse.salesSummary()
firstHouse.costOfDollar = 220_000 //new value
firstHouse.salesSummary()

firstHouse.nameOfEstateAgentResponsible = "Clara"  //new person
firstHouse.salesSummary()

secondOffice.salesSummary()
secondOffice.nameOfEstateAgentResponsible = "Maria"
secondOffice.salesSummary()
