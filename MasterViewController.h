//
//  MasterViewController.h
//  FTL Trainer
//
//  Created by Brett Basler on 6/6/13.
//  Copyright (c) 2013 br3tt. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "ProcessManipulator.h"

@interface MasterViewController : NSViewController {
    ProcessManipulator *proc;
}

- (IBAction)fuel:(NSButton *)sender;
- (IBAction)missles:(NSButton *)sender;
- (IBAction)droneparts:(NSButton *)sender;
- (IBAction)credits:(NSButton *)sender;
- (IBAction)repair:(id)sender;
- (IBAction)github:(id)sender;
@property (weak) IBOutlet NSButton *githubButton;

@end
