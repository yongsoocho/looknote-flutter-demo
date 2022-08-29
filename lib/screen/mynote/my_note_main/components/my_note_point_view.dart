import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/config/routes/routes.dart';
import '../../../../app/constants/colors.dart';
import '../../../../app/di/service_locator.dart';
import '../../../../app/resource/resource.dart';
import '../../../../providers/looknote_providers.dart';
import '../../../../providers/my_note/my_note_provider.dart';

class MyNotePointView extends StatelessWidget {
  const MyNotePointView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final user = context.watch<AuthProvider>().userModel;
    final coinModel = context.watch<MyNoteProvider>().coinModel;

    return GestureDetector(
      onTap: () {
        serviceLocator<FirebaseAnalytics>().logEvent(
          name: 'click_more_coin_info',
          parameters: user?.toJson(),
        );
        Navigator.pushNamed(context, LookNoteRouteNames.myPointView);
      },
      child: Center(
        child: Container(
          width: screenWidth - 30,
          height: 62,
          decoration: const BoxDecoration(
            color: blue10,
          ),
          child: Row(children: [
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(blueStackedCoinIcon),
            size16,
            Text(
              '${coinModel.coin}',
              style: head1.copyWith(color: LookNoteColors.black[100])
            ),
            size8,
            Text(
              '달란트',
              style: body2.copyWith(color: LookNoteColors.black[100])
            ),
            const Spacer(),
            SvgPicture.asset(blueRightArrowIcon),
            size12,
          ]),
        ),
      ),
    );
  }
}
