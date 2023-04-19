library send_messagee;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:location/location.dart';
import 'package:untitled3/bluetooth_pages/bed_room1.dart';
import 'package:untitled3/bluetooth_pages/bed_room2.dart';
import 'package:untitled3/bluetooth_pages/living_room1.dart';
import 'package:untitled3/bluetooth_pages/kitchen.dart';
import 'package:untitled3/bluetooth_pages/garden.dart';
import 'package:untitled3/bluetooth_pages/garage.dart';
import 'package:untitled3/bluetooth_pages/living_room2.dart';
import 'package:untitled3/bluetooth_pages/general_info.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/shared/components.dart';
import 'package:untitled3/shared/themes.dart';
import 'package:untitled3/user_pages/drawer.dart';
import 'package:untitled3/user_pages/login_screen.dart';
import 'package:untitled3/weather_pages/data_services.dart';
import 'package:untitled3/weather_pages/model.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice? server;
  const ChatPage({Key? key, this.server, this.lcdMessage}) : super(key: key);
  final String? lcdMessage;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  BluetoothConnection? connection;

  final ScrollController listScrollController = ScrollController();

  bool isConnecting = true;

  bool get isConnected => connection != null && connection!.isConnected;

  bool isDisconnecting = false;

  @override
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    BluetoothConnection.toAddress(widget.server!.address).then((_connection) {
      print('Connected to Device');
      connection = _connection;

      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
    });
  }

  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
      mineController.close();
    }
    super.dispose();
  }

  bool btnColor = false;

  StreamController<String> mineController =
      StreamController<String>.broadcast();
  Stream<String> myStream() async* {
    connection?.input?.listen((Uint8List data) {
      print(ascii.decode(data));

      mineController.add(ascii.decode(data));
    });
  }

  Widget build(BuildContext context) {
    String denemee = "No Data";
    TextEditingController lcdController = TextEditingController();
    mineController.addStream(myStream());

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: mainTheme().textTheme.titleLarge),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 160.0,
                  color: mainColor,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.verified_user_rounded),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Welcome, ${emailController.text}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                              fontFamily: 'Mono'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Wrap(
                    runSpacing: 12.0,
                    children: [
                      listTileBuilder(
                        context,
                        Icons.chair_outlined,
                        'Saloon 1',
                        LivingRoom1(
                          saloon1LedOn: () => _sendMessage('x4'),
                          saloon1LedOff: () => _sendMessage('x24'),
                          curtains1Open: () => _sendMessage('5'),
                          curtains1Close: () => _sendMessage('1'),
                          doorOpen: () => _sendMessage('7'),
                          doorClose: () => _sendMessage('3'),
                          stairsLedOn: () => _sendMessage('x6'),
                          stairsLedOff: () => _sendMessage('x26'),
                        ),
                      ),
                      listTileBuilder(
                        context,
                        Icons.chair_outlined,
                        'Saloon 2',
                        LivingRoom2(
                          saloon2LedOn: () => _sendMessage('x5'),
                          saloon2LedOff: () => _sendMessage('x25'),
                          curtains2Open: () => _sendMessage('6'),
                          curtains2Close: () => _sendMessage('2'),
                        ),
                      ),
                      listTileBuilder(
                        context,
                        Icons.bed,
                        'Room 1',
                        BedRoom1(
                          room1LedOn: () => _sendMessage('x1'),
                          room1LedOff: () => _sendMessage('x21'),
                          heater1On: () => _sendMessage('x10'),
                          heater1Off: () => _sendMessage('x30'),
                          fan1On: () => _sendMessage('x9'),
                          fan1Off: () => _sendMessage('x29'),
                        ),
                      ),
                      listTileBuilder(
                        context,
                        Icons.bed,
                        'Room 2',
                        BedRoom2(
                          room2LedOn: () => _sendMessage('x2'),
                          room2LedOff: () => _sendMessage('x22'),
                          heater2On: () => _sendMessage('x11'),
                          heater2Off: () => _sendMessage('x31'),
                          fan2On: () => _sendMessage('x12'),
                          fan2Off: () => _sendMessage('x32'),
                        ),
                      ),
                      listTileBuilder(
                        context,
                        Icons.kitchen,
                        'Kitchen',
                        Kitchen(
                          kitchenLedOn: () => _sendMessage('x3'),
                          kitchenLedOff: () => _sendMessage('x23'),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                              fontFamily: 'MonoB',
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 170.0,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                            child: Text('By: Rafi', style: TextStyle(fontSize: 10.0, fontFamily: 'Mono', fontWeight: FontWeight.w600),)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              physics: const ClampingScrollPhysics(),
              elevation: 3.0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                color: Color(0xFFC2DBB3),
                // gradient: LinearGradient(
                //   colors: <Color>[
                //     Color(0xFF0D47A1),
                //     Color(0xFF1976D2),
                //     Color(0xFF42A5F5),
                //   ],
                // ),
              ),
              unselectedLabelStyle: mainTheme().textTheme.headlineMedium,
              labelStyle: mainTheme().textTheme.headlineSmall,
              height: 68,
              tabs: const [
                Tab(
                  text: "General",
                  icon: Icon(Icons.info_outline),
                ),
                Tab(
                  text: "House",
                  icon: Icon(Icons.home_outlined),
                ),
                Tab(
                  text: "Garden",
                  icon: Icon(Icons.nature_people_outlined),
                ),
                Tab(
                  text: "Garage",
                  icon: Icon(Icons.garage_outlined),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ConditionalBuilder(
                            condition: icon != null,
                            builder: (context) => weatherInfoPage(),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          const SizedBox(
                              width: 300, child: Divider(thickness: 1.5)),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GeneralInfo(
                              guardSysOn: () => _sendMessage('G'),
                              guardSysOff: () => _sendMessage('g'),
                              autoWindowOn: () => _sendMessage('W'),
                              autoWindowOff: () => _sendMessage('w'),
                              solarTrackOn: () => _sendMessage('S'),
                              solarTrackOff: () => _sendMessage('s'),
                              irrigationSysOn: () => _sendMessage('I'),
                              irrigationSysOff: () => _sendMessage('i'),
                              room1AutoTempOn: () => _sendMessage('A'),
                              room1autoTempOff: () => _sendMessage('a'),
                              room2AutoTempOn: () => _sendMessage('B'),
                              room2autoTempOff: () => _sendMessage('b'),
                              cameraOn: () => _sendMessage('F'),
                              cameraOff: () => _sendMessage('f'),
                              receiveMessage: () => receiveMessage(),
                              sendVReq: () => _sendMessage('H'),
                              receiving: () => reerere(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DefaultTabController(
                    length: 5,
                    child: Column(
                      children: <Widget>[
                        ButtonsTabBar(
                          elevation: 3.0,
                          radius: 30.0,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFC2DBB3),
                            // gradient: LinearGradient(
                            //   colors: <Color>[
                            //     Color(0xFFA62129),
                            //     Color(0xFFc53f3f),
                            //   ],
                            // ),
                          ),
                          unselectedLabelStyle:
                              mainTheme().textTheme.headlineMedium,
                          labelStyle: mainTheme().textTheme.headlineSmall,
                          height: 56,
                          tabs: const [
                            Tab(
                              text: "Living Room 1",
                              icon: Icon(Icons.chair_outlined),
                            ),
                            Tab(
                              text: "Living Room 2",
                              icon: Icon(Icons.chair_outlined),
                            ),
                            Tab(
                              text: "Bed Room 1",
                              icon: Icon(Icons.bed),
                            ),
                            Tab(
                              text: "Bed Room 2",
                              icon: Icon(Icons.bed),
                            ),
                            Tab(
                              text: "Kitchen",
                              icon: Icon(Icons.kitchen),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: LivingRoom1(
                                  saloon1LedOn: () => _sendMessage('x4'),
                                  saloon1LedOff: () => _sendMessage('x24'),
                                  curtains1Open: () => _sendMessage('5'),
                                  curtains1Close: () => _sendMessage('1'),
                                  doorOpen: () => _sendMessage('7'),
                                  doorClose: () => _sendMessage('3'),
                                  stairsLedOn: () => _sendMessage('x6'),
                                  stairsLedOff: () => _sendMessage('x26'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: LivingRoom2(
                                  saloon2LedOn: () => _sendMessage('x5'),
                                  saloon2LedOff: () => _sendMessage('x25'),
                                  curtains2Open: () => _sendMessage('6'),
                                  curtains2Close: () => _sendMessage('2'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: BedRoom1(
                                  room1LedOn: () => _sendMessage('x1'),
                                  room1LedOff: () => _sendMessage('x21'),
                                  heater1On: () => _sendMessage('x10'),
                                  heater1Off: () => _sendMessage('x30'),
                                  fan1On: () => _sendMessage('x9'),
                                  fan1Off: () => _sendMessage('x29'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: BedRoom2(
                                  room2LedOn: () => _sendMessage('x2'),
                                  room2LedOff: () => _sendMessage('x22'),
                                  heater2On: () => _sendMessage('x11'),
                                  heater2Off: () => _sendMessage('x31'),
                                  fan2On: () => _sendMessage('x12'),
                                  fan2Off: () => _sendMessage('x32'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Kitchen(
                                  kitchenLedOn: () => _sendMessage('x3'),
                                  kitchenLedOff: () => _sendMessage('x23'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Garden(
                      frontLedOn: () => _sendMessage('x15'),
                      frontLedOff: () => _sendMessage('x35'),
                      backLedOn: () => _sendMessage('x16'),
                      backLedOff: () => _sendMessage('x36'),
                      boolLedOn: () => _sendMessage('x8'),
                      boolLedOff: () => _sendMessage('x28'),
                      doorLedOn: () => _sendMessage('x14'),
                      doorLedOff: () => _sendMessage('x34'),
                      waterPumpOn: () => _sendMessage('x13'),
                      waterPumpOff: () => _sendMessage('x33'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Garage(
                      parkingLedOn: () => _sendMessage('x7'),
                      parkingLedOff: () => _sendMessage('x27'),
                      outsideLedOn: () => _sendMessage('x17'),
                      outsideLedOff: () => _sendMessage('x37'),
                      parkingOpen: () => _sendMessage('8'),
                      parkingClose: () => _sendMessage('4'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendMessage(String text) async {
    text = text.trim();

    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state
      }
    }
  }

  receiveMessage() async {
    connection!.input!.listen((Uint8List data) {
      print('Data incoming: ${ascii.decode(data)}');
      void deneme = ascii.decode(data);

      return deneme;
    });
  }

  Future<String> reerere() {
    dynamic rere = receiveMessage();
    print(rere);
    return rere;
  }
}

late String lat;
late String lon;
final dataService = DataService();

String? icon;
String? cityName;
String? weatherStatus;
int? temp;

void getWeatherInfo() async {
  search().then((value) {
    icon = value.iconUrl;
    cityName = value.cityName;
    weatherStatus = value.weatherInfo.description;
    temp = value.tempInfo.temperature.round();
  });
}

Future<WeatherResponse> search() async {
  await getCurrentLocation().then((value) {
    lat = '${value?.latitude}';
    lon = '${value?.longitude}';
  });

  final response = await dataService.getWeather(lat, lon);
  return response;
}

Future<LocationData?> getCurrentLocation() async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return Future.error('Location Services Disabled');
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return Future.error('Location Permission are Denied');
    }
  }

  locationData = await location.getLocation();

  location.onLocationChanged.listen((LocationData currentLocation) {
    locationData = currentLocation;
  });

  return locationData;
}

Widget weatherInfoPage()
{
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            children: [
              Image.network(
                icon!,
                width: 160.0,
                height: 160.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cityName!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: 'Mono',
                    fontWeight: FontWeight.w900,
                    fontSize: 34.0),
              ),
              Text(
                '$temp°',
                style: const TextStyle(
                    fontFamily: 'Mono',
                    fontWeight: FontWeight.w900,
                    fontSize: 27.0),
              ),
              Text(
                weatherStatus!,
                style: const TextStyle(
                    fontFamily: 'Mono',
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}