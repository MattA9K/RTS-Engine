//
// Created by Mateusz Andrzejczuk on 12/2/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


let DEFAULT_HUMAN_COLOR : UIColor = .blue
let DEFAULT_CPU_COLOR : UIColor = .orange
let DEFAULT_BLOCKED : UIColor = .brown
let DEFAULT_UNBLOCKED : UIColor = .white


/// Represents a point in the mini-map
///
///
/// `PROPERTIES`
///
/// - **keyStringValue**: `String` i.e. "{600, 350}"
/// - **cgPoint**: `CGPoint`
/// - **contents**: `String` i.e. "VOID"
/// - **color** `String`
/// - **isBlockedLand** `Bool`
/// - **isBlockedSea** `Bool`
/// - **isBlockedAir** `Bool`
struct GamePathMatrixPoint {

    let keyStringValue : String
    let cgPoint : CGPoint
    let contents : String
    let color : UIColor
    let isBlockedLand : Bool
    let isBlockedSea : Bool
    let isBlockedAir : Bool


    /// Usually used for newly appended units.
    init(location: CGPoint, spaceTime:String, _color: UIColor) {
        keyStringValue = "{\(location.x), \(location.y)}" // i.e. "{600, 350}"
        cgPoint = location
        contents = spaceTime
        isBlockedLand = true
        isBlockedSea = false
        isBlockedAir = false
        color = _color
    }


    init(LandPoint: CGPoint, IsBlocked: Bool, spaceTime:String, _color: UIColor) {
        keyStringValue = "{\(LandPoint.x), \(LandPoint.y)}" // i.e. "{600, 350}"
        cgPoint = LandPoint
        contents = spaceTime
        isBlockedLand = IsBlocked
        isBlockedSea = false
        isBlockedAir = false
        color = _color
    }


    init(_keyStringValue:String, _cgPoint: CGPoint, _contents: String,
         _isBlockedLand: Bool, _isBlockedSea: Bool, _isBlockedAir: Bool, _color: UIColor) {

        keyStringValue = _keyStringValue // i.e. "{600, 350}"
        cgPoint = _cgPoint
        contents = _contents
        isBlockedLand = _isBlockedLand
        isBlockedSea = _isBlockedSea
        isBlockedAir = _isBlockedAir
        color = _color
    }


    func blockPathfinders(point: CGPoint, newColor: UIColor) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: point,
                _contents: oldContents,
                _isBlockedLand: false,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir,
                _color: newColor
        )
        return replacementMatrixPoint
    }


    func unblockPathfinders(point: CGPoint, newColor: UIColor) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: point,
                _contents: oldContents,
                _isBlockedLand: false,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir,
                _color: newColor
        )
        return replacementMatrixPoint
    }


    func pathfinderWillLeave(point: CGPoint, newColor: UIColor) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: oldCgPoint,
                _contents: oldContents,
                _isBlockedLand: false,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir,
                _color: newColor
        )
        return replacementMatrixPoint
    }


    func pathfinderWillEnter(point: CGPoint, withSpaceTime: String, newColor: UIColor) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: point,
                _contents: withSpaceTime,
                _isBlockedLand: true,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir,
                _color: newColor
        )
        return replacementMatrixPoint
    }
}