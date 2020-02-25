//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<drawerbehavior/DrawerbehaviorPlugin.h>)
#import <drawerbehavior/DrawerbehaviorPlugin.h>
#else
@import drawerbehavior;
#endif

#if __has_include(<get_version/GetVersionPlugin.h>)
#import <get_version/GetVersionPlugin.h>
#else
@import get_version;
#endif

#if __has_include(<launch_review/LaunchReviewPlugin.h>)
#import <launch_review/LaunchReviewPlugin.h>
#else
@import launch_review;
#endif

#if __has_include(<package_info/FLTPackageInfoPlugin.h>)
#import <package_info/FLTPackageInfoPlugin.h>
#else
@import package_info;
#endif

#if __has_include(<share/FLTSharePlugin.h>)
#import <share/FLTSharePlugin.h>
#else
@import share;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

#if __has_include(<url_launcher/FLTURLLauncherPlugin.h>)
#import <url_launcher/FLTURLLauncherPlugin.h>
#else
@import url_launcher;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [DrawerbehaviorPlugin registerWithRegistrar:[registry registrarForPlugin:@"DrawerbehaviorPlugin"]];
  [GetVersionPlugin registerWithRegistrar:[registry registrarForPlugin:@"GetVersionPlugin"]];
  [LaunchReviewPlugin registerWithRegistrar:[registry registrarForPlugin:@"LaunchReviewPlugin"]];
  [FLTPackageInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlugin"]];
  [FLTSharePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharePlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
}

@end
