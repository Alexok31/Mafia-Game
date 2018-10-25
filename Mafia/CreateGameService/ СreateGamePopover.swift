//
//  MainMenuHelper.swift
//  Mafia
//
//  Created by Александр Харченко on 10/23/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//


import UIKit

extension MainMenuController : UIPopoverPresentationControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let popoverView = segue.destination
        popoverView.popoverPresentationController?.delegate = self
        popoverView.popoverPresentationController?.sourceView = self.createGameButton
        popoverView.popoverPresentationController?.sourceRect = CGRect(x: self.createGameButton.bounds.midX, y: self.createGameButton.bounds.maxY, width: 0, height: 0)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
