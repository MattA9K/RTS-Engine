//: Playground - noun: a place where people can play

//import Cocoa
import Foundation

var str = "Hello, playground"

let guid = UUID()

guid.uuidString


//func randomStringWithLength (len : Int) -> NSString {
//    
//    let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//    
//    var randomString : NSMutableString = NSMutableString(capacity: len)
//    
//    for (var i=0; i < len; i++){
//        var length = UInt32 (letters.length)
//        var rand = arc4random_uniform(length)
//        randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
//    }
//    
//    return randomString
//}
//
//let startTime = NSDate()
//print(NSDate().timeIntervalSinceDate(startTime))
//for var i = 0; i < 10000; i++ {
//    let valueInRAM = randomStringWithLength(2)
//}
//
//let endTime = NSDate()
//print(NSDate().timeIntervalSinceDate(startTime))


/*
func randomNumberInt() -> Int
{
    let MAX : UInt32 = 8
    let MIN : UInt32 = 1
    let random_number = Int(arc4random_uniform(MAX) + MIN)
    return random_number
}

func randomNumberX() -> CGFloat
{
    let MAX : UInt32 = 125
    let MIN : UInt32 = 15
    let random_number = CGFloat(arc4random_uniform(MAX) + MIN)
    return random_number
}


randomNumberX()
*/
