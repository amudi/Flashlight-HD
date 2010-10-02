//
//  FHDFlashController.h
//  Flashlight HD
//
//  Created by Amudi Sebastian on 10/2/10.
//  Copyright 2010 amudi.org. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface FHDFlashController : NSObject {
#if !TARGET_IPHONE_SIMULATOR
	AVCaptureSession *captureSession;
	AVCaptureDevice *captureDevice;
#endif
}

- (void)toggle:(BOOL)on;

@end
