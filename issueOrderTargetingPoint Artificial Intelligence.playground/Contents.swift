//: Playground - noun: a place where people can play
import UIKit

let playerX = 500
let playerY = 350

let targetX = 450
let targetY = 300
let currentPositionOfSelf = CGPoint(x:playerX, y:playerY)
let target = CGPoint(x:targetX, y:targetY)
let differenceOfX = currentPositionOfSelf.x - target.x
let differenceOfY = currentPositionOfSelf.y - target.y
let range : CGFloat = 50
var finishedMovingByX = false
if differenceOfX <= range && differenceOfX >= (range * -1) {
    finishedMovingByX = true
}
var finishedMovingByY = false
if differenceOfY <= range && differenceOfY >= (range * -1) {
    finishedMovingByY = true
}

print("(x:\(differenceOfX), y:\(differenceOfY))")
print("finishedMovingByX: \(finishedMovingByX)")
print("finishedMovingByY: \(finishedMovingByY)")

if (differenceOfX <= 0 && differenceOfY <= 0 && finishedMovingByX == false && finishedMovingByY == false) {
    print("↗️")
}
else if (differenceOfX <= 0 && differenceOfY <= 0 && finishedMovingByX == true && finishedMovingByY == false) {
    print("⬆️")
}
else if (differenceOfX >= 0 && differenceOfY <= 0 && finishedMovingByX == false && finishedMovingByY == false) {
    print("↖️")
}
else if (differenceOfX >= 0 && differenceOfY <= 0 && finishedMovingByX == true && finishedMovingByY == false) {
    print("↖️")
}
else if (differenceOfX >= 0 && differenceOfY <= 0 && finishedMovingByX == false && finishedMovingByY == true) { // NEW ONE
    print("↖️")
}
else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == true) {
    print("⬅️")
}
else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == false) {
    print("↙️")
}
else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == true && finishedMovingByY == false) {
    print("↙️")
}
else if (differenceOfX <= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == false) {
    print("↘️")
}
else if (differenceOfX <= 0 && differenceOfY >= 0 && finishedMovingByX == true && finishedMovingByY == false) {
    print("⬇️")
}
else if (differenceOfX <= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == true) {
    print("➡️")
}
else if finishedMovingByX == true && finishedMovingByY == true {
    print("🚷")
}
let xP = playerX / 50; let yP = playerY / 50; let xT = targetX / 50; let yT = targetY / 50;
print("")
print("[PLAYER]: \(playerX / 50) \(playerY / 50) \n[TARGET]: \(targetX / 50) \(targetY / 50)")
var unitStartLocations = [CGPoint]()
var totalWidth = 18; var totalHeight = 18
var x = 0; var y = 0
var curRow = ""; var entireMapSoFar = ""
var allColumns = [String]()
for y in 0...totalHeight {
    for x in 0...totalWidth {
        if x == xP && y == yP {
            curRow.append("O   ")
            unitStartLocations.append(CGPoint(x:x*50,y:y*50))
        }
        else if x == xT && y == yT {
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
