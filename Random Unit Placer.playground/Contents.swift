//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var unitStartLocations = [CGPoint]()

var totalWidth = 10
var totalHeight = 10

var x = 0
var y = 0

var curRow = ""
var entireMapSoFar = ""

var allColumns = [String]()

for y in 0...totalHeight {
    for x in 0...totalWidth {
        
        let rollDice = Int(arc4random_uniform(6) + 2)
        print(rollDice)
        if rollDice == 5 {
            curRow.append("O  ")
            unitStartLocations.append(CGPoint(x:x*50,y:y*50))
        } else {
            curRow.append("X  ")
        }
    }
    allColumns.append(curRow + "\n")
    entireMapSoFar.append(curRow + "\n")
    curRow = ""
}

allColumns = allColumns.reversed()
for i in 0...(allColumns.count - 1) {
//    print(allColumns[i])
}

print(unitStartLocations)