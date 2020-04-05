//
//  UnitCommandCardView.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 12/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit

let CELL_ID : String = "CmdCard"


class UnitCommandCardView : UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionViewCommandCard : UICollectionView!
    var elements : [UnitCommand]! = []
    var delegateGameScene : GameScene!
    var selectedUnitUUID : UUID! = UUID()
    
    override init(frame: CGRect) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.headerReferenceSize = CGSize(width: 0, height: 0)
        flowLayout.itemSize = CGSize(width: 40, height: 40)
        flowLayout.estimatedItemSize = CGSize(width: 40, height: 40)
        
        super.init(frame: frame)
        
        let frameCollectionView : CGRect = CGRect(x: 0, y: 0, width: 140, height: 150)
        collectionViewCommandCard = UICollectionView(
            frame: frameCollectionView,
            collectionViewLayout: flowLayout
        )
        collectionViewCommandCard.register(CommandCardCell.self, forCellWithReuseIdentifier: CELL_ID)
        collectionViewCommandCard.dataSource = self
        collectionViewCommandCard.delegate = self
        self.addSubview(collectionViewCommandCard)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didGetMessageFromScene(message: Any) {
        if message is AbstractUnit {
            if (message as! AbstractUnit).uuid != selectedUnitUUID {
                elements = []
                let commands = (message as! AbstractUnit).commandCard
                elements = commands.commands
                self.selectedUnitUUID = (message as! AbstractUnit).uuid

                let array = [0]
                let indexSet = IndexSet(array)
                self.collectionViewCommandCard.reloadSections(indexSet)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("CELL \(elements[indexPath.row].name) SELECTED!")
        
        if elements[indexPath.row] == .walkMove {
            self.delegateGameScene.testCommandBarDelegate(elements[indexPath.row].name)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CELL_ID,
            for: indexPath) as! CommandCardCell
        
        cell.backgroundColor = .yellow
        cell.coreTitleLabel.text = elements[indexPath.row].name
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
}
