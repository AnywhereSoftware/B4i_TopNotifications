//
//  iTopNotifications.m
//  iTopNotifications
//
//  Created by b4j on 06/02/2017.
//  Copyright © 2017 Anywhere Software. All rights reserved.
//

#import "iTopNotifications.h"
#import "LNRSimpleNotifications-Swift.h"

@implementation iTopNotifications
#define OBJ ((LNRNotificationManager *) self.object)
+ (Class)getClass {
    return [LNRNotificationManager class];
}
- (void) Initialize:(B4I*)bi :(NSString *)EventName {
    self.object = [[LNRNotificationManager alloc] init];
    [B4IObjectWrapper setBIAndEventName:OBJ :bi :EventName];
}
- (void) ShowNotification:(NSString *)Title :(NSString *)Body  :(int)Duration{
    LNRNotification *n = [[LNRNotification alloc] initWithTitle:Title body:Body
                                                       duration:Duration / 1000.0 onTap:^{
                [B4IObjectWrapper raiseUIEvent:OBJ :@"_click" :nil];
            } onTimeout:nil];
    [OBJ showNotificationWithNotification:n];
}

- (void)SetPosition:(BOOL)Top {
    [OBJ SetPositionWithTop:Top];
}

- (B4IBitmap *)Icon {
    return [B4IObjectWrapper createWrapper:[B4IBitmap new] object:OBJ.notificationsIcon];
}

- (void)setIcon:(B4IBitmap *)Icon {
    OBJ.notificationsIcon = Icon.object;
}

- (B4IFontWrapper *)BodyFont {
    return [B4IObjectWrapper createWrapper:[B4IFontWrapper new] object:OBJ.notificationsBodyFont];
}

- (void)setBodyFont:(B4IFontWrapper *)BodyFont {
    OBJ.notificationsBodyFont = BodyFont.object;
}

- (B4IFontWrapper *)TitleFont {
    return [B4IObjectWrapper createWrapper:[B4IFontWrapper new] object:OBJ.notificationsTitleFont];
}

- (int)BackgroundColor {
    return [[B4I shared] UIColorToColor:OBJ.notificationsBackgroundColor];
}

- (void)setBackgroundColor:(int)BackgroundColor {
    OBJ.notificationsBackgroundColor = [[B4I shared] ColorToUIColor:BackgroundColor];
}

- (int)BodyTextColor {
    return [[B4I shared] UIColorToColor:OBJ.notificationsBodyTextColor];
}

- (void)setBodyTextColor:(int)BodyTextColor {
   OBJ.notificationsBodyTextColor = [[B4I shared] ColorToUIColor:BodyTextColor];
}

- (int)TitleTextColor {
    return [[B4I shared] UIColorToColor:OBJ.notificationsTitleTextColor];
}

- (void)setTitleTextColor:(int)TitleTextColor {
    OBJ.notificationsTitleTextColor = [[B4I shared] ColorToUIColor:TitleTextColor];
}


- (void)setTitleFont:(B4IFontWrapper *)TitleFont {
    OBJ.notificationsTitleFont = TitleFont.object;
}


@end
