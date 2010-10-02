//
//  FHDFlashController.m
//  Flashlight HD
//
//  Created by Amudi Sebastian on 10/2/10.
//  Copyright 2010 amudi.org. All rights reserved.
//

#import "FHDFlashController.h"


@implementation FHDFlashController

- (id)init {
	if ((self = [super init])) {
#if !TARGET_IPHONE_SIMULATOR
		if (![AVCaptureDevice instancesRespondToSelector:@selector(hasTorch)]) {
			return nil;
		}
			  
		captureSession = [[AVCaptureSession alloc] init];
		[captureSession beginConfiguration];
		captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
		if ([captureDevice hasTorch] && [captureDevice hasFlash]) {
			NSError *error;
			AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
			if (error) {
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error when initializing device" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
				[alert show];
				[alert release];
			} else {
				if (deviceInput) {
					[captureSession addInput:deviceInput];
				}
				
				AVCaptureVideoDataOutput *data = [[AVCaptureVideoDataOutput alloc] init];
				[captureSession addOutput:data];
				[data release];
				
				[captureSession commitConfiguration];
				[captureSession startRunning];
			}
		} else {
			// no torch & flash
			[captureSession release];
			return nil;
		}

#endif
	}
	return self;
}

- (void)dealloc {
#if !TARGET_IPHONE_SIMULATOR
	[captureSession release];
#endif
	[super dealloc];
}

- (void)toggle:(BOOL)on {
#if !TARGET_IPHONE_SIMULATOR
	[captureDevice lockForConfiguration:nil];
	[captureDevice setTorchMode:on];
	[captureDevice setFlashMode:on];
	[captureDevice unlockForConfiguration];
#endif
}

@end
