import 'package:flutter/material.dart';
import 'package:untitled3/shared/themes.dart';


class Garage extends StatefulWidget {
  const Garage({Key? key, required this.parkingLedOn , required this.parkingLedOff, required this.outsideLedOn,
    required this.outsideLedOff, required this.parkingOpen, required this.parkingClose}) : super(key: key);

  final Function parkingLedOn;
  final Function parkingLedOff;

  final Function outsideLedOn;
  final Function outsideLedOff;

  final Function parkingOpen;
  final Function parkingClose;

  @override
  _GarageState createState() => _GarageState();
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

class _GarageState extends State<Garage> {
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
                      const Icon(Icons.light_outlined, size: 120.0,),
                      Text('Parking Light', style: mainTheme().textTheme.displaySmall,),
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
                              light0 ? widget.parkingLedOn() : widget.parkingLedOff();
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
                      const Icon(Icons.garage_outlined, size: 120.0,),
                      Text('Garage Door', style: mainTheme().textTheme.displaySmall,),
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
                              light1 ? widget.parkingOpen() : widget.parkingClose();
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
                      const Icon(Icons.light_outlined, size: 120.0,),
                      Text('Out Light', style: mainTheme().textTheme.displaySmall,),
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
                              light2 ? widget.outsideLedOn() : widget.outsideLedOff();
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
