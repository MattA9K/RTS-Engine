//: Playground - noun: a place where people can play

import Cocoa


var map1 = [

    [0,1,0],
    [0,0,0],
    [0,0,0]

]


var printer = ""

map1 = map1.reverse()

var y = 0
for row in map1 {
    var x = 0

    for col in row {
        
        
        printer = printer + " " + String(x) + String(y)
        x = x + 1
    }
    printer = printer + " \n"
    y = y + 1
}

print(printer)



