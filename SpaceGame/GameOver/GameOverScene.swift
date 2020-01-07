//
//  GameOverScene.swift
//  SpaceGame
//
//  Created by Jorden Gerovac on 2020-01-07.
//  Copyright © 2020 Jorden Gerovac. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    var score:Int = 0
    var starfield:SKEmitterNode!
    var newGameButtonNode:SKSpriteNode!
    var scoreLabelNode:SKLabelNode!
    
    override func didMove(to view: SKView) {
        starfield = self.childNode(withName: "starfield") as? SKEmitterNode
        starfield.advanceSimulationTime(10)
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as? SKSpriteNode
        
        scoreLabelNode = self.childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabelNode.text = "\(score)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton" {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
            }
        }
    }
}
