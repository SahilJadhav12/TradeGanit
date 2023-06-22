import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trade_ganit/AdditionalDetails.dart';
import 'package:trade_ganit/BankDetail/BankDetail.dart';
import 'package:trade_ganit/Common/CommonTextField.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/Document/DocList.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';
import 'package:trade_ganit/FirstNomineeFromDetails.dart';
import 'package:trade_ganit/OtpVerify/OtpVerifyCode.dart';
import 'package:http/http.dart' as http;
import 'package:trade_ganit/PersonalDetails/personalDetails.dart';
import 'package:trade_ganit/ProofOfIdentifyAndAddress.dart';
import 'package:trade_ganit/TypeSelection/SelectionType.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PersonalDetail(),
      // home: const DocList(),
      // home: const MyHomePage(title: 'Trade Ganit'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController emailID = TextEditingController();
  void _navigateToPersonalDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OtpVerifyCode(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Trade Ganit',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              CommonTextField(
                controller: emailID,
                label: "Enter email",
                isEmail: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        sendOTP(emailID.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                  child: const Text('Send OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendOTP(String email) async {
    var url="https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/send-otp/login";
    var data={
      "email":email
    };
    var bodyy=json.encode(data);
    var urlParse=Uri.parse(url);
    http.Response response=await http.post(
        urlParse,
        body: bodyy,
        headers: {
          "Content-Type":"application/json",
        }
    );
    var dataa=jsonDecode(response.body);
    if(response.statusCode==200)
    {
      CommonValue.email=email;
      _navigateToPersonalDetail();
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(dataa['message'])),
      );
    }
    print(dataa);

    // Navigator.of(context).pop();

  }


}
