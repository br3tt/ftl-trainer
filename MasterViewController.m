//
//  MasterViewController.m
//  FTL Trainer
//
//  Created by Brett Basler on 6/6/13.
//  Copyright (c) 2013 br3tt. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        NSArray *runningApplicationsList = [[NSWorkspace sharedWorkspace] runningApplications];
        for (id object in runningApplicationsList) {
            if ([[object bundleIdentifier] isEqual:@"subset.FTL"]) {
                pid_t pid = (pid_t) [object processIdentifier];
                proc = [ProcessManipulator alloc];
                proc = [proc init:pid];
                
                NSLog(@"FTL Found: %i", pid);
            }
        
        }
    }
    
    return self;
}

- (IBAction)fuel:(id)sender {
    int baseptr = [proc readInt: 0x1F2C5C] + 0x330;
    int credz = [proc readInt:baseptr];
    [proc writeInt:baseptr :credz + 999];
}

- (IBAction)missles:(id)sender {
    //0x799A58
}

- (IBAction)droneparts:(id)sender {
    int baseptr = [proc readInt: 0x1F2C5C] + 0x4AC;
    int credz = [proc readInt:baseptr];
    [proc writeInt:baseptr :credz + 999];
}
- (IBAction)credits:(NSButton *)sender {
    int baseptr = [proc readInt: 0x1F2C5C] + 0x370;
    int credz = [proc readInt:baseptr];
    [proc writeInt:baseptr :credz + 999];
    NSLog(@"baseptr: %x", baseptr);
    //[_credits setStringValue:[NSString stringWithFormat:@"%i", credz]];
}
@end