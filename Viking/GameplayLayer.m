//
//  GameLayer.m
//  Viking
//
//  Created by Isaac Liu on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameplayLayer.h"


@implementation GameplayLayer

-(void)applyJoystick:(SneakyJoystick *)aJoystick toNode:(CCNode *)tempNode forTimeDelta:(float)deltaTime {

    CGPoint scaledVelocity = ccpMult(aJoystick.velocity, kJoystickVelocityScaleFactor);
    CGPoint newPosition = ccp(tempNode.position.x + scaledVelocity.x * deltaTime, tempNode.position.y + scaledVelocity.y * deltaTime);
    [tempNode setPosition:newPosition];
    
    if (jumpButton.active == YES) {
        CCLOG(@"Jump Button Pressed");
    }
    if (attackButton.active == YES) {
        CCLOG(@"Attach Button Pressed");
    }
}

-(void)initJoystickAndButtons{
    CGSize screenSize = [CCDirector sharedDirector].winSize;       // 1
    CGRect joystickBaseDimensions = 
    CGRectMake(0, 0, 128.0f, 128.0f);                      // 2
    CGRect jumpButtonDimensions = 
    CGRectMake(0, 0, 64.0f, 64.0f);
    CGRect attackButtonDimensions = 
    CGRectMake(0, 0, 64.0f, 64.0f);
    CGPoint joystickBasePosition;                                  // 3
    CGPoint jumpButtonPosition;
    CGPoint attackButtonPosition;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {    // 4
        // The device is an iPad running iPhone 3.2 or later.
        CCLOG(@"Positioning Joystick and Buttons for iPad");
        joystickBasePosition = ccp(screenSize.width*0.0625f,
                                   screenSize.height*0.052f);
        
        jumpButtonPosition = ccp(screenSize.width*0.946f,
                                 screenSize.height*0.052f);
        
        attackButtonPosition = ccp(screenSize.width*0.947f,
                                   screenSize.height*0.169f);
    } else {
        // The device is an iPhone or iPod touch.
        CCLOG(@"Positioning Joystick and Buttons for iPhone");
        joystickBasePosition = ccp(screenSize.width*0.07f,
                                   screenSize.height*0.11f);
        
        jumpButtonPosition = ccp(screenSize.width*0.93f,
                                 screenSize.height*0.11f);
        
        attackButtonPosition = ccp(screenSize.width*0.93f,
                                   screenSize.height*0.35f);
    }
    
    SneakyJoystickSkinnedBase *joystickBase =
    [[[SneakyJoystickSkinnedBase alloc] init] autorelease];        // 5
    joystickBase.position = joystickBasePosition;                  // 6
    joystickBase.backgroundSprite = 
    [CCSprite spriteWithFile:@"dpadDown.png"];                     // 7
    joystickBase.thumbSprite = 
    [CCSprite spriteWithFile:@"joystickDown.png"];                 // 8
    joystickBase.joystick = [[SneakyJoystick alloc]
                             initWithRect:joystickBaseDimensions]; // 9
    joystick = [joystickBase.joystick retain];                // 10
    [self addChild:joystickBase];                                 // 11
    
    SneakyButtonSkinnedBase *jumpButtonBase =
    [[[SneakyButtonSkinnedBase alloc] init] autorelease];        // 12
    jumpButtonBase.position = jumpButtonPosition;                // 13
    jumpButtonBase.defaultSprite = 
    [CCSprite spriteWithFile:@"jumpUp.png"];                     // 14
    jumpButtonBase.activatedSprite = 
    [CCSprite spriteWithFile:@"jumpDown.png"];                   // 15
    jumpButtonBase.pressSprite = 
    [CCSprite spriteWithFile:@"jumpDown.png"];                   // 16
    jumpButtonBase.button = [[SneakyButton alloc] 
                             initWithRect:jumpButtonDimensions]; // 17
    jumpButton = [jumpButtonBase.button retain];                 // 18
    jumpButton.isToggleable = NO;                                // 19
    [self addChild:jumpButtonBase];                              // 20
    
    SneakyButtonSkinnedBase *attackButtonBase = [[[SneakyButtonSkinnedBase alloc] init] autorelease];            // 21
    attackButtonBase.position = attackButtonPosition;            // 22
    attackButtonBase.defaultSprite = [CCSprite spriteWithFile:@"handUp.png"];                                   // 23
    attackButtonBase.activatedSprite = [CCSprite spriteWithFile:@"handDown.png"];                                 // 24
    attackButtonBase.pressSprite = [CCSprite spriteWithFile:@"handDown.png"];                                 // 25
    attackButtonBase.button = [[SneakyButton alloc] initWithRect:attackButtonDimensions];                            // 26
    attackButton = [attackButtonBase.button retain];             // 27
    attackButton.isToggleable = NO;                              // 28
    [self addChild:attackButtonBase];                     
}

-(void)update:(ccTime)deltaTime {
    [self applyJoystick:joystick toNode:vikingImage forTimeDelta:deltaTime];
}

-(id)init{
    self = [super init];
    if (!self)
        return self;
    
    self.isTouchEnabled = YES;	
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    vikingImage = [CCSprite spriteWithFile:@"sv_anim_1.png"];
    [vikingImage setPosition:
     CGPointMake(screenSize.width/2, screenSize.height*0.17f)];
    
    [self addChild:vikingImage];
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
        [vikingImage setScaleX:screenSize.width/1024.0f];
        [vikingImage setScaleY:screenSize.height/768.0f];
    }
    
    [self initJoystickAndButtons];
    [self scheduleUpdate];
    
    return self;
}

@end
