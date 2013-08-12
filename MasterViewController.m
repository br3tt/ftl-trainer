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
        NSArray *runningApplicationsList = [[NSWorkspace sharedWorkspace] runningApplications];
        for (id object in runningApplicationsList) {
            if ([[object bundleIdentifier] isEqual:@"subset.FTL"]) {
                pid_t pid = (pid_t) [object processIdentifier];
                
                NSLog(@"FTL Found: %i", pid);
                
                proc = [ProcessManipulator alloc];
                proc = [proc init:pid];
                
                baseptr = [proc readInt: FTL_BASE_PTR];
                NSLog(@"baseptr: %x", baseptr);
            }
        
        }
    }
    
    return self;
}

- (IBAction)fuel:(id)sender {
    int addr = baseptr + 0x330;
    int fuel = [proc readInt:addr];
    [proc writeInt:addr :fuel + 999];
}

- (IBAction)missles:(id)sender {
    int addr = baseptr + 0x34;
    int missleptr = [proc readInt:addr] + 0x168;
    int missles = [proc readInt:missleptr];
    [proc writeInt:missleptr :missles + 999];
}

- (IBAction)droneparts:(id)sender {
    int addr = baseptr + 0x4AC;
    int credz = [proc readInt:addr];
    [proc writeInt:addr :credz + 999];
}
- (IBAction)credits:(NSButton *)sender {
    int addr = baseptr + 0x370;
    int credz = [proc readInt:addr];
    [proc writeInt:addr :credz + 999];
}

- (IBAction)repair:(id)sender {
    int addr = baseptr + 0xDC;
    [proc writeInt:addr :30];
}

- (IBAction)github:(id)sender {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://github.com/br3tt"]];
}
@end
