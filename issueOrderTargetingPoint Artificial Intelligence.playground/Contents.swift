//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




let currentPositionOfSelf = CGPoint(x:0, y:300)
let target = CGPoint(x:150, y:300)

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
else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == true) {
    print("⬅️")
}
else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == false) {
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