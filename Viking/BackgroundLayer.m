//
//  BackgroundLayer.m
//  Viking
//
//  Created by Isaac Liu on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BackgroundLayer.h"


@implementation BackgroundLayer

-(id)init{
    self = [super init];
    if (!self)
        return self;
    
    CCSprite* backgroundImage;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        backgroundImage = [CCSprite spriteWithFile:@"background.png"];
    }
    else{
        backgroundImage = [CCSprite spriteWithFile:@"backgroundiPhone.png"];
    }
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    [backgroundImage setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
    [self addChild:backgroundImage z:0 tag:kTagBackgroundImageInBackgroundLayer];
    
    return self;
}

@end
