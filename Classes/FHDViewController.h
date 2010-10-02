//
//  Flashlight_HDViewController.h
//  Flashlight HD
//
//  Created by Amudi Sebastian on 10/2/10.
//  Copyright 2010 amudi.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHDFlashController.h"

typedef enum {
	FHDFlashlightColorWhite = 0,
	FHDFlashlightColorBlue,
	FHDFlashlightColorGreen,
	FHDFlashlightColorRed,
	FHDFlashlightColorPurple,
	FHDFlashlightColorRandom
} FHDFlashlightColors;

@interface FHDViewController : UIViewController {
	FHDFlashlightColors currentColor;
	NSTimer *timer;
	FHDFlashController *flashController;
	UIButton *toggleFlashButton;
	BOOL isFlashOn;
}

@end

