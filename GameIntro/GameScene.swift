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
    
    let backgroud = SKSpriteNode(imageNamed: "bg")
    let backgroud2 = SKSpriteNode(imageNamed: "bg")
    
    override func didMove(to view: SKView) {
        createBackground()
        // 这句代码会导致场景中的精灵方块落地后不断晃动
        // self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -50.0)
        createPlatform()
    }
    
    func createBackground() {
        backgroud.anchorPoint = .zero
        backgroud.position = .zero
        //backgroud.size = self.size
        backgroud.size.height = self.size.height
        backgroud.zPosition = 1
        addChild(backgroud)
        
        backgroud2.anchorPoint = .zero
        backgroud2.position.y = .zero
        backgroud2.position.x = backgroud.size.width
        //backgroud2.size = self.size
        backgroud.size.height = self.size.height
        backgroud2.zPosition = 1
        addChild(backgroud2)
    }
    
    // 地面
    func createPlatform() {
        let platform = SKSpriteNode()
        platform.size = CGSize(width: size.width, height: 50)
        platform.position = CGPoint(x: size.width/2, y: 25)
        platform.color = .brown
        platform.zPosition = 2
        
        platform.physicsBody = SKPhysicsBody(rectangleOf: platform.size)
        
        platform.physicsBody?.isDynamic = false
        platform.physicsBody?.affectedByGravity = false
        
        addChild(platform)
    }
    
    // 随机颜色
    let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemCyan, .systemBlue, .systemPurple]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let square = SKSpriteNode()
            square.size = CGSize(width: 50, height: 50)
            square.position = touch.location(in: self)
            square.color = colors.randomElement()!
            square.zPosition = 3
            
            square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
            
            square.physicsBody?.isDynamic = true
            square.physicsBody?.affectedByGravity = true
            // 弹力
            square.physicsBody?.restitution = 0.4
            
            addChild(square)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        backgroud.position.x -= 1
        backgroud2.position.x -= 1

        if backgroud.position.x < -backgroud.size.width {
            backgroud.position.x = backgroud2.position.x + backgroud.size.width
        }
        if backgroud2.position.x < -backgroud2.size.width {
            backgroud2.position.x = backgroud.position.x + backgroud2.size.width
        }
    }
}
