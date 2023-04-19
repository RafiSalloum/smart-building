import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/bluetooth_pages/bluetooth_enable.dart';
import 'package:untitled3/bluetooth_pages/send_message.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/shared/themes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text('LOGIN', style: mainTheme().textTheme.displayLarge),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text('Login to take control of your home',
                      style: mainTheme().textTheme.displayMedium),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      emailController.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {return 'Email Address can not be empty';}
                      else if(emailController.text != 'test@gmail.com'){return 'Wrong Email Address';}
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.email_outlined),
                      ),
                      hintText: 'Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      // labelText: 'Email Address',
                      hintStyle: mainTheme().textTheme.displayMedium,
                      // labelStyle: mainTheme().textTheme.displayMedium,
                      // prefixStyle: mainTheme().textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    onFieldSubmitted: (value) {
                      passwordController.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {return 'Password can not be empty';}
                      else if(passwordController.text != '123456'){return 'Wrong Password';}
                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.lock_outline),
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      hintStyle: mainTheme().textTheme.displayMedium,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    initialValue: null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 65.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          )),
                      onPressed: () {
                        getWeatherInfo();
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const BluetoothEnable(),
                            ),
                          );
                          final snackBar = SnackBar(
                            content: const Text('Login Successfully!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text('Login', style: mainTheme().textTheme.headlineSmall,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
