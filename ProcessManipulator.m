//
//  ProcessManipulator.m
//  FTL Trainer
//
//  Created by Brett Basler on 6/7/13.
//  Copyright (c) 2013 br3tt. All rights reserved.
//

#import "ProcessManipulator.h"

BOOL VMReadBytes( vm_map_t task, mach_vm_address_t address, void *bytes, mach_vm_size_t *size ); // size is # bytes read after call
BOOL VMWriteData( vm_map_t task, mach_vm_address_t address, NSData *data);

@implementation ProcessManipulator
-(id) init:(pid_t) pid
{
    vm_map_t tmpTask;
	if ( task_for_pid( current_task(), pid, &tmpTask ) == KERN_SUCCESS ) {
        task = tmpTask;
        return self;
    }
    return NULL;
}

-(int) readInt:(int) address
{
    
    mach_vm_size_t size = 4;
    void * bytes = malloc(size);
    VMReadBytes(task, (mach_vm_address_t) address, bytes, &size);
    return *(int *)bytes;
}

-(void) writeInt:(int) address :(int) value
{
    NSData *data = [NSData dataWithBytes: &value length: sizeof(value)];
    VMWriteData(task, (mach_vm_address_t) address, data);
}

// the core of the shit
BOOL VMReadBytes( vm_map_t task, mach_vm_address_t address, void *bytes, mach_vm_size_t *size )
{
	kern_return_t result;
	mach_vm_size_t staticsize = *size;
	
	// perform the read
	result = mach_vm_read_overwrite( task, address, staticsize, (vm_offset_t)bytes, size );
	if ( result != KERN_SUCCESS ) {
		return NO;
	}
	
	return YES;
}

BOOL VMWriteData( vm_map_t task, mach_vm_address_t address, NSData *data )
{
	kern_return_t result;
	
	// attempt to write the bytes and return success/failure
	result = mach_vm_write( task, address, (vm_offset_t)[data bytes], (unsigned int)[data length]);
	return (result == KERN_SUCCESS);
}
@end
