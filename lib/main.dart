import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Otp Text Field'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: OtpTextField(
          numberOfFields: 4,
          //set to true to show as box or false to show as dash
          showFieldAsBox: false,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          }, //
        ),
      ),
    );
  }
}
