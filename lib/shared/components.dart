import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled3/shared/themes.dart';

BluetoothConnection? connection;

Widget controlBuilder(
    {required IconData icon,
    required String label,
    required Function oNPressed,
    required Function oFFPressed,
    required String firstButton,
    required String secButton}) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Column(
      children: [
        Icon(
          icon,
          size: 100.0,
          color: Colors.grey[700],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 22.0, fontFamily: 'Mono', fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80.0,
              height: 40.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.black),
                      )),
                  onPressed: () {
                    oNPressed;
                  },
                  child: Text(
                    firstButton,
                    style: const TextStyle(
                        fontFamily: 'Mono',
                        fontWeight: FontWeight.w900,
                        fontSize: 12.0),
                  )),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: 80.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  oFFPressed;
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black),
                    )),
                child: Text(
                  secButton,
                  style: const TextStyle(
                      fontFamily: 'Mono',
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget percentIndicator(double percent, IconData icon, String label,
    // String unit,
    {String color = 'b04f4f',
    double radius = 70.0}) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
      children: [
        CircularPercentIndicator(
          circularStrokeCap: CircularStrokeCap.butt,
          progressColor: HexColor("#$color"),
          radius: radius,
          animation: true,
          animationDuration: 3000,
          percent: percent,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(
                '${percent * 100} % ',
                // '$unit',
                style: const TextStyle(
                    fontFamily: 'Mono', fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: const TextStyle(
              fontFamily: 'Mono', fontWeight: FontWeight.w900, fontSize: 16.0),
        ),
      ],
    ),
  );
}

Widget listTileBuilder(
    BuildContext context, IconData icon, String label, Widget destination) {
  return ListTile(
    leading: Icon(icon),
    title: Text(
      label,
      style: const TextStyle(
          fontFamily: 'MonoB', fontSize: 16.0, color: Colors.black),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    },
  );
}

Widget control(
    {required IconData icon,
    required String label,
    required Function oNPressed,
    required Function oFFPressed,
    required String firstButton,
    required String secButton}) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Column(
      children: [
        Icon(
          icon,
          size: 100.0,
          color: Colors.grey[700],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 22.0,
              fontFamily: 'Mono',
              fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80.0,
              height: 40.0,
              child: InkWell(
                onTap: () {
                  oNPressed();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Text(
                      firstButton,
                      style: const TextStyle(
                          fontFamily: 'Mono',
                          fontWeight: FontWeight.w900,
                          fontSize: 12.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: 80.0,
              height: 40.0,
              child: InkWell(
                onTap: () {
                  oFFPressed();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Text(
                      secButton,
                      style: const TextStyle(
                          fontFamily: 'Mono',
                          fontWeight: FontWeight.w900,
                          fontSize: 12.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
