import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled3/shared/themes.dart';


class BedRoom2 extends StatefulWidget {
  const BedRoom2({Key? key, required this.room2LedOn,
    required this.heater2On, required this.room2LedOff, required this.heater2Off, required this.fan2On,
    required this.fan2Off}) : super(key: key);


  final Function room2LedOn;                    final Function heater2On;
  final Function room2LedOff;                   final Function heater2Off;

  final Function fan2On;
  final Function fan2Off;

  @override
  _BedRoom2State createState() => _BedRoom2State();
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

class _BedRoom2State extends State<BedRoom2> {
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
                                light0 ? widget.room2LedOn() : widget.room2LedOff();
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
                                light1 ? widget.fan2On() : widget.fan2Off();
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
                                light2 ? widget.heater2On() : widget.heater2Off();
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
