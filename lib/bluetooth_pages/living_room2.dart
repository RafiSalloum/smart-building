import 'package:flutter/material.dart';
import 'package:untitled3/shared/themes.dart';

class LivingRoom2 extends StatefulWidget {
  const LivingRoom2(
      {Key? key,
      required this.saloon2LedOn,
      required this.saloon2LedOff,
      required this.curtains2Open,
      required this.curtains2Close})
      : super(key: key);

  final Function saloon2LedOn;
  final Function curtains2Open;
  final Function saloon2LedOff;
  final Function curtains2Close;

  @override
  _LivingRoom2State createState() => _LivingRoom2State();
}

bool light0 = false;
bool light1 = false;

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

class _LivingRoom2State extends State<LivingRoom2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.light_outlined,
                      size: 120.0,
                    ),
                    Text(
                      'Saloon Light',
                      style: mainTheme().textTheme.displaySmall,
                    ),
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
                            light0
                                ? widget.saloon2LedOn()
                                : widget.saloon2LedOff();
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
                    const Icon(
                      Icons.curtains_outlined,
                      size: 120.0,
                    ),
                    Text(
                      'Curtains',
                      style: mainTheme().textTheme.displaySmall,
                    ),
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
                            light1
                                ? widget.curtains2Open()
                                : widget.curtains2Close();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
