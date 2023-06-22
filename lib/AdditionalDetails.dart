import 'dart:convert';
import 'dart:io';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/Common/CommonTextField.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/Common/ImagePath.dart';
import 'package:http/http.dart' as http;
import 'package:trade_ganit/Common/widget/stepper.dart';
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
  var uri,request;


  @override
  void initState() {
    // TODO: implement initState
    UCCController.text=CommonValue.ucc;
    dpNumberController.text=CommonValue.dpNumber;
    portfolioSizeController.text=CommonValue.portfolioSize;
    referenceMediumController.text=CommonValue.referenceMedium;
    referenceDescriptionController.text=CommonValue.referenceDescription;
    uri = Uri.parse('https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/pmsProduct/648bf278c173a007701d1840'); // Replace with your upload endpoint
    request = http.MultipartRequest('POST', uri);
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
                ActiveStep(activeStep: activeStep),
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


    // Add normal fields to the request
    request.fields['personalDetailsData[fullNamePrefix]'] = 'Mr';
    request.fields['personalDetailsData[fullName]'] = CommonValue.fullName;
    request.fields['personalDetailsData[motherNamePrefix]'] = 'Mrs';
    request.fields['personalDetailsData[motherName]'] = CommonValue.motherName;
    request.fields['personalDetailsData[fatherNamePrefix]'] = 'Mr';
    request.fields['personalDetailsData[fatherName]'] = CommonValue.fatherName;
    request.fields['personalDetailsData[email]'] = CommonValue.emailId;
    request.fields['personalDetailsData[mobileNumber]'] = CommonValue.mobileNumber;
    request.fields['personalDetailsData[dateOfBirth]'] = CommonValue.dateOfBirth;
    request.fields['personalDetailsData[gender]'] = CommonValue.gender;
    request.fields['personalDetailsData[alternateMobileNumber]'] = CommonValue.mobileNumber;
    request.fields['personalDetailsData[category][0]'] = CommonValue.category;
    request.fields['personalDetailsData[aadharNumber]'] = CommonValue.adhaarNumber;
    request.fields['personalDetailsData[pancardNumber]'] = CommonValue.panNumber;
    request.fields['currentAddressData[curaddresss][flatHouseNoBlockNo]'] = CommonValue.address;
    request.fields['currentAddressData[curaddresss][apartmentRoadArea]'] = "qwe";
    request.fields['currentAddressData[curaddresss][CityTownVillage]']=CommonValue.city;
    request.fields['currentAddressData[curaddresss][district]']="District";
    request.fields['currentAddressData[curaddresss][pinCode]']=CommonValue.pincode;
    request.fields['currentAddressData[curaddresss][state]']=CommonValue.state;
    request.fields['currentAddressData[curaddresss][country]']="Country";

    request.fields['permanentAddressData[peraddresss][flatHouseNoBlockNo]'] = CommonValue.address;
    request.fields['permanentAddressData[peraddresss][apartmentRoadArea]'] = "qwe";
    request.fields['permanentAddressData[peraddresss][district]']="District";
    request.fields['permanentAddressData[peraddresss][CityTownVillage]']=CommonValue.city;
    request.fields['permanentAddressData[peraddresss][pinCode]']=CommonValue.pincode;
    request.fields['permanentAddressData[peraddresss][state]']=CommonValue.state;
    request.fields['permanentAddressData[peraddresss][country]']="Country";

    request.fields['bankingDetailsData[accountName]']=CommonValue.accountName;
    request.fields['bankingDetailsData[accountNumber]']=CommonValue.accountNumber;
    request.fields['bankingDetailsData[bankName]']=CommonValue.bankName;
    request.fields['bankingDetailsData[ifscCode]']=CommonValue.ifscCode;
    request.fields['bankingDetailsData[accountType]']=CommonValue.accountType;
    request.fields['additionalDetailsData[ucc]']=CommonValue.ucc;
    request.fields['additionalDetailsData[dpNumber]']=CommonValue.dpNumber;
    request.fields['additionalDetailsData[portfolioSize]']="30";
    request.fields['additionalDetailsData[referenceMedium]']=CommonValue.referenceMedium;
    request.fields['additionalDetailsData[referenceDescription]']=CommonValue.referenceDescription;
    request.fields['nomineesData[nomineesfullName]']=CommonValue.fullNameNominee;
    request.fields['nomineesData[nomineesmotherName]']=CommonValue.motherNameNominee;
    request.fields['nomineesData[nomineesfatherName]']=CommonValue.fatherNameNominee;
    request.fields['nomineesData[nomineesemail]']=CommonValue.emailIdNominee;
    request.fields['nomineesData[nomineesmobileNumber]']=CommonValue.motherNameNominee;
    request.fields['nomineesData[nomineesdateOfBirth]']=CommonValue.dateOfBirthNominee;
    request.fields['nomineesData[nomineesgender]']=CommonValue.genderNominee;
    request.fields['nomineesData[nomineesalternateMobileNumber]']=CommonValue.mobileNumberNominee;
    request.fields['nomineesData[nomineescategory]']=CommonValue.categoryNominee;
    request.fields['nomineesData[nomineesaadharNumber]']=CommonValue.adhaarNumberNominee;
    request.fields['nomineesData[nomineespancardNumber]']=CommonValue.panNumberNominee;
    request.fields['nomineesData[nomineesrelationship]']="Spouse";






    var adhaarFrontImg = http.ByteStream(CommonValue.adhaarFrontBase64!.openRead());
    var length = await CommonValue.adhaarFrontBase64!.length();
    var adhaarFrontmultipartFile = http.MultipartFile('aadharFront', adhaarFrontImg, length, filename: CommonValue.adhaarFrontBase64!.path.split('/').last);

    var adhaarBackImg = http.ByteStream(CommonValue.adhaarBackBase64!.openRead());
    var length2 = await CommonValue.adhaarBackBase64!.length();
    var adhaarBackmultipartFile = http.MultipartFile('aadharBack', adhaarBackImg, length2, filename: CommonValue.adhaarBackBase64!.path.split('/').last);

    var pancard =http.ByteStream(CommonValue.panFrontBase64Nominee!.openRead());
    var lengthPanCard = await CommonValue.panFrontBase64Nominee!.length();
    var panCardFile = http.MultipartFile('pancard', pancard, lengthPanCard, filename: CommonValue.panFrontBase64Nominee!.path.split('/').last);

    // var photo =http.ByteStream(CommonValue.photoBase64!.openRead());
    // var lengthphoto = await CommonValue.photoBase64!.length();
    // var photFile = http.MultipartFile('photo', photo, lengthphoto, filename: CommonValue.photoBase64Nominee!.path.split('/').last);
    //
    // var passPort =http.ByteStream(CommonValue.passportFrontBase64!.openRead());
    // var lengthpassport = await CommonValue.passportFrontBase64!.length();
    // var passportFrontFile = http.MultipartFile('passportFront', passPort, lengthpassport, filename: CommonValue.passportFrontBase64!.path.split('/').last);
    //
    // var passPortBack =http.ByteStream(CommonValue.passportBackBase64!.openRead());
    // var lengthpassportBack = await CommonValue.passportBackBase64!.length();
    // var passportFile = http.MultipartFile('passportBack', passPortBack, lengthpassportBack, filename: CommonValue.passportBackBase64!.path.split('/').last);
    //
    // //Nominee fileS
    // var adhaarFrontImgNominee = http.ByteStream(CommonValue.adhaarFrontBase64Nominee!.openRead());
    // var lengthNominee = await CommonValue.adhaarFrontBase64Nominee!.length();
    // var adhaarFrontmultipartFileNominee = http.MultipartFile('nomineesaadharfrontImage', adhaarFrontImgNominee, lengthNominee, filename: CommonValue.adhaarFrontBase64Nominee!.path.split('/').last);
    //
    // var adhaarBackImgNominee = http.ByteStream(CommonValue.adhaarBackBase64Nominee!.openRead());
    // var length2Nominee = await CommonValue.adhaarBackBase64Nominee!.length();
    // var adhaarBackmultipartFileNominee = http.MultipartFile('nomineesaadharbackImage', adhaarBackImgNominee, length2Nominee, filename: CommonValue.adhaarBackBase64Nominee!.path.split('/').last);
    //
    // var pancardNominee =http.ByteStream(CommonValue.panFrontBase64Nominee!.openRead());
    // var lengthPanCardNominee = await CommonValue.panFrontBase64Nominee!.length();
    // var panCardFileNominee = http.MultipartFile('nomineespancardImage', pancardNominee, lengthPanCardNominee, filename: CommonValue.panFrontBase64Nominee!.path.split('/').last);
    //
    // var photoNominee =http.ByteStream(CommonValue.photoBase64Nominee!.openRead());
    // var lengthphotoNominee = await CommonValue.photoBase64Nominee!.length();
    // var photFileNominee = http.MultipartFile('nomineesphoto', photoNominee, lengthphotoNominee, filename: CommonValue.photoBase64Nominee!.path.split('/').last);
    //
    // var passPortNominee =http.ByteStream(CommonValue.passportFrontBase64Nominee!.openRead());
    // var lengthpassportNominee = await CommonValue.passportFrontBase64Nominee!.length();
    // var passportFrontFileNominee = http.MultipartFile('nomineesPassportbackImage', passPortNominee, lengthpassportNominee, filename: CommonValue.passportFrontBase64Nominee!.path.split('/').last);

    // var passPortBackNominee =http.ByteStream(CommonValue.passportBackBase64Nominee!.openRead());
    // var lengthpassportBackNominee = await CommonValue.passportBackBase64Nominee!.length();
    // var passportFileNominee = http.MultipartFile('photo', passPortBackNominee, lengthpassportBackNominee, filename: CommonValue.passportBackBase64Nominee!.path.split('/').last);


    // Add the file to the request
    file(CommonValue.adhaarFrontBase64);
    request.files.add(adhaarBackmultipartFile);
    request.files.add(panCardFile);
    // request.files.add(photFile);
    // request.files.add(passportFrontFile);
    // request.files.add(passportFile);
    //
    // // Add the file to the request
    // request.files.add(adhaarFrontmultipartFileNominee);
    // request.files.add(adhaarBackmultipartFileNominee);
    // request.files.add(panCardFileNominee);
    // request.files.add(photFileNominee);
    // request.files.add(passportFrontFileNominee);
    // request.files.add(passportFileNominee);











    // Send the request and get the response
    var response = await request.send();

    // Read the response
    var responseString = await response.stream.bytesToString();
    var jsonResponse = jsonDecode(responseString);

    // Process the response
    if (response.statusCode == 201) {
      _toSelectType();
      print('Request successful');
      print('Response: $jsonResponse');
    } else {
      print('Error during request: ${response.reasonPhrase}');
    }

  }

  void _toSelectType() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
      return SelectionType();
    }), (r){
      return false;
    });
  }


  void file(File? file)
  async {
    var passPortBackNominee =http.ByteStream(file!.openRead());
    var lengthpassportBackNominee = await file.length();
    var photo= http.MultipartFile('photo', passPortBackNominee, lengthpassportBackNominee, filename: file!.path.split('/').last);
    request.files.add(photo);
  }
}


