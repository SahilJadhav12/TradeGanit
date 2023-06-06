import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/BankDetail/BankDetail.dart';
import 'package:trade_ganit/Common/CommonTextField.dart';
import 'package:trade_ganit/Common/ImagePath.dart';
import 'package:trade_ganit/CustomText.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/material/date_picker.dart';

class PersonalFormDetail extends StatefulWidget {
  const PersonalFormDetail({Key? key}) : super(key: key);

  @override
  State<PersonalFormDetail> createState() => _PersonalFormDetailState();
}

class _PersonalFormDetailState extends State<PersonalFormDetail> {
  TextEditingController fullNameTextInput = TextEditingController();
  TextEditingController fatherNameTextInputController = TextEditingController();
  TextEditingController motherNameTextInputController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  SingleValueDropDownController genderController = SingleValueDropDownController();
  SingleValueDropDownController categoryController = SingleValueDropDownController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController alternateMobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController addressTextInput = TextEditingController();
  TextEditingController cityTextInput = TextEditingController();
  TextEditingController landmarkTextInputController = TextEditingController();
  TextEditingController stateTextInput = TextEditingController();
  TextEditingController pincodeTextInput = TextEditingController();
  TextEditingController adharNumberTextInput = TextEditingController();
  TextEditingController panNumberTextInputController = TextEditingController();

  DateTime now3 = DateTime.now();
  String formattedDate3 = "";

  final _formKey = GlobalKey<FormState>();
  int activeStep = 0;

  @override
  void initState() {
    fullNameTextInput.text = CustomTexts.userName;
    addressTextInput.text = CustomTexts.address;
    cityTextInput.text = CustomTexts.city;
    stateTextInput.text = CustomTexts.state;
    pincodeTextInput.text = CustomTexts.pincode;
    adharNumberTextInput.text = CustomTexts.adharNum;
    panNumberTextInputController.text = CustomTexts.panNum;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: SingleChildScrollView(
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
              CommonTextField(
                controller: fullNameTextInput,
                label: "Full Name (Same as ID proof)",
              ),
              CommonTextField(
                controller: fatherNameTextInputController,
                label: "Father Name/Spouse Name",
              ),
              CommonTextField(
                controller: mobileNumberController,
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
                          DropDownValueModel(name: 'Option1', value: "Option1"),
                          DropDownValueModel(name: 'Option2', value: "Option2"),
                          DropDownValueModel(name: 'Option3', value: "Option3"),
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
              ),
              CommonTextField(
                controller: addressTextInput,
                label: "Address",
                imagePath: ImagePath.addressPath,
              ),
              //TODO:If require in future.
              // Container(
              //   padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              //   child: TextFormField(
              //     decoration: InputDecoration(labelText: 'Landmark'),
              //     controller: landmarkTextInputController,
              //     onFieldSubmitted: (value) {
              //       setState(() {
              //       });
              //     },
              //   ),
              // ),
              CommonTextField(controller: cityTextInput,
              label: "City",
                imagePath: ImagePath.addressPath,
              ),
              CommonTextField(controller: stateTextInput,
                label: "State",
                imagePath: ImagePath.addressPath,
              ),
              CommonTextField(controller: pincodeTextInput,
                label: "Pincode",
                imagePath: ImagePath.addressPath,
              ),
              CommonTextField(controller: adharNumberTextInput,
                label: "Adhaar Number",
                imagePath: ImagePath.cardPath,
              ),
              CommonTextField(controller: panNumberTextInputController,
                label: "Pan Number",
                imagePath: ImagePath.cardPath,
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
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
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

  void _navigateToPersonalFormDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BankDetail(),
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
