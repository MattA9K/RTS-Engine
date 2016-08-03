//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var keyValuePair = Dictionary<String, String>()

func printMapFromMapData(mapData: String) {
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
            keyValuePair["\(widthLevel * 50),\(heightLevel * 50)"] = column
//            print(widthLevel * 50, terminator:",")
//            print(heightLevel * 50, terminator:" ")
            x -= 1
        }
        
        print("")
        
        y += 1
    }
}



func printMapFromDictionary(mapData : Dictionary<String, String>, mapSize : CGSize) {
    let MapHeight = Int(mapSize.height)
    let MapWidth = Int(mapSize.width)
    for var y = 1; y <= MapHeight; y += 1 {
        var heightLevel = MapHeight - y
        
        for var x = MapWidth; x > 0; x -= 1 {
            var widthLevel = MapWidth - x
            print(mapData["\(widthLevel * 50),\(heightLevel * 50)"]!, terminator:" ")
        }
        print("")
    }
}


let mapData =
    "|O,O,O" +
    "|O,x,O" +
    "|O,O,O"

printMapFromMapData(mapData)

print("")

printMapFromDictionary(keyValuePair, mapSize: CGSizeMake(3, 3))

keyValuePair["50,50"]

/*
   0,100    50,100     100,100
 
   0,50     50,50      100,50
 
   0,0      50,0       100,0
*/
