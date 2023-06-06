import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trade_ganit/Common/CommonTextField.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/TypeSelection/SelectionType.dart';
import 'package:http/http.dart' as http;

class OtpVerifyCode extends StatefulWidget {
  const OtpVerifyCode({Key? key}) : super(key: key);

  @override
  State<OtpVerifyCode> createState() => _OtpVerifyCodeState();
}

class _OtpVerifyCodeState extends State<OtpVerifyCode> {

  TextEditingController box1=TextEditingController();
  TextEditingController box2=TextEditingController();
  TextEditingController box3=TextEditingController();
  TextEditingController box4=TextEditingController();
  TextEditingController box5=TextEditingController();
  TextEditingController box6=TextEditingController();

  void _navigateToPersonalDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SelectionType(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Container(
        child: Column(
          children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child:TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        controller: box1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child:TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        controller: box2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child:TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        controller: box3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child:TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        controller: box4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child:TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        controller: box5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 68,
                      width: 64,
                      child:TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        controller: box6,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  if(box1.text==""||box2.text==""||box3.text==""||box4.text==""||box5.text==""||box6.text=="")
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter valid OTP"),),
                      );
                    }
                  else {
                      String otp = box1.text + box2.text + box3.text + box4.text +
                          box5.text + box6.text;
                      verifyOTP(otp);
                  }
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                child: const Text('Verify OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> verifyOTP(String otp) async {
    var url="https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/login-otp/verify";
    var data={
      "email":"akap@infimatrix.com",
      "otp":otp,
    };
    var bodyy=json.encode(data);
    var urlParse=Uri.parse(url);
    print(bodyy);
    print(data);
    http.Response response=await http.post(
        urlParse,
        body: bodyy,
        headers: {
          "Content-Type":"application/json",
          "Accept":"*/*",
        }
    );
    var dataa=jsonDecode(response.body);
    if(response.statusCode==401)
    {
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
