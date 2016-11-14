//: Playground - noun: a place where people can play

import UIKit


/*
var str = "[{\"Hello\": \"playground\"}]"

let data = str.data(using: .utf8)


do {
    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:Any]]
    let currentConditions = parsedData[0]["Hello"]  //as! [String:Any]
    
    print(currentConditions)
    
} catch let error as NSError {
    print(error)
}




var str2 = "{\"Hello\": \"playground\"}"
let data2 = str2.data(using: .utf8)
do {
    let parsedData = try JSONSerialization.jsonObject(with: data2!, options: .allowFragments) as! [String:Any]
    let currentConditions = parsedData["Hello"]  //as! [String:Any]
    
    print(currentConditions)
    
} catch let error as NSError {
    print(error)
}

 */




let fuck = "data#some shit goes here..."

let array = fuck.components(separatedBy: "#")


func getValueForKey(rawData: String, key: String) -> String {
    let array = rawData.components(separatedBy: "#")
    
    if array[0] == key {
        return array[1]
        print("GOT OUR SHIT: \(array[1])")
    } else {
        return "null"
    }
}

func getElements(value: String) -> [String] {
    return value.components(separatedBy: "|")
}


// |KEY # VALUE|
let valForKey = getValueForKey(rawData: fuck, key: "data")

print(valForKey)
let fuck2 = "data#1|2|3|4|5|6|7|8"
let arr = getValueForKey(rawData: fuck2, key: "data")
arr
print(arr)
let final = getElements(value: arr)
print(final)
