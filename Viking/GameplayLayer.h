//
//  GameLayer.h
//  Viking
//
//  Created by Isaac Liu on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameConst.h"
#import "SneakyJoystick.h"
#import "SneakyButton.h"
#import "SneakyJoystickSkinnedBase.h"
#import "SneakyButtonSkinnedBase.h"

@interface GameplayLayer : CCLayer {
    CCSprite *vikingImage;
    SneakyJoystick *joystick;
    SneakyButton *jumpButton;
    SneakyButton *attackButton;
}

@end
