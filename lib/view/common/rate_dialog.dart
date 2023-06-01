import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';

class RateDialog extends StatelessWidget {
  const RateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("Assets/Images/star.png"),
            filterQuality: FilterQuality.high,
            width: 100.0,
            height: 100.0,
          ),
          const SizedBox(height: 18),
          Text(
            "Rate BMI App",
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            "Tap a star to give your rating.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("Assets/Images/star_fill.png"),
                filterQuality: FilterQuality.high,
                width: 26,
                height: 26,
              ),
              SizedBox(width: 8),
              Image(
                image: AssetImage("Assets/Images/star_fill.png"),
                filterQuality: FilterQuality.high,
                width: 26,
                height: 26,
              ),
              SizedBox(width: 8),
              Image(
                image: AssetImage("Assets/Images/star_fill.png"),
                filterQuality: FilterQuality.high,
                width: 26,
                height: 26,
              ),
              SizedBox(width: 8),
              Image(
                image: AssetImage("Assets/Images/star_fill.png"),
                filterQuality: FilterQuality.high,
                width: 26,
                height: 26,
              ),
              SizedBox(width: 8),
              Image(
                image: AssetImage("Assets/Images/star_unfill.png"),
                filterQuality: FilterQuality.high,
                color: Theme.of(context).textTheme.titleSmall!.color,
                width: 26,
                height: 26,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 36,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).textTheme.titleSmall!.color!,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not Now",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.titleSmall!.color,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  LaunchReview.launch(
                    androidAppId: "com.nividata.bmi_calculator",
                    iOSAppId: "id1488893444",
                  );
                  Navigator.of(context).pop(false);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 36,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffe44e7a),
                          Color(0xffe56665),
                          Color(0xffe47e50),
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rate",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
