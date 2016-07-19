//
//  Map01.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/14/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation


extension GameMap {
    
    func getMap01Units() -> [[MapCoordUnit]] {
        let 😇 = MapCoordUnit.Player;
        let 😊 = MapCoordUnit.FtmanP1;
        let 😈 = MapCoordUnit.GruntP2;
        let 👺 = MapCoordUnit.SpearP2;
        let 🔻 = MapCoordUnit.OrcHutP2;
        let 🔶 = MapCoordUnit.GreatHallP2;
        let 🌑 = MapCoordUnit.Void;
        let 🔷 = MapCoordUnit.OrcBarracks;
        let 🔴 = MapCoordUnit.OrcWall;
        let 🔵 = MapCoordUnit.OrcBlacksmith;
        let 💎 = MapCoordUnit.OrcLumberMill;
        
        
        //          TOP_RIGHT                                                                                  BOTTOM_RIGHT
        let s1  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s2  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s3  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s4  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s5  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s6  = "🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s7  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s8  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s9  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s10 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s11 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s12 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s13 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s14 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s15 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s16 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s17 = "🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s18 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s19 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s20 = "🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,👺,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s21 = "🌑,😈,🌑,🌑,😊,🌑,😊,🌑,🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s22 = "🌑,🌑,🌑,🌑,🌑,😊,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s23 = "🌑,🌑,🌑,🌑,😊,😊,😊,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s24 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s25 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s26 = "🌑,🌑,🌑,🌑,🌑,😇,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s27 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s28 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,👺,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s29 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s30 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s31 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        
        let strings = [s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31]
        
        var returnArray = [[MapCoordUnit]]()
        for string in strings {
            let array = string.componentsSeparatedByString(",")
            var finalArray = [MapCoordUnit]()
            
            for tile in array {
                if tile == "🌑" {
                    finalArray.append(🌑)
                } else if tile == "😈" {
                    print(tile)
                    finalArray.append(😈)
                } else if tile == "😇" {
                    print(tile)
                    finalArray.append(😇)
                } else if tile == "😊" {
                    print(tile)
                    finalArray.append(😊)
                } else if tile == "🔶" {
                    print(tile)
                    finalArray.append(🔶)
                } else if tile == "🔷" {
                    print(tile)
                    finalArray.append(🔷)
                } else if tile == "🔴" {
                    print(tile)
                    finalArray.append(🔴)
                } else if tile == "🔵" {
                    print(tile)
                    finalArray.append(🔵)
                } else if tile == "💎" {
                    print(tile)
                    finalArray.append(💎)
                } else if tile == "👺" {
                    print(tile)
                    finalArray.append(👺)
                }
            }
            returnArray.append(finalArray)
        }

        //          TOP_LEFT                                                                                    BOTTOM_LEFT
        
        return returnArray
    }
    
    
    
    func getMap01Tiles() -> [[MapCoordTile]] {
        let 🐚 = MapCoordTile.Stone;
        let 🌲 = MapCoordTile.Tree;
        let 🍃 = MapCoordTile.Grass;
        let 🌑 = MapCoordTile.Void;
        let 🔆 = MapCoordTile.Void;
        

        
        
        //          TOP_RIGHT                                                                                  BOTTOM_RIGHT
        let s1  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s2  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s3  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s4  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s5  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s6  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s7  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s8  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s9  = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s10 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s11 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s12 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s13 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s14 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s15 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s16 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s17 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s18 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s19 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s20 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s21 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s22 = "🌑,🌑,🌑,🌑,🌑,🌑,😈,🌑,🌑,🌑,😇,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s23 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s24 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s25 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s26 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s27 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s28 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑"
        let s29 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s30 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        let s31 = "🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑"
        
        let strings = [s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31]
        
        var returnArray = [[MapCoordTile]]()
        for string in strings {
            let array = string.componentsSeparatedByString(",")
            var finalArray = [MapCoordTile]()
            for tile in array {
                if tile == "🌑" {
                    finalArray.append(🌑)
                } else if tile == "🍃" {
                    finalArray.append(🍃)
                }
            }
            returnArray.append(finalArray)
        }
        
        //          TOP_LEFT                                                                                    BOTTOM_LEFT
        
        
        
        return returnArray
    }

}