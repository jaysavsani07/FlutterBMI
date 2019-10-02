package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.infideap.drawerbehavior.DrawerbehaviorPlugin;
import com.appleeducate.getversion.GetVersionPlugin;
import com.iyaffle.launchreview.LaunchReviewPlugin;
import io.flutter.plugins.packageinfo.PackageInfoPlugin;
import io.flutter.plugins.share.SharePlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    DrawerbehaviorPlugin.registerWith(registry.registrarFor("com.infideap.drawerbehavior.DrawerbehaviorPlugin"));
    GetVersionPlugin.registerWith(registry.registrarFor("com.appleeducate.getversion.GetVersionPlugin"));
    LaunchReviewPlugin.registerWith(registry.registrarFor("com.iyaffle.launchreview.LaunchReviewPlugin"));
    PackageInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.packageinfo.PackageInfoPlugin"));
    SharePlugin.registerWith(registry.registrarFor("io.flutter.plugins.share.SharePlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    UrlLauncherPlugin.registerWith(registry.registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
