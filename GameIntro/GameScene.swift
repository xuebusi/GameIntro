//
//  GameScene.swift
//  GameIntro
//
//  Created by shiyanjun on 2023/10/11.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        print("Game Scene Loaded")
        
        let square = SKSpriteNode()
        square.size = CGSize(width: 50, height: 50)
        square.position = CGPoint(x: size.width/2, y: size.height/2)
        square.color = .green
        
        addChild(square)
    }
}
