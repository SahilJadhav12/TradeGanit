import 'dart:convert';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/Common/CommonTextField.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/Common/ImagePath.dart';
import 'package:http/http.dart' as http;
import 'package:trade_ganit/TypeSelection/SelectionType.dart';

class AdditionalDetails extends StatefulWidget {
  const AdditionalDetails({Key? key}) : super(key: key);

  @override
  State<AdditionalDetails> createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
  TextEditingController UCCController=TextEditingController();
  TextEditingController dpNumberController=TextEditingController();
  TextEditingController portfolioSizeController=TextEditingController();
  TextEditingController referenceMediumController=TextEditingController();
  TextEditingController referenceDescriptionController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    UCCController.text=CommonValue.ucc;
    dpNumberController.text=CommonValue.dpNumber;
    portfolioSizeController.text=CommonValue.portfolioSize;
    referenceMediumController.text=CommonValue.referenceMedium;
    referenceDescriptionController.text=CommonValue.referenceDescription;
    super.initState();
  }
  int activeStep = 4;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Details'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: EasyStepper(
                    activeStep: activeStep,
                    lineLength: 70,
                    lineSpace: 0,
                    lineType: LineType.normal,
                    defaultLineColor: Colors.white,
                    finishedLineColor: Colors.blue,
                    activeStepTextColor: Colors.black87,
                    finishedStepTextColor: Colors.black87,
                    internalPadding: 0,
                    showLoadingAnimation: false,
                    stepRadius: 8,
                    showStepBorder: false,
                    lineDotRadius: 1.5,
                    steps: [
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                            activeStep >= 0 ? Colors.blue : Colors.white,
                          ),
                        ),
                        title: 'Personal',
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                            activeStep >= 1 ? Colors.blue : Colors.white,
                          ),
                        ),
                        title: 'Bank',
                        topTitle: true,
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                            activeStep >= 2 ? Colors.blue : Colors.white,
                          ),
                        ),
                        title: 'Proof of Identity',
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                            activeStep >= 3 ? Colors.blue : Colors.white,
                          ),
                        ),
                        title: 'Nominee',
                        topTitle: true,
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                            activeStep >= 4 ? Colors.blue : Colors.white,
                          ),
                        ),
                        title: 'Additional',
                      ),
                    ],
                    onStepReached: (index) =>
                        setState(() => activeStep = index),
                  ),
                ),
                CommonTextField(controller: UCCController,
                label: 'UCC',
                imagePath: ImagePath.addressPath,),
                CommonTextField(controller: dpNumberController,
                  label: 'DP Number',
                  imagePath: ImagePath.addressPath,),
                CommonTextField(controller: portfolioSizeController,
                label: 'Portfolio Size',
                imagePath: ImagePath.addressPath,),
                CommonTextField(controller: referenceMediumController,
                label: 'Reference Medium',
                imagePath: ImagePath.cardPath,),
                CommonTextField(controller: referenceDescriptionController,
                  label: 'Reference Description',
                  imagePath: ImagePath.cardPath,),

                Container(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submitUserInfo();
                      }
                    },
                    style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitUserInfo() async {
    var url="https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/pmsProduct/6486ba6591b64d98a0c77b5f";
    var data={
      "personalDetailsData":{
        "fullNamePrefix": "Mr",
        "fullName": CommonValue.fullName,
        "motherNamePrefix": "Mrs",
        "motherName": CommonValue.motherName,
        "fatherNamePrefix": "Mr",
        "fatherName": CommonValue.fatherName,
        "email": CommonValue.emailId,
        "mobileNumber": CommonValue.mobileNumber,
        "dateOfBirth": CommonValue.dateOfBirth,
        "gender": CommonValue.gender,
        "alternateMobileNumber": CommonValue.mobileNumber,
        "category": CommonValue.category,
        "aadharNumber": CommonValue.adhaarNumber,
        "pancardNumber": CommonValue.panNumber,
        "aadharImage": {
          "frontImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          },
          "backImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          }
        },
        "pancardImage": {
          "data": "base64-encoded-image-data",
          "contentType": "image/jpeg"
        },
        "photo": {
          "data": "base64-encoded-image-data",
          "contentType": "image/jpeg"
        },
        "passportImage": {
          "frontImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          },
          "backImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          }
        }
      },
      "currentAddressData":{
        "curaddresss": {
          "flatHouseNoBlockNo": "Flat 123",
          "apartmentRoadArea": "XYZ Apartments",
          "CityTownVillage": CommonValue.city,
          "district": "District",
          "pinCode": CommonValue.pincode,
          "state": CommonValue.state,
          "country": "India",
          "addressProofFiles": {
            "data": "base64-encoded-image-data",
            "contentType": "image/png"
          }
        }
      },
      "permanentAddressData":{
        "peraddresss": {
          "flatHouseNoBlockNo": "Flat 456",
          "apartmentRoadArea": "ABC Apartments",
          "CityTownVillage": CommonValue.city,
          "district": "District",
          "pinCode": CommonValue.pincode,
          "state": CommonValue.state,
          "country": "India",
          "addressProofFiles": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          }
        }
      },
      "bankingDetailsData":{
        "accountName":CommonValue.accountName,
        "accountNumber":CommonValue.accountNumber,
        "bankName": CommonValue.bankName,
        "ifscCode": CommonValue.ifscCode,
        "accountType": CommonValue.accountType
      },
      "additionalDetailsData":{
        "ucc": UCCController.text,
        "dpNumber": dpNumberController.text,
        "portfolioSize": int. parse(portfolioSizeController.text),
        "referenceMedium": referenceMediumController.text,
        "referenceDescription": referenceDescriptionController.text,
      },
      "nomineesData":{
        "nomineesfullNamePrefix": "Mr",
        "nomineesfullName": CommonValue.fullNameNominee,
        "nomineesmotherNamePrefix": "Mrs",
        "nomineesmotherName": CommonValue.motherNameNominee,
        "nomineesfatherNamePrefix": "Mr",
        "nomineesfatherName": CommonValue.fatherNameNominee,
        "nomineesemail": CommonValue.emailIdNominee,
        "nomineesmobileNumber": CommonValue.mobileNumberNominee,
        "nomineesdateOfBirth": CommonValue.dateOfBirthNominee,
        "nomineesgender": CommonValue.genderNominee,
        "nomineesalternateMobileNumber": CommonValue.mobileNumberNominee,
        "nomineescategory": CommonValue.categoryNominee,
        "nomineesaadharNumber": CommonValue.adhaarNumberNominee,
        "nomineespancardNumber": CommonValue.panNumberNominee,
        "nomineesaadharImage": {
          "nomineesAaddharfrontImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          },
          "nomineesAadharbackImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          }
        },
        "nomineespancardImage": {
          "data": "base64-encoded-image-data",
          "contentType": "image/jpeg"
        },
        "nomineesphoto": {
          "data": "base64-encoded-image-data",
          "contentType": "image/jpeg"
        },
        "nomineespassportImage": {
          "nomineesPassportfrontImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          },
          "nomineesPassportbackImage": {
            "data": "base64-encoded-image-data",
            "contentType": "image/jpeg"
          }
        },
        "nomineesrelationship": "Spouse"
      }
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
      _toSelectType();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Your Information is successfully saved.")),
      );
    }
    else{
      _toSelectType();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)),
      );
    }
    print(dataa);

    // Navigator.of(context).pop();

  }

  void _toSelectType() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
      return SelectionType();
    }), (r){
      return false;
    });
  }
}
