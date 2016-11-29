//
// Created by Mateusz Andrzejczuk on 11/26/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation



extension HostGameViewController {

    func presentUnitDebuggerDialog() {
        let alertController = UIAlertController(
                title: "Game Lobby Commands",
                message: "Debug Mode",
                preferredStyle: .alert
                )

        let a1 = UIAlertAction(
                title: "Cancel",
                style: .cancel) { (result : UIAlertAction) -> Void in
            print("Done")
        }

        let a2 = UIAlertAction(
                title: "Establish Socket Connection",
                style: .default) { (result : UIAlertAction) -> Void in
            print("Done")
            self.establishStableConnection()
        }


        alertController.addAction(a1)
        alertController.addAction(a2)


        self.present(alertController, animated: true, completion: nil)
    }

}