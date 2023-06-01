import 'package:bmi_calculator/data/repository/local_repository.dart';
import 'package:bmi_calculator/extension/datetime_extension.dart';
import 'package:bmi_calculator/utility/app_util.dart';
import 'package:bmi_calculator/view/about/about.dart';
import 'package:bmi_calculator/view/common/size_transition.dart';
import 'package:bmi_calculator/view/dashboard/drawer_footer_view.dart';
import 'package:bmi_calculator/view/dashboard/drawer_header_view.dart';
import 'package:bmi_calculator/view/dashboard/theme_icon_button.dart';
import 'package:bmi_calculator/view/drawer/drawer_scaffold.dart';
import 'package:bmi_calculator/view/drawer/menu_screen.dart' as m;
import 'package:bmi_calculator/view/home/home_view.dart';
import 'package:bmi_calculator/view/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/common_alert_dialog.dart';
import '../common/rate_dialog.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      LocalRepository localRepository = context.read<LocalRepository>();

      await localRepository.increaseAppOpenCount();
      if (localRepository.getFirstTime()) {
        await localRepository.saveIsFirstTime();
        await localRepository.setFirstTimeDate();
      } else if (!localRepository.isRemindOrRated()) {
        DateTime dateTime = localRepository.getFirstTimeDate();
        if (DateTime.now()
                    .getDateOnly()
                    .difference(dateTime.getDateOnly())
                    .inDays >
                1 &&
            localRepository.getAppOpenCount() > 2) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CommonAlertDialog(child: RateDialog()),
          ).then((value) async {
            if (value != null) {
              if (value) {
                await localRepository.rated();
              } else {
                await localRepository.remindMeLater();
              }
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        primary: true,
        title: Text(
          'BMI CALCULATOR',
          textDirection: TextDirection.ltr,
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
            height: MediaQuery.of(context).size.height,
            child: ThemeIconButton(),
          )
        ],
      ),
      drawers: [
        m.SideDrawer(
          percentage: 0.8,
          menu: m.Menu(
            items: [
              m.MenuItem(id: 'home', title: 'Home'),
              m.MenuItem(id: 'setting', title: 'Settings'),
              m.MenuItem(id: 'aboutUs', title: 'About App'),
              m.MenuItem(id: 'share', title: 'Share App'),
              m.MenuItem(id: 'rateUs', title: 'Rate App'),
              m.MenuItem(id: 'feedback', title: 'Send Feedback')
            ],
          ),
          headerView: DrawerHeaderView(),
          footerView: DrawerFooterView(),
          animation: true,
          padding: EdgeInsets.fromLTRB(40.0, 16.0, 0.0, 10.0),
          color: Colors.black87,
          cornerRadius: 20,
          background: DecorationImage(
            image: AssetImage("Assets/Images/fitmen.jpg"),
            colorFilter: ColorFilter.mode(Colors.white54, BlendMode.dstOut),
            fit: BoxFit.cover,
          ),
          selectorColor: Color.fromRGBO(67, 193, 152, 1),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
            color: Colors.white70,
          ),
          selectedItemId: "home",
          onMenuItemSelected: (itemId) async {
            switch (itemId) {
              case 'home':
                break;
              case 'setting':
                Navigator.push(context, SizeRoute(page: SettingView()));
                break;
              case 'aboutUs':
                Navigator.push(context, SizeRoute(page: AboutUsView()));
                break;
              case 'share':
                AppUtil.onShareTap();
                break;
              case 'rateUs':
                LaunchReview.launch(
                  androidAppId: "com.nividata.bmi_calculator",
                  iOSAppId: "id1488893444",
                );
                break;
              case 'feedback':
                final Uri email = Uri(
                    scheme: "mailto",
                    path: "info@nividata.com",
                    query:
                        "${Uri.encodeComponent("subject")}=${Uri.encodeComponent("Feedback for BMI App")}");
                if (await canLaunchUrl(email)) {
                  await launchUrl(email);
                }
                break;
              default:
                break;
            }
          },
        ),
      ],
      builder: (context, id) => HomeView(),
    );
  }
}
