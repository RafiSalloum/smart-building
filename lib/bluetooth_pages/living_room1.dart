import 'package:flutter/material.dart';
import 'package:untitled3/shared/themes.dart';

class LivingRoom1 extends StatefulWidget {
  const LivingRoom1(
      {Key? key,
      required this.saloon1LedOn,
      required this.saloon1LedOff,
      required this.curtains1Open,
      required this.curtains1Close,
      required this.doorOpen,
      required this.doorClose,
      required this.stairsLedOn,
      required this.stairsLedOff})
      : super(key: key);

  final Function saloon1LedOn;
  final Function curtains1Open;
  final Function saloon1LedOff;
  final Function curtains1Close;

  final Function doorOpen;
  final Function stairsLedOn;
  final Function doorClose;
  final Function stairsLedOff;


  @override
  _LivingRoom1State createState() => _LivingRoom1State();
}
bool light0 = false;
bool light1 = false;
bool light2 = false;
bool light3 = false;


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

class _LivingRoom1State extends State<LivingRoom1> {
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
                        Text('Saloon Light', style: mainTheme().textTheme.displaySmall,),
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
                                light0 ? widget.saloon1LedOn() : widget.saloon1LedOff();
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
                        const Icon(Icons.curtains_outlined, size: 120.0,),
                        Text('Curtains', style: mainTheme().textTheme.displaySmall,),
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
                                light1 ? widget.curtains1Open() : widget.curtains1Close();
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
                        const Icon(Icons.light_outlined, size: 120.0,),
                        Text('Stairs Light', style: mainTheme().textTheme.displaySmall,),
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
                                light2 ? widget.stairsLedOn() : widget.stairsLedOff();
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
                        const Icon(Icons.door_back_door_outlined, size: 120.0,),
                        Text('Door', style: mainTheme().textTheme.displaySmall,),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              activeColor: const Color(0xFF83AE9B),
                              thumbIcon: thumbIcon,
                              value: light3,
                              onChanged: (bool value) {
                                setState(() {
                                  light3 = value;
                                });
                                light3 ? widget.doorOpen() : widget.doorClose();
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

// Padding(
// padding: const EdgeInsets.all(14.0),
// child: Column(
// children: [
// Icon(
// Icons.light_outlined,
// size: 100.0,
// color: Colors.grey[700],
// ),
// const SizedBox(
// height: 15.0,
// ),
// const Text(
// 'Light',
// style: TextStyle(
// fontSize: 22.0,
// fontFamily: 'Mono',
// fontWeight: FontWeight.w900),
// ),
// const SizedBox(
// height: 15.0,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SizedBox(
// width: 80.0,
// height: 40.0,
// child: InkWell(
// onTap: () {
// widget.saloon1LedOn();
// },
// child: Container(
// decoration: BoxDecoration(
// color: Colors.green,
// shape: BoxShape.rectangle,
// borderRadius: BorderRadius.circular(12.0),
// ),
// child: const Center(
// child: Text(
// 'ON',
// style: TextStyle(
// fontFamily: 'Mono',
// fontWeight: FontWeight.w900,
// fontSize: 12.0),
// ),
// ),
// ),
// ),
// ),
// const SizedBox(
// width: 10.0,
// ),
// SizedBox(
// width: 80.0,
// height: 40.0,
// child: InkWell(
// onTap: () {
// widget.saloon1LedOff();
// },
// child: Container(
// decoration: BoxDecoration(
// color: Colors.red[700],
// shape: BoxShape.rectangle,
// borderRadius: BorderRadius.circular(12.0),
// ),
// child: const Center(
// child: Text(
// 'OFF',
// style: TextStyle(
// fontFamily: 'Mono',
// fontWeight: FontWeight.w900,
// fontSize: 12.0),
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
