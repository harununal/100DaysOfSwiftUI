import UIKit
import SwiftUI

// MARK:- Day 11 : Structs, part two
// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-6

struct Gear {
    let carModel : String
    let carSeatNumber : Int
    private var gearNow : Int = 1
    
    mutating func gearUp() {
        if (gearNow + 1) > 10 {
            print("\(carModel) has not gear upper than 10")
        } else {
            self.gearNow += 1
            print("Car Model : \(carModel)")
            print("Seat Number : \(carSeatNumber)")
            print("Gear now : \(gearNow)")
        }
        print("-------------------")
    }
    
    mutating func gearDown() {
        if (gearNow - 1) < 1 {
            print("\(carModel) has not gear lower than 1")
        } else {
            self.gearNow -= 1
            print("Car Model : \(carModel)")
            print("Seat Number : \(carSeatNumber)")
            print("Gear now : \(gearNow)")
        }
        print("-------------------")
    }
    
    init(carModel: String, carSeatNumber: Int) {
        self.carModel = carModel
        self.carSeatNumber = carSeatNumber

    }
}


var drive = Gear(carModel: "Toyota Corolla", carSeatNumber: 5)

drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)
drive.gearUp()
print(drive)

drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)
drive.gearDown()
print(drive)





