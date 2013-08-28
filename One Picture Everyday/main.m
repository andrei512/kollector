//
//  main.m
//  One Picture Everyday
//
//  Created by Andrei on 8/21/13.
//  Copyright (c) 2013 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import <PXEngine/PXEngine.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [PXEngine licenseKey:@"8NUNJ-9ONND-58CO7-NJD8U-4UV4L-VJEVK-RH0AC-OART6-BS84L-V23AJ-MMKD7-IJC94-LTQ5J-OHK4N-18332-UK"
                     forUser:@"andrei.puni@yardi.com"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
