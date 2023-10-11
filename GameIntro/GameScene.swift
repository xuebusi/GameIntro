//
//  GameScene.swift
//  GameIntro
//
//  Created by shiyanjun on 2023/10/11.
//

import SpriteKit

class GameScene: SKScene {
    /**
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
             // square.position = location
             
             // 3. Gliding Animation
             // 4. Sequence Actions
             let move = SKAction.move(to: location, duration: 1.0)
             let rotate = SKAction.rotate(byAngle: 90.0, duration: 1.0)
             
             let sequence = SKAction.sequence([move, rotate])
             square.run(sequence)
         }
     }
     
     // 5. Following the Touch
     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         for touch in touches {
             let location = touch.location(in: self)
             let move = SKAction.move(to: location, duration: 0.1)
             square.run(move)
         }
     }
     
     // 6. Stop Touch
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         let move = SKAction.move(to: CGPoint(x: size.width/2, y: size.height/2), duration: 0.1)
         square.run(move)
     }
     */
    
    override func didMove(to view: SKView) {
        // 下落
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -10.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let square = SKSpriteNode()
            square.size = CGSize(width: 50, height: 50)
            square.position = touch.location(in: self)
            square.color = .green
            
            square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
            
            square.physicsBody?.isDynamic = true
            square.physicsBody?.affectedByGravity = true
            
            addChild(square)
        }
    }
}
