//
//  Flashlight_HDViewController.m
//  Flashlight HD
//
//  Created by Amudi Sebastian on 10/2/10.
//  Copyright 2010 amudi.org. All rights reserved.
//

#import "FHDViewController.h"

@interface FHDViewController (/*Private*/)

- (void)changeColor;
- (void)randomizeColor;
- (void)toogleFlash;

@end


@implementation FHDViewController

- (id)init {
	if ((self = [super init])) {
		currentColor = FHDFlashlightColorWhite;
		isFlashOn = NO;
		timer = [[NSTimer alloc] init];
		
		flashController = [[FHDFlashController alloc] init];
		if (flashController) {
			toggleFlashButton = [[UIButton alloc] initWithFrame:CGRectZero];
			[self.view addSubview:toggleFlashButton];
			[toggleFlashButton addTarget:self action:@selector(toogleFlash) forControlEvents:UIControlEventTouchUpInside];
		}
	}
	return self;
}

- (void)dealloc {
	[timer release];
	[flashController release];
	[toggleFlashButton release];
    [super dealloc];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	UIImage *buttonImage = [UIImage imageNamed:@"12-eye.png"];
	[toggleFlashButton setFrame:CGRectMake((CGRectGetMaxX(self.view.bounds) - buttonImage.size.width) / 2, 10.0f, buttonImage.size.width, buttonImage.size.height)];
	[toggleFlashButton setBackgroundColor:[UIColor clearColor]];
	[toggleFlashButton setImage:buttonImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	if (touch.tapCount >= 2) {
		[self changeColor];
	}
}

#pragma mark -
#pragma mark methods

- (void)changeColor {
	if (timer != nil) {
		[timer invalidate];
		timer = nil;
	}
	switch (currentColor) {
		case FHDFlashlightColorWhite:
			currentColor = FHDFlashlightColorBlue;
			self.view.backgroundColor = [UIColor colorWithRed:0.1261f green:0.6652f blue:0.7870f alpha:1.0f];
			break;
		case FHDFlashlightColorBlue:
			currentColor = FHDFlashlightColorGreen;
			self.view.backgroundColor = [UIColor colorWithRed:0.3870f green:0.6652f blue:0.0217f alpha:1.0f];
			break;
		case FHDFlashlightColorGreen:
			currentColor = FHDFlashlightColorRed;
			self.view.backgroundColor = [UIColor colorWithRed:0.8913f green:0.1174f blue:0.0826f alpha:1.0f];
			break;
		case FHDFlashlightColorRed:
			currentColor = FHDFlashlightColorPurple;
			self.view.backgroundColor = [UIColor colorWithRed:0.6043f green:0.5174f blue:0.7174f alpha:1.0f];
			break;
		case FHDFlashlightColorPurple:
			currentColor = FHDFlashlightColorRandom;
			[self randomizeColor];
			break;
		case FHDFlashlightColorRandom:
		default:
			currentColor = FHDFlashlightColorWhite;
			self.view.backgroundColor = [UIColor whiteColor];
			break;
	}
}

- (void)randomizeColor {
	float r = (float)rand() / RAND_MAX * 1.0f;
	float g = (float)rand() / RAND_MAX * 1.0f;
	float b = (float)rand() / RAND_MAX * 1.0f;
	self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];;
	timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(randomizeColor) userInfo:nil repeats:NO];
}

- (void)toogleFlash {
	if (flashController) {
		isFlashOn = !isFlashOn;
		[flashController toggle:isFlashOn];
	}
}


@end
