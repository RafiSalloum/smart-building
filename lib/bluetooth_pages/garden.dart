import 'package:flutter/material.dart';
import 'package:untitled3/shared/themes.dart';

class Garden extends StatefulWidget {
  const Garden({
    Key? key, required this.frontLedOn, required this.frontLedOff, required this.backLedOn,
    required this.backLedOff, required this.boolLedOn, required this.boolLedOff,
    required this.doorLedOn, required this.doorLedOff, required this.waterPumpOn, required this.waterPumpOff,
  }) : super(key: key);

  final Function frontLedOn;
  final Function frontLedOff;

  final Function backLedOn;
  final Function backLedOff;

  final Function boolLedOn;
  final Function boolLedOff;

  final Function doorLedOn;
  final Function doorLedOff;

  final Function waterPumpOn;
  final Function waterPumpOff;

  @override
  _GardenState createState() => _GardenState();
}

bool light0 = false;
bool light1 = false;
bool light2 = false;
bool light3 = false;
bool light4 = false;

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

class _GardenState extends State<Garden> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      const Icon(Icons.wb_twilight, size: 120.0,),
                      Text('Front Light', style: mainTheme().textTheme.displaySmall,),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            thumbIcon: thumbIcon,
                            value: light0,
                            onChanged: (bool value) {
                              setState(() {
                                light0 = value;
                              });
                              light0 ? widget.frontLedOn() : widget.frontLedOff();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      const Icon(Icons.wb_twilight, size: 120.0,),
                      Text('Bool Light', style: mainTheme().textTheme.displaySmall,),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            thumbIcon: thumbIcon,
                            value: light1,
                            onChanged: (bool value) {
                              setState(() {
                                light1 = value;
                              });
                              light1 ? widget.boolLedOn() : widget.boolLedOff();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      const Icon(Icons.water_drop_outlined, size: 120.0,),
                      Text('Water Pump', style: mainTheme().textTheme.displaySmall,),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            thumbIcon: thumbIcon,
                            value: light2,
                            onChanged: (bool value) {
                              setState(() {
                                light2 = value;
                              });
                              light2 ? widget.boolLedOn() : widget.boolLedOff();
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
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      const Icon(Icons.wb_twilight, size: 120.0,),
                      Text('Back Light', style: mainTheme().textTheme.displaySmall,),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            thumbIcon: thumbIcon,
                            value: light3,
                            onChanged: (bool value) {
                              setState(() {
                                light3 = value;
                              });
                              light3 ? widget.backLedOn() : widget.backLedOff();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      const Icon(Icons.light_outlined, size: 120.0,),
                      Text('Door Light', style: mainTheme().textTheme.displaySmall,),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            thumbIcon: thumbIcon,
                            value: light4,
                            onChanged: (bool value) {
                              setState(() {
                                light4 = value;
                              });
                              light4 ? widget.doorLedOn() : widget.doorLedOff();
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
    );
  }
}
