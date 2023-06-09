import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trade_ganit/AdditionalDetails.dart';
import 'package:trade_ganit/BankDetail/BankDetail.dart';
import 'package:trade_ganit/CustomText.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';

import 'Common/CommonTextField.dart';
import 'Common/CommonValue.dart';
import 'Common/ImagePath.dart';
import 'Common/widget/stepper.dart';

class FirstNomineeFormDetail extends StatefulWidget {
  const FirstNomineeFormDetail({Key? key}) : super(key: key);

  @override
  State<FirstNomineeFormDetail> createState() => _FirstNomineeFormDetailState();
}

class _FirstNomineeFormDetailState extends State<FirstNomineeFormDetail> {
  int activeStep=3;
  TextEditingController fullNameTextInput=TextEditingController();
  TextEditingController fatherNameTextInputController = TextEditingController();
  TextEditingController motherNameTextInputController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  SingleValueDropDownController genderController = SingleValueDropDownController();
  SingleValueDropDownController categoryController = SingleValueDropDownController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController alternateMobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController addressTextInput=TextEditingController();
  TextEditingController cityTextInput=TextEditingController();
  TextEditingController landmarkTextInputController=TextEditingController();
  TextEditingController stateTextInput=TextEditingController();
  TextEditingController pincodeTextInput=TextEditingController();
  TextEditingController adharNumberTextInput=TextEditingController();
  TextEditingController panNumberTextInputController=TextEditingController();
  DateTime now3 = DateTime.now();
  String formattedDate3 = "";
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    fullNameTextInput.text=CustomTexts.userName;
    addressTextInput.text=CustomTexts.address;
    cityTextInput.text=CustomTexts.city;
    stateTextInput.text=CustomTexts.state;
    pincodeTextInput.text=CustomTexts.pincode;
    adharNumberTextInput.text=CustomTexts.adharNum;
    panNumberTextInputController.text=CustomTexts.panNum;


    fullNameTextInput.text = CommonValue.fullNameNominee;
    fatherNameTextInputController.text=CommonValue.fatherNameNominee;
    motherNameTextInputController.text=CommonValue.motherNameNominee;
    dateOfBirthController.text=CommonValue.dateOfBirthNominee;
    emailIdController.text=CommonValue.emailIdNominee;
    mobileNumberController.text=CommonValue.mobileNumberNominee;
    adharNumberTextInput.text = CommonValue.adhaarNumberNominee;
    panNumberTextInputController.text = CommonValue.panNumberNominee;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Nominee Details'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ActiveStep(activeStep: activeStep),
              CommonTextField(
                controller: fullNameTextInput,
                label: "Full Name (Same as ID proof)",
              ),
              CommonTextField(
                controller: fatherNameTextInputController,
                label: "Father Name/Spouse Name",
              ),
              CommonTextField(
                controller: motherNameTextInputController,
                label: "Mother Name",
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12),
                        child: ImageIcon(AssetImage('images/birthdate.png'),),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Date of Birth'),
                  keyboardType: TextInputType.emailAddress,
                  controller: dateOfBirthController,
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                  onTap: () {
                    _dateBirth();
                  },
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Gender',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: genderController,
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
                          DropDownValueModel(name: 'Male', value: "Male"),
                          DropDownValueModel(name: 'Female', value: "Female"),
                          DropDownValueModel(name: 'Other', value: "Other"),
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
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Category',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: categoryController,
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
              CommonTextField(
                controller: emailIdController,
                label: "Email Id",
                imagePath: ImagePath.emailPath,
                isEmail: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onTap: (){
                  setState(() {
                    print("qwert");
                  });
                },
              ),
              CommonTextField(
                controller: mobileNumberController,
                label: "Mobile Number",
                imagePath: ImagePath.phonePath,
                maxlength: 10,
                textInputType: TextInputType.number,
              ),
              CommonTextField(controller: adharNumberTextInput,
                label: "Adhaar Number",
                imagePath: ImagePath.cardPath,
                maxlength: 12,
                textInputType: TextInputType.number,
              ),
              CommonTextField(controller: panNumberTextInputController,
                label: "Pan Number",
                imagePath: ImagePath.cardPath,
                textInputType: TextInputType.number,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context,true);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 50)),
                        child: Text('Previous'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          if(genderController.dropDownValue==null)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please select value of gender")),
                            );
                          }
                          else if(categoryController.dropDownValue==null)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please select Category")),
                            );
                          }
                          else if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            CommonValue.fullNameNominee=fullNameTextInput.text;
                            CommonValue.fatherNameNominee=fatherNameTextInputController.text;
                            CommonValue.motherNameNominee=motherNameTextInputController.text;
                            CommonValue.dateOfBirthNominee=dateOfBirthController.text;
                            CommonValue.genderNominee=genderController.dropDownValue!.value.toString();
                            CommonValue.categoryNominee=categoryController.dropDownValue!.value.toString();
                            CommonValue.emailIdNominee=emailIdController.text;
                            CommonValue.mobileNumberNominee=mobileNumberController.text;
                            // CommonValue.address=addressTextInput.text;
                            // CommonValue.city=cityTextInput.text;
                            // CommonValue.state=stateTextInput.text;
                            // CommonValue.pincode=pincodeTextInput.text;
                            CommonValue.adhaarNumberNominee=adharNumberTextInput.text;
                            CommonValue.panNumberNominee=panNumberTextInputController.text;
                            if(CommonValue.additionalDetailsNavigate==true)
                            {
                              _navigateToAdditional();
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text(
                                    "User Information already fill up")),
                              );
                            }
                          }
                          //_navigateToPersonalFormDetail();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 50)),
                        child: Text('Next'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  void _dateBirth() {
    showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) =>
    {
      setState(() {
        now3 = value!;
        formattedDate3 = DateFormat('dd MMM yyyy').format(now3);
        dateOfBirthController.text = formattedDate3;
      })
    });
  }
}
