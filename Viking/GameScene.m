//
//  GameScene.m
//  Viking
//
//  Created by Isaac Liu on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

+(id)scene {
    CCScene *scene = [CCScene node];
    CCLayer *gameScene = [GameScene node];
    [scene addChild:gameScene];
    return scene;
}

-(id)init{
    self = [super init];
    if (!self) 
        return self;
    
    BackgroundLayer *backgroundLayer = [BackgroundLayer node];
    [self addChild:backgroundLayer z:0];
    
    return self;
}
@end
