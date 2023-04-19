import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:untitled3/bluetooth_pages/connection.dart';
import 'package:untitled3/bluetooth_pages/send_message.dart';
import 'package:untitled3/shared/themes.dart';

class BluetoothEnable extends StatelessWidget {
  const BluetoothEnable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FlutterBluetoothSerial.instance.requestEnable(),
      builder: (BuildContext context, future) {
        if (future.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: SizedBox(
              height: double.infinity,
              child: Center(
                child: Icon(
                  Icons.bluetooth_disabled,
                  size: 200,
                  color: Colors.black,
                ),
              ),
            ),
          );
        } else {
          return const Home();
        }
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Connectable Devices', style: mainTheme().textTheme.titleLarge,),
          ),
          body: SelectBondedDevicePage(
            onCahtPage: (device1) {
              BluetoothDevice device = device1;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatPage(
                  server: device,
                );
              }));
            },
          ),
        ));
  }
}
