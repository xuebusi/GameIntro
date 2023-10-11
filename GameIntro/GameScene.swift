//
//  GameScene.swift
//  GameIntro
//
//  Created by shiyanjun on 2023/10/11.
//

import SpriteKit

class GameScene: SKScene {
    let square = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        print("Game Scene Loaded")
        // 1. create a sprite
        square.size = CGSize(width: 50, height: 50)
        square.position = CGPoint(x: size.width/2, y: size.height/2)
        square.color = .green
        
        addChild(square)
    }
    
    // 2. Touch Location
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            square.position = location
        }
    }
}
