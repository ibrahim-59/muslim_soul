import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran_app/core/functions/convert_numbers.dart';
import 'package:svg_flutter/svg.dart';

class HijriDate extends StatelessWidget {
  const HijriDate({super.key});

  @override
  Widget build(BuildContext context) {
    var today = HijriCalendar.now();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.width / 2.3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 100,
                width: 260,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
              ),
              SvgPicture.asset('assets/svg/hijri/${today.hMonth}.svg',
                  height: 90,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor, BlendMode.srcIn)),
              Transform.translate(
                offset: const Offset(110, -55),
                child: Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    convertNumbers('${today.hDay}'),
                    style: const TextStyle(
                        fontSize: 26.0,
                        fontFamily: 'kufi',
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-80, 55),
                child: Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    convertNumbers('${today.hYear} هـ'),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'kufi',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
