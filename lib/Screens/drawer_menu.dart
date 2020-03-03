import 'package:bmi_calculator/Global%20Variables/globals.dart';
import 'package:bmi_calculator/Screens/about.dart';
import 'package:bmi_calculator/Screens/bmi_main.dart';
import 'package:bmi_calculator/Screens/settings.dart';
import 'package:bmi_calculator/Utilities/app_util.dart';
import 'package:bmi_calculator/Utilities/my_theme_keys.dart';
import 'package:bmi_calculator/Utilities/shared_preference_handler.dart';
import 'package:bmi_calculator/Utilities/theme_handler.dart';
import 'package:bmi_calculator/animations/size_transition.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:drawerbehavior/drawer_scaffold.dart';
import 'package:drawerbehavior/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  void getTheme() async {
    var key =
        await SharedPreference.getStringValue(SharedPreference.selectedTheme);
    switch (key) {
      case "MyThemeKeys.LIGHT":
        isDarkTheme = false;
        themeIcon = Icon(FontAwesomeIcons.solidMoon, color: Colors.black38);
        break;
      case "MyThemeKeys.DARKER":
        isDarkTheme = true;
        themeIcon = Icon(FontAwesomeIcons.solidSun);
        break;
      default:
        isDarkTheme = false;
        themeIcon = Icon(FontAwesomeIcons.solidMoon, color: Colors.black38);
        break;
    }
  }

  final menu = new Menu(
    items: [
      new MenuItem(id: 'home', title: 'Home'),
      new MenuItem(id: 'setting', title: 'Settings'),
      new MenuItem(id: 'aboutapp', title: 'About App'),
      new MenuItem(id: 'share', title: 'Share App'),
      new MenuItem(id: 'rateus', title: 'Rate App'),
      new MenuItem(id: 'feedback', title: 'Send Feedback')
    ],
  );

  var selectedMenuItemId = 'home';
  var _widget = Text("1");

  Widget headerView(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Image(
              image: AssetImage("Assets/Images/ic_launcher.png"),
              filterQuality: FilterQuality.high,
              width: 100.0,
              height: 100.0),
          Text("  BMI.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget footerView(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Built with  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                FontAwesomeIcons.solidHeart,
                color: Colors.red,
                size: 10,
              ),
              Text(
                "  By",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Text(""),
          GestureDetector(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage("Assets/Images/icon.png")),
                Text("  NiviData\n  Consultancy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold))
              ],
            ),
            onTap: () {
              _launchURL();
            },
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://nividata.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    selectedMenuItemId = 'home';
  }

  @override
  Widget build(BuildContext context) {
    selectedMenuItemId = 'home';
    getTheme();
    return new DrawerScaffold(
      percentage: .8,
      cornerRadius: 20,
      showAppBar: true,
      appBar: AppBarProps(
          automaticallyImplyLeading: true,
          primary: true,
          backgroundColor: Theme.of(context).primaryColorDark,
          elevation: 1.0,
          centerTitle: true,
          title: Text('BMI CALCULATOR',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900)),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              height: MediaQuery.of(context).size.height,
              child: IconButton(
                icon: themeIcon != null
                    ? themeIcon
                    : new Icon(
                        FontAwesomeIcons.solidMoon,
                        color: Colors.transparent,
                      ),
                onPressed: () {
                  setState(() {
                    if (isDarkTheme) {
                      isDarkTheme = false;
                      themeLabel = "Light Mode";
                      themeIcon = Icon(FontAwesomeIcons.solidMoon,
                          color: Colors.black38);
                      _changeTheme(context, MyThemeKeys.LIGHT);
                      SharedPreference.setStringValue(
                          SharedPreference.selectedTheme,
                          MyThemeKeys.LIGHT.toString());
                    } else {
                      isDarkTheme = true;
                      themeLabel = "Dark Mode";
                      themeIcon = Icon(FontAwesomeIcons.solidSun);
                      _changeTheme(context, MyThemeKeys.DARKER);
                      SharedPreference.setStringValue(
                          SharedPreference.selectedTheme,
                          MyThemeKeys.DARKER.toString());
                    }
                  });
                },
              ),
            )
          ]),
      menuView: new MenuView(
        menu: menu,
        headerView: headerView(context),
        footerView: footerView(context),
        animation: true,
        padding: EdgeInsets.fromLTRB(40.0, 16.0, 0.0, 10.0),
        color: Colors.black87,
        background: DecorationImage(
            image: AssetImage("Assets/Images/fitmen.jpg"),
            colorFilter: ColorFilter.mode(Colors.white54, BlendMode.dstOut),
            fit: BoxFit.cover),
        selectorColor: Color.fromRGBO(67, 193, 152, 1),
        textStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.white70),
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          switch (itemId) {
            case 'home':
              setState(() => _widget = Text("1"));
              break;
            case 'setting':
              initMeasurementUnit();
              Navigator.push(context, SizeRoute(page: Settings()));
              setState(() => _widget = Text("default"));
              break;
            case 'aboutapp':
              Navigator.push(context, SizeRoute(page: AboutUS()));
              setState(() => _widget = Text("default"));
              break;
            case 'share':
              AppUtil.onShareTap(context);
              setState(() => _widget = Text("default"));
              break;
            case 'rateus':
              LaunchReview.launch(
                  androidAppId: "com.nividata.bmi_calculator",
                  iOSAppId: "id1488893444");
              setState(() => _widget = Text("default"));
              break;
            case 'feedback':
              var emailUrl = mailTo;
              var out = Uri.encodeFull(emailUrl);
              launchURL(out);
              setState(() => _widget = Text("default"));
              break;
            default:
              setState(() => _widget = Text("default"));
              break;
          }
        },
      ),
      contentView: Screen(
        contentBuilder: (context) => Center(child: BMIMain()),
        color: Colors.white,
      ),
    );
  }

  void initMeasurementUnit() {
    // selectedChoice = SharedPreference.getStringValue(SharedPreference.selectedMUnit)??"";
    print(
        "chip ${SharedPreference.getStringValue(SharedPreference.selectedMUnit)}");
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
