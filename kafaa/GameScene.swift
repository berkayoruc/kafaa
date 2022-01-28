//
//  GameScene.swift
//  kafaa
//
//  Created by berkay on 29.01.2022.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        backgroundColor = SKColor.white
        
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: player.size.width, height: player.size.height))
        player.physicsBody?.contactTestBitMask = player.physicsBody?.collisionBitMask ?? 0
        player.physicsBody?.linearDamping = 0.0
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.friction = 1
        player.physicsBody?.mass = 10
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(player)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
        let velocity = CGVector(dx: 0, dy: 500.0)
        player.physicsBody?.velocity = velocity
    }
}
