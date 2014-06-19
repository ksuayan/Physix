//
//  MyScene.m
//  Physix
//
//  Created by Kyo Suayan on 6/15/14.
//  Copyright (c) 2014 Kyo Suayan. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // Add the sprite
        SKSpriteNode* sprite = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(25, 25)];
        sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:sprite.size];
        sprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        sprite.physicsBody.density = 2;
        sprite.name = @"Box";
        [self addChild:sprite];
        
        // Add the walls
        SKNode* walls = [SKNode node];
        walls.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self addChild:walls];
        
        // anchor point
        SKSpriteNode* anchor = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(50, 50)];
        anchor.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 200);
        anchor.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:anchor.size];
        anchor.physicsBody.dynamic = NO;
        [self addChild:anchor];
        
        // attachment
        SKSpriteNode* attachment = [SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(50, 50)];
        attachment.position = CGPointMake(CGRectGetMidX(self.frame) + 100, CGRectGetMidY(self.frame) + 150);
        attachment.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:attachment.size];
        [self addChild:attachment];
        
        SKPhysicsJointPin* pinJoint = [SKPhysicsJointPin jointWithBodyA:anchor.physicsBody bodyB:attachment.physicsBody anchor:anchor.position];
        [self.physicsWorld addJoint:pinJoint];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    SKNode* node = [self childNodeWithName:@"Box"];
    [node.physicsBody applyForce:CGVectorMake(0, 10000)];
    [node.physicsBody applyTorque:0.02];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
