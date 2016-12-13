//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var unitStartLocations = [CGPoint]()
var totalWidth = 15
var totalHeight = 15
var x = 0
var y = 0
var curRow = ""
var entireMapSoFar = ""
var allColumns = [String]()
for y in 0...totalHeight {
    for x in 0...totalWidth {
        if x == 11 && y == 3 {
            curRow.append("O   ")
            unitStartLocations.append(CGPoint(x:x*50,y:y*50))
        }
        else if x == 8 && y == 4 {
            curRow.append("X   ")
            unitStartLocations.append(CGPoint(x:x*50,y:y*50))
        }
        else {
            curRow.append(".   ")
        }
    }
    allColumns.append(curRow + "\n")
    entireMapSoFar.append(curRow + "\n")
    curRow = ""
}
allColumns = allColumns.reversed()
for i in 0...(allColumns.count - 1) {
    print(allColumns[i])
}

//print(unitStartLocations)
var num1 : Double = 747.1;
var num2 : Double = 50;
var num3 : Double = 600 + -600
print((num1.truncatingRemainder(dividingBy: num2)))
print(num3)












































/// -Junkyard Dog Behavior
let rollDice10Sides = Int(arc4random_uniform(10))
let int = 0
//int.truncatingRemainder(dividingBy: 50)






/// Player Struct Example
/*
let ARRAY_OF_COLORS : [UIColor] = [.black, .green, .purple, .orange, .yellow, .white]
let RANDOM_COLOR_1 : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]
struct Player {
    let playerNumber : Int
    let groupNumber : Int
    let color : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]
}
let plyr1 = Player(playerNumber: 1, groupNumber: 1)
plyr1.color

var allPlayers : [Int:Player] = [:]


allPlayers[1] = Player(playerNumber: 12, groupNumber: 2)


allPlayers


if allPlayers[3] == nil {
    allPlayers[3] = Player(playerNumber: 12, groupNumber: 2)
}
*/







