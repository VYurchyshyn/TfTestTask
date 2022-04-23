import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_kit/ui_kit.dart';
import '../screen_item/health_balance_widget_item_text.dart';

class HealthBalanceWidget extends StatelessWidget {
  final int? body;
  final int? mind;
  final int? spirit;

  HealthBalanceWidget({this.body, this.mind, this.spirit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(top: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColorScheme.colorBlack2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BalanceCircle(
                  '${HealthBalanceWidgetItemText.body} $body%',
                  AppColorScheme.colorYellow3,
                ),
                _BalanceCircle('${HealthBalanceWidgetItemText.mind} $mind%',
                    AppColorScheme.colorPurple3),
                _BalanceCircle('${HealthBalanceWidgetItemText.spirit} $spirit%',
                    AppColorScheme.colorBlue2),
              ],
            ),
          ),
          const SizedBox(height: 7),
          Expanded(
            child: Row(
              children: [
                if (body != 0)
                  Container(
                    height: 15,
                    width:
                        MediaQuery.of(context).size.width * body! / 100 * 0.75,
                    decoration: BoxDecoration(
                        color: AppColorScheme.colorYellow3,
                        borderRadius: body != 100
                            ? BorderRadius.circular(10)
                            : BorderRadius.circular(10)),
                  ),
                if (mind != 0)
                  Container(
                    height: 15,
                    width:
                        MediaQuery.of(context).size.width * mind! / 100 * 0.75,
                    decoration: BoxDecoration(
                        color: AppColorScheme.colorPurple2,
                        borderRadius: mind != 100
                            ? BorderRadius.circular(10)
                            : BorderRadius.circular(10)),
                  ),
                if (spirit != 0)
                  Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width *
                        spirit! /
                        100 *
                        0.75,
                    decoration: BoxDecoration(
                        color: AppColorScheme.colorBlue4,
                        borderRadius: spirit != 100
                            ? BorderRadius.circular(10)
                            : BorderRadius.circular(10)),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _BalanceCircle(String designation, Color circleColor) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: BorderRadius.circular(25),
          ),
          width: 9,
          height: 9,
        ),
        SizedBox(width: 9),
        Text(
          designation,
          style: textRegular16,
        ),
      ],
    );
  }
}
