//
// Created by Mateusz Andrzejczuk on 11/30/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit




class UnitInformationPanel {
    let mainWindow = SKSpriteNode(color: .black, size: CGSize(width:150, height:150))
    let buttonDebug = CSKButtonNode(color: .gray, size: CGSize(width:50, height:50))

    let label1 : SKLabelNode = SKLabelNode(fontNamed:"HoeflierText")
    let label2 : SKLabelNode = SKLabelNode(fontNamed:"HoeflierText")
    let label3 : SKLabelNode = SKLabelNode(fontNamed:"HoeflierText")

    var selectedUnitUUID : UUID?
    var unitUnderConstructionUUID : UUID?
    var progress : Int = 0

    var components : [SKNode] = []
    var unitSpawnLocation : CGPoint?

    var unitName : String? = ""

    init() {

        label1.name = "label-1"
        label2.name = "label-2"
        label3.name = ""
        label1.fontSize = label1.fontSize / 2
        label2.fontSize = label2.fontSize / 2
        label3.fontSize = label3.fontSize / 2
        label3.fontColor = .red

        components.append(mainWindow)
        components.append(buttonDebug)
        components.append(label1 as SKLabelNode)
        components.append(label2 as SKLabelNode)
        components.append(label3 as SKLabelNode)

        bringComponentsToFront()
        debugOverride()
    }

    func debugOverride() {
        buttonDebug.name = "CMD_test"
    }

    func loadUnitIntoView(unit: AbstractUnit, _ position: CGPoint) {
//        print("UNIT BUILD PROGRESS: \(progress)")
        var y : CGFloat = 0
        for comp in components {
            comp.position = CGPoint(x:position.x + 350, y:position.y + y)
            y = y + 50
        }
        unitSpawnLocation = unit.sprite.position
        selectedUnitUUID = unit.uuid
        unitName = unit.sprite.name
    }

    func setProgressLabelValue(int: Int) {
        self.label1.text = "training: \(int)"
        self.label2.text = "UUID: \(selectedUnitUUID!)"
    }

    func updateLabels(_ uuid: UUID, _ name: String, _ target: String) {
        self.label1.text = "name: \(name)"
        self.label2.text = "UUID: \(uuid)"
        self.label3.text = "Target: \(target)"

    }

    func bringComponentsToFront() {
        for comp in components {
            comp.name = "UI_UnitInformationPanel"
            comp.zPosition = 3000
        }
    }

    func getCosmeticComponents() -> [SKSpriteNode] {
        return [mainWindow]
    }

    func getEventComponents() -> [CSKButtonNode] {
        buttonDebug.name = "CMD_test"
        return [buttonDebug]
    }
}

class CSKButtonNode : SKSpriteNode {

}

extension GameScene {
    func forwardButtonEvent(_ sender: CSKButtonNode) {
        switch sender.name! {
            case "CMD_test":
                print("yeah it works...")
                let orc = PeonUnit(player: 2)
                orc.sprite.position = CGPoint(
                        x:self.unitInformationPanel.unitSpawnLocation!.x - 150,
                        y:self.unitInformationPanel.unitSpawnLocation!.y - 150
                )
                self.hostDidRequestBuildOrder(unit: orc)
            case "OrcHut":
                print("ORC HUT ISSUED BUILD ORDER!")
                let orc = PeonUnit(player: 2)
                self.hostDidRequestBuildOrder(unit: orc)
            default:
                print("hmmm")
        }
    }

    func hostDidRequestBuildOrder(unit: AbstractUnit) {
        self.unitsUnderConstruction[unit.uuid] = 200
        self.AllUnitsInGameScene[unit.uuid] = unit
        self.unitInformationPanel.unitUnderConstructionUUID = unit.uuid
        print("BUILD ORDER ISSUED!")
    }

    func unitConstructionCompleted(_ uuid: UUID) {
        self.broadcastAIUnitToGameScene(unit: self.AllUnitsInGameScene[uuid]!)
    }
}