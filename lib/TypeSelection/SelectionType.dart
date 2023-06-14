import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/AdditionalDetails.dart';
import 'package:trade_ganit/BankDetail/BankDetail.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';
import 'package:trade_ganit/ProofOfIdentifyAndAddress.dart';

import '../PersonalDetails/personalDetails.dart';
import 'package:http/http.dart' as http;


class SelectionType extends StatefulWidget {
  const SelectionType({Key? key}) : super(key: key);

  @override
  State<SelectionType> createState() => _SelectionTypeState();
}

class _SelectionTypeState extends State<SelectionType> {

  String categoryValue="AYAN";
  String accountTypeValue="Checking Account1";
  String broker="BOBC";
  int activeStep=0;
  var _formKey = GlobalKey<FormState>();
  SingleValueDropDownController selectCategoryController = SingleValueDropDownController();
  SingleValueDropDownController accountTypeController = SingleValueDropDownController();
  SingleValueDropDownController brokerController = SingleValueDropDownController();


  void _navigateToPersonalDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PersonalDetail(),
      ),
    );
  }
  void _navigateToBankingDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BankDetail(),
      ),
    );
  }
  void _navigateToAddressDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProofOfIdentifyAndAddress(),
      ),
    );
  }
  void _navigateToNominee() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FirstNomineeDetail(),
      ),
    );
  }

  void _navigateToAdditional() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AdditionalDetails(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    // selectCategoryController.dropDownValue!.value.toString()=="";
    getUserSubmitInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Trade Ganit"),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Select Category',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: selectCategoryController,
                        listPadding: ListPadding(top: 20),
                        enableSearch: true,
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {

                            return null;
                          }
                        },
                        dropDownList: const [
                          DropDownValueModel(name: 'AYAN', value: "AYAN"),
                          DropDownValueModel(name: 'NRI', value: "NRI"),
                          DropDownValueModel(name: 'NRE', value: "NRE"),
                          DropDownValueModel(name: 'NRO', value: "NRO"),
                          DropDownValueModel(name: 'HUF', value: "HUF"),
                        ],
                        listTextStyle: const TextStyle(color: Colors.black),
                        dropDownItemCount: 3,

                        onChanged: (val) {
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Acount Type',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: accountTypeController,
                        listPadding: ListPadding(top: 20),
                        enableSearch: true,
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {

                            return null;
                          }
                        },
                        dropDownList: const [
                          DropDownValueModel(name: 'Checking Account', value: "Checking Account"),
                          DropDownValueModel(name: 'Savings Account', value: "Savings Account"),
                          DropDownValueModel(name: 'Certificate of Deposit (CD)', value: "Certificate of Deposit (CD)"),
                          DropDownValueModel(name: 'Joint Account', value: "Joint Account"),
                          DropDownValueModel(name: 'Business Account', value: "Business Account"),
                          DropDownValueModel(name: 'Trust Account', value: "Trust Account"),
                          DropDownValueModel(name: 'Student Account', value: "Student Account"),
                        ],
                        listTextStyle: const TextStyle(color: Colors.black),
                        dropDownItemCount: 5,

                        onChanged: (val) {
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Broker',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: brokerController,
                        listPadding: ListPadding(top: 20),
                        enableSearch: true,
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {

                            return null;
                          }
                        },
                        dropDownList: const [
                          DropDownValueModel(name: 'BOBC', value: "BOBC"),
                        ],
                        listTextStyle: const TextStyle(color: Colors.black),
                        dropDownItemCount: 1,

                        onChanged: (val) {
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(

                onPressed: () {
                  // if(selectCategoryController.dropDownValue!.value.toString()=="")
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("Please select category")),
                  //     );
                  //   }
                  // else if(accountTypeController.dropDownValue!.value.toString()=="")
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("Please select Account Type")),
                  //     );
                  //   }
                  // else if(brokerController.dropDownValue!.value.toString()=="")
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("Please select broker")),
                  //     );
                  //   }
                  // else{
                  if(CommonValue.personalDetailsNavigate==true)
                    {
                      _navigateToPersonalDetail();
                    }
                  else if(CommonValue.bankingDetailsNavigate==true)
                    {
                      _navigateToBankingDetail();
                    }
                  else if(CommonValue.addressDetailsNavigate==true)
                    {
                      _navigateToAddressDetail();
                    }
                  else if(CommonValue.nomineeDetailsNavigate==true)
                    {
                      _navigateToNominee();
                    }
                  else if(CommonValue.addressDetailsNavigate==true)
                    {
                      _navigateToAdditional();
                    }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("User Information already fill up")),
                    );
                  }

                  // }
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                child: Text('Next'),
              ),

              // const Text(
              //   'You have pushed the button this many times:',
              // ),
              // Text(
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> getUserSubmitInfo() async {
    var url="https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/getoneuser/6486ba6591b64d98a0c77b5f";
    var urlParse=Uri.parse(url);
    http.Response response=await http.get(
        urlParse,
        headers: {
          "Content-Type":"application/json",
        }
    );
    var dataa=jsonDecode(response.body);
    if(response.statusCode==200)
    {

      if(dataa['personalDetails']==null)
        {
          // CommonValue.personalDetailsNavigate=true;
        }
      else{
        CommonValue.fullName=dataa['personalDetails']['fullName'];
        CommonValue.motherName=dataa['personalDetails']['motherName'];
        CommonValue.fatherName=dataa['personalDetails']['fatherName'];
        CommonValue.emailId=dataa['personalDetails']['email'];
        CommonValue.mobileNumber=dataa['personalDetails']['mobileNumber'];
        CommonValue.dateOfBirth=dataa['personalDetails']['dateOfBirth'];
        CommonValue.gender=dataa['personalDetails']['gender'];
        CommonValue.category=dataa['personalDetails']['category'][0];
        CommonValue.adhaarNumber=dataa['personalDetails']['aadharNumber'];
        CommonValue.panNumber=dataa['personalDetails']['pancardNumber'];
      }
      if(dataa['bankingDetails']==null)
      {
        // CommonValue.bankingDetailsNavigate=true;
      }
      else{
        CommonValue.accountName=dataa['bankingDetails']['accountName'];
        CommonValue.accountNumber=dataa['bankingDetails']['accountNumber'];
        CommonValue.bankName=dataa['bankingDetails']['bankName'];
        CommonValue.ifscCode=dataa['bankingDetails']['ifscCode'];
        CommonValue.accountType=dataa['bankingDetails']['accountType'];
      }
      if(dataa['currentAddress']==null)
      {
        // CommonValue.addressDetailsNavigate=true;
      }
      else{
        CommonValue.city=dataa['currentAddress']['curaddresss']['CityTownVillage'];
        CommonValue.state=dataa['currentAddress']['curaddresss']['state'];
        CommonValue.pincode=dataa['currentAddress']['curaddresss']['pinCode'];
      }
      if(dataa['nominees']==null)
      {
        // CommonValue.nomineeDetailsNavigate=true;
      }
      else{
        CommonValue.fullNameNominee=dataa['nominees']['nomineesfullName'];
        CommonValue.motherNameNominee=dataa['nominees']['nomineesmotherName'];
        CommonValue.fatherNameNominee=dataa['nominees']['nomineesfatherName'];
        CommonValue.emailIdNominee=dataa['nominees']['nomineesemail'];
        CommonValue.mobileNumberNominee=dataa['nominees']['nomineesmobileNumber'];
        CommonValue.dateOfBirthNominee=dataa['nominees']['nomineesdateOfBirth'];
        CommonValue.genderNominee=dataa['nominees']['nomineesgender'];
        CommonValue.categoryNominee=dataa['nominees']['nomineescategory'][0];
        CommonValue.adhaarNumberNominee=dataa['nominees']['nomineesaadharNumber'];
        CommonValue.panNumberNominee=dataa['nominees']['nomineespancardNumber'];
      }
      if(dataa['additionalDetails']==null)
      {
        // CommonValue.additionalDetailsNavigate=true;
      }
      else{
        CommonValue.ucc=dataa['additionalDetails']['ucc'];
        CommonValue.dpNumber=dataa['additionalDetails']['dpNumber'];
        CommonValue.portfolioSize=(dataa['additionalDetails']['portfolioSize']).toString();
        CommonValue.referenceMedium=dataa['additionalDetails']['referenceMedium'];
        CommonValue.referenceDescription=dataa['additionalDetails']['referenceDescription'];
      }

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
