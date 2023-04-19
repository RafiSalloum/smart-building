import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/shared/components.dart';
import 'package:untitled3/shared/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart';



class GeneralInfo extends StatefulWidget {
  const GeneralInfo({Key? key, required this.receiveMessage, required this.sendVReq, required this.receiving,
    required this.guardSysOn, required this.autoWindowOn, required this.guardSysOff, required this.autoWindowOff,
    required this.solarTrackOn, required this.irrigationSysOn, required this.solarTrackOff, required this.irrigationSysOff,
    required this.room1AutoTempOn, required this.room2AutoTempOn, required this.room1autoTempOff, required this.room2autoTempOff,
    required this.cameraOn, required this.cameraOff}) : super(key: key);

  final Function receiveMessage;
  final Function sendVReq;
  final Function receiving;

  final Function guardSysOn;                      final Function autoWindowOn;
  final Function guardSysOff;                     final Function autoWindowOff;

  final Function solarTrackOn;                    final Function irrigationSysOn;
  final Function solarTrackOff;                   final Function irrigationSysOff;

  final Function room1AutoTempOn;                 final Function room2AutoTempOn;
  final Function room1autoTempOff;                final Function room2autoTempOff;

  final Function cameraOn;
  final Function cameraOff;

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

bool light0 = false;
bool light1 = false;
bool light2 = false;
bool light3 = false;
bool light4 = false;
bool light5 = false;
bool light6 = false;

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

class _GeneralInfoState extends State<GeneralInfo> {

  Future rececec() async
  {
    await widget.sendVReq();
    dynamic message = await widget.receiveMessage();
    return message;
  }

  // dynamic message;
  Future<dynamic>? message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Auto Systems', style: mainTheme().textTheme.headlineLarge),
        const SizedBox(height: 25.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    children: [
                      const Icon(Icons.security, size: 100.0,),
                      Column(
                        children: [
                          Text('Auto Guard', style: mainTheme().textTheme.displaySmall,),
                          Text('System', style: mainTheme().textTheme.displaySmall,),
                        ],
                      ),
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
                              light0 ? widget.guardSysOn() : widget.guardSysOff();
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
                      const Icon(FontAwesomeIcons.temperatureLow, size: 100.0,),
                      Column(
                        children: [
                          Text('Room 1', style: mainTheme().textTheme.displaySmall,),
                          Text('Auto Temp', style: mainTheme().textTheme.displaySmall,),
                        ],
                      ),
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
                              light4 ? widget.room1AutoTempOn() : widget.room1autoTempOff();
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
                      const Icon(Icons.curtains_outlined, size: 100.0,),
                      Column(
                        children: [
                          Text('Auto Curtains', style: mainTheme().textTheme.displaySmall,),
                          Text('System', style: mainTheme().textTheme.displaySmall,),
                        ],
                      ),
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
                              light2 ? widget.autoWindowOn() : widget.autoWindowOff();
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
                      const Icon(Icons.water_drop_outlined, size: 100.0,),
                      Column(
                        children: [
                          Text('Auto Irrigation', style: mainTheme().textTheme.displaySmall,),
                          Text('System', style: mainTheme().textTheme.displaySmall,),
                        ],
                      ),
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
                              light3 ? widget.irrigationSysOn() : widget.irrigationSysOff();
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
                      const Icon(Icons.camera_alt_outlined, size: 100.0,),
                      Column(
                        children: [
                          Text('Monitoring', style: mainTheme().textTheme.displaySmall,),
                          Text('System', style: mainTheme().textTheme.displaySmall,),
                        ],
                      ),                    SizedBox(
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
                              light1 ? widget.cameraOn() : widget.cameraOff();
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
                      const Icon(FontAwesomeIcons.temperatureLow, size: 100.0,),
                      Column(
                        children: [
                          Text('Room 2', style: mainTheme().textTheme.displaySmall,),
                          Text('Auto Temp', style: mainTheme().textTheme.displaySmall,),
                        ],
                      ),                  SizedBox(
                        width: 80,
                        height: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            thumbIcon: thumbIcon,
                            value: light5,
                            onChanged: (bool value) {
                              setState(() {
                                light5 = value;
                              });
                              light5 ? widget.room2AutoTempOn() : widget.room2autoTempOff();
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
                      const Icon(Icons.solar_power_outlined, size: 100.0,),
                      Column(
                        children: [
                          Text('Auto Solar', style: mainTheme().textTheme.displaySmall,),
                          Text('Tracking', style: mainTheme().textTheme.displaySmall,),
                        ],
                      ),                    SizedBox(
                        width: 80,
                        height: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            thumbIcon: thumbIcon,
                            value: light6,
                            onChanged: (bool value) {
                              setState(() {
                                light6 = value;
                              });
                              light6 ? widget.solarTrackOn() : widget.solarTrackOff();
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
      ],
    );
  }
}
