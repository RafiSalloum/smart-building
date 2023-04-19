import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled3/shared/themes.dart';


class BedRoom1 extends StatefulWidget {
  const BedRoom1({Key? key, required this.room1LedOn, required this.heater1On, required this.room1LedOff,
    required this.heater1Off, required this.fan1On, required this.fan1Off}) : super(key: key);

  final Function room1LedOn;                    final Function heater1On;
  final Function room1LedOff;                   final Function heater1Off;

  final Function fan1On;
  final Function fan1Off;

  @override
  _BedRoom1State createState() => _BedRoom1State();
}

bool light0 = false;
bool light1 = false;
bool light2 = false;

final MaterialStateProperty<Icon?> thumbIcon =
MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
    // Thumb icon when the switch is selected.
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  },
);

class _BedRoom1State extends State<BedRoom1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      children: [
                        const Icon(Icons.light_outlined, size: 120.0,),
                        Text('Room Light', style: mainTheme().textTheme.displaySmall,),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              activeColor: const Color(0xFF83AE9B),
                              thumbIcon: thumbIcon,
                              value: light0,
                              onChanged: (bool value) {
                                setState(() {
                                  light0 = value;
                                });
                                light0 ? widget.room1LedOn() : widget.room1LedOff();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      children: [
                        const Icon(FontAwesomeIcons.fan, size: 120.0,),
                        Text('Fan', style: mainTheme().textTheme.displaySmall,),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              activeColor: const Color(0xFF83AE9B),
                              thumbIcon: thumbIcon,
                              value: light1,
                              onChanged: (bool value) {
                                setState(() {
                                  light1 = value;
                                });
                                light1 ? widget.fan1On() : widget.fan1Off();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      children: [
                        const Icon(Icons.heat_pump_outlined, size: 120.0,),
                        Text('Heater', style: mainTheme().textTheme.displaySmall,),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              activeColor: const Color(0xFF83AE9B),
                              thumbIcon: thumbIcon,
                              value: light2,
                              onChanged: (bool value) {
                                setState(() {
                                  light2 = value;
                                });
                                light2 ? widget.heater1On() : widget.heater1Off();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
