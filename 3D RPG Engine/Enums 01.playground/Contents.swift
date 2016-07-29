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
print("")

let stringarray = "x,x,x,x,x,x,x"
let aplitted = stringarray.componentsSeparatedByString(",")
print(aplitted)



let emojiRanges = [
    0x1F601...0x1F64F,
    0x2702...0x27B0,
    0x1F680...0x1F6C0,
    0x1F170...0x1F251
]

for range in emojiRanges {
    for i in range {
        var c = String(UnicodeScalar(i))
        print(c, terminator:"")
    }
}


func roundToFifties(x : CGFloat) -> CGFloat {
    return CGFloat(50 * Int(round(x / 50.0)))
}

print("")
print("")
print(roundToFifties(142))

print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())

