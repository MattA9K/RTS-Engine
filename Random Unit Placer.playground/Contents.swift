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

