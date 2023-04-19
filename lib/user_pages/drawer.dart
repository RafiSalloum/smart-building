import 'package:flutter/material.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/shared/components.dart';
import 'package:untitled3/shared/themes.dart';
import 'package:untitled3/user_pages/login_screen.dart';
import 'package:untitled3/user_pages/test.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({Key? key, required this.fff}) : super(key: key);

  final Function fff;

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            buildHeader(context),
            buildItem(context),
          ],
        ),
      ),
    ),
  );
}

Widget buildHeader(BuildContext context) => Container(
  width: double.infinity,height: 160.0,
  color: mainColor,
  child: SafeArea(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 20,
          child: Icon(Icons.verified_user_rounded),
        ),
        const SizedBox(height: 10.0,),
        Text('Welcome, ${emailController.text}', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0, fontFamily: 'Mono'),),
      ],
    ),
  ),
);

Widget buildItem(BuildContext context) => Padding(
  padding: const EdgeInsets.all(24.0),
  child: Wrap(
    runSpacing: 12.0,
    children: [
      listTileBuilder(context, Icons.home_outlined, 'Saloon 1', const Test()),
      listTileBuilder(context, Icons.home_outlined, 'Saloon 2', const Test()),
      listTileBuilder(context, Icons.home_outlined, 'Room 1', const Test()),
      listTileBuilder(context, Icons.home_outlined, 'Room 2', const Test()),
      listTileBuilder(context, Icons.home_outlined, 'Kitchen', const Test()),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Logout', style: TextStyle(fontFamily: 'MonoB', fontSize: 16.0, color: Colors.black),),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
      ),
    ],
  ),
);
