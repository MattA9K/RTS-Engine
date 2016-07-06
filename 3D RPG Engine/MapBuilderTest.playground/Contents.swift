//: Playground - noun: a place where people can play

import Cocoa




let row1 = ["FM_P1","_____","_____","_____","_____"]


let row2 = ["_____","_____","_____","_____","_____"]


let row3 = ["_____","_____","_____","_____","_____"]


let row4 = ["_____","_____","_____","_____","_____"]


let row5 = ["_____","_____","_____","FM_P1","_____"]




let rows = [row1,row2,row3,row4,row5]



var rowI = 0
for row in rows {
    
    var colI = 0
    for col in row {
        
        if col == "FM_P1" {
            print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50))
        }
        
        colI += 1
    }
    rowI += 1
}