//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <drawerbehavior/DrawerbehaviorPlugin.h>
#import <get_version/GetVersionPlugin.h>
#import <launch_review/LaunchReviewPlugin.h>
#import <package_info/PackageInfoPlugin.h>
#import <share/SharePlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>
#import <url_launcher/UrlLauncherPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [DrawerbehaviorPlugin registerWithRegistrar:[registry registrarForPlugin:@"DrawerbehaviorPlugin"]];
  [GetVersionPlugin registerWithRegistrar:[registry registrarForPlugin:@"GetVersionPlugin"]];
  [LaunchReviewPlugin registerWithRegistrar:[registry registrarForPlugin:@"LaunchReviewPlugin"]];
  [FLTPackageInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlugin"]];
  [FLTSharePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharePlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
}

@end
