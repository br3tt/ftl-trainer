//
//  HandButton.m
//  FTL Trainer
//
//  Created by Brett Basler on 6/9/13.
//  Copyright (c) 2013 br3tt. All rights reserved.
//

#import "HandButton.h"

@implementation HandButton

- (void)resetCursorRects
{
    [super resetCursorRects];
    [self addCursorRect:[self bounds] cursor:[NSCursor pointingHandCursor]];
}

@end
