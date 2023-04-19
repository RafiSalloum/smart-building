import 'package:flutter/material.dart';
import 'package:untitled3/shared/themes.dart';


class Kitchen extends StatefulWidget {
  const Kitchen({Key? key, required this.kitchenLedOn, required this.kitchenLedOff}) : super(key: key);

  final Function kitchenLedOn;
  final Function kitchenLedOff;

  @override
  _KitchenState createState() => _KitchenState();
}

bool light0 = false;

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

class _KitchenState extends State<Kitchen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.light_outlined, size: 120.0,),
            Text('Kitchen Light', style: mainTheme().textTheme.displaySmall,),
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
                    light0 ? widget.kitchenLedOn() : widget.kitchenLedOff();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
