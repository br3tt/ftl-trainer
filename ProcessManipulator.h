//
//  ProcessManipulator.h
//  FTL Trainer
//
//  Created by Brett Basler on 6/7/13.
//  Copyright (c) 2013 br3tt. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <mach/mach_traps.h>
#include <mach/mach_vm.h>
#include <mach/mach_init.h>
#include <mach/mach_error.h>
#include <mach/vm_map.h>

@interface ProcessManipulator : NSObject {
    vm_map_t task;
}
-(id) init:(pid_t) pid;
-(int) readInt:(int) address;
-(void) writeInt:(int) address :(int) value;
@end
