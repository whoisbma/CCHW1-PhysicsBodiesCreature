//
//  BMAMyScene.m
//  PhysicsBodiesCreature
//
//  Created by Bryan Ma on 2/18/14.
//  Copyright (c) 2014 Bryan Ma. All rights reserved.
//

#import "BMAMyScene.h"

@interface BMAMyScene()
@property SKSpriteNode* mySquare1;
@property SKSpriteNode* mySquare2;
@property SKSpriteNode* mySquare3;
@property SKSpriteNode* mySquare4;
@property SKSpriteNode* mySquare5;
@property SKSpriteNode* mySquare6;
@property SKPhysicsJoint* myJoint1;
@property SKPhysicsJoint* myJoint2;
@property SKPhysicsJoint* myJoint3;
@property SKPhysicsJoint* myJoint4;
@property SKPhysicsJoint* myJoint5;

@end

@implementation BMAMyScene

-(void)spawnSquares{
    NSLog(@"Entered SpawnSquares");
    _mySquare1 = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(50,50)];
    [_mySquare1 setPosition:CGPointMake(200,170)];
    _mySquare1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare1.size];
    [self addChild:_mySquare1];
    _mySquare2 = [[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(75,115)];
    [_mySquare2 setPosition:CGPointMake(200,200)];
    _mySquare2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare2.size];
    _mySquare2.anchorPoint = CGPointMake(0.5,0);
    [self addChild:_mySquare2];
    _mySquare3 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(25,100)];
    [_mySquare3 setPosition:CGPointMake(150,180)];
    _mySquare3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare3.size];
    _mySquare3.anchorPoint = CGPointMake(1,0);
    [self addChild:_mySquare3];
    _mySquare4 = [[SKSpriteNode alloc]initWithColor:[SKColor greenColor] size:CGSizeMake(25,100)];
    [_mySquare4 setPosition:CGPointMake(250,180)];
    _mySquare4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare4.size];
    _mySquare4.anchorPoint = CGPointMake(1,1);
    [self addChild:_mySquare4];
    _mySquare5 = [[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(25,125)];
    [_mySquare5 setPosition:CGPointMake(180,300)];
    _mySquare5.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare5.size];
    _mySquare5.anchorPoint = CGPointMake(1,0);
    [self addChild:_mySquare5];
    _mySquare6 = [[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(25,125)];
    [_mySquare6 setPosition:CGPointMake(250,300)];
    _mySquare6.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare6.size];
    _mySquare6.anchorPoint = CGPointMake(1,1);
    [self addChild:_mySquare6];

}

-(void)spawnBackgroundWorld{
    NSLog(@"Entered spawnBackgroundWorld");
    self.scaleMode = SKSceneScaleModeAspectFit;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self.physicsBody setRestitution:0.7]; //bounciness
}

-(void)spawnJoint{
    NSLog(@"Entered spawnJoint");
    _myJoint1 = [SKPhysicsJointSpring
                 jointWithBodyA:_mySquare1.physicsBody
                 bodyB:_mySquare2.physicsBody
                 anchorA: _mySquare1.position
                 anchorB: _mySquare2.position];
    [self.physicsWorld addJoint:_myJoint1];
    
    _myJoint2 = [SKPhysicsJointPin
                 jointWithBodyA:_mySquare2.physicsBody
                 bodyB:_mySquare3.physicsBody
                 anchor:_mySquare3.position];
                 //anchorA:_mySquare2.position
                 //anchorB:_mySquare3.position];
    [self.physicsWorld addJoint:_myJoint2];
    
    _myJoint3 = [SKPhysicsJointPin
                 jointWithBodyA:_mySquare2.physicsBody
                 bodyB:_mySquare4.physicsBody
                 anchor:_mySquare4.position];
    [self.physicsWorld addJoint:_myJoint3];

    _myJoint4 = [SKPhysicsJointPin
                 jointWithBodyA:_mySquare2.physicsBody
                 bodyB:_mySquare5.physicsBody
                 anchor:_mySquare5.position];
    [self.physicsWorld addJoint:_myJoint4];
    
    _myJoint5 = [SKPhysicsJointPin
                 jointWithBodyA:_mySquare2.physicsBody
                 bodyB:_mySquare6.physicsBody
                 anchor:_mySquare6.position];
    [self.physicsWorld addJoint:_myJoint5];
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        [self spawnBackgroundWorld];
        [self spawnSquares];
        [self spawnJoint];

    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_mySquare1 setPosition:location];
        [_mySquare1.physicsBody setDynamic:false]; //not affected by gravity

       }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *) event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_mySquare1 setPosition:location];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        //CGPoint location = [touch locationInNode:self];
        [_mySquare1.physicsBody setDynamic:true]; //affected by gravity again

    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
