//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"



let mapData =
            "|O,O,O" +
            "|O,x,O" +
            "|O,O,O"


var rows = mapData.componentsSeparatedByString("|")
rows.removeAtIndex(0)
rows

let MAP_HEIGHT = rows.count
let MAP_WIDTH = rows[0].componentsSeparatedByString(",").count

var y = 1
for entireRow in rows {
    var heightLevel = MAP_HEIGHT - y
    
    let columnsInRow = entireRow.componentsSeparatedByString(",")
    
//    print(heightLevel, terminator:" ")
    
    var x = MAP_WIDTH
    for column in columnsInRow {
        var widthLevel = MAP_WIDTH - x
        
        print(column, terminator:" ")
//        print(widthLevel * 50, terminator:",")
//        print(heightLevel * 50, terminator:" ")
        x -= 1
    }
    
    print("")
    
    y += 1
}


/*
 
   0,100    50,100     100,100
 
   0,50     50,50      100,50
 
   0,0      50,0       100,0
 
 */