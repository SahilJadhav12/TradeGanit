import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';

import 'AdditionalDetails.dart';
import 'Common/CommonTextField.dart';
import 'Common/ImagePath.dart';
import 'Common/widget/stepper.dart';
import 'CustomText.dart';

class ProofOfIdentifyAndAddress extends StatefulWidget {
  const ProofOfIdentifyAndAddress({Key? key}) : super(key: key);

  @override
  State<ProofOfIdentifyAndAddress> createState() => _ProofOfIdentifyAndAddressState();
}

class _ProofOfIdentifyAndAddressState extends State<ProofOfIdentifyAndAddress> {
  TextEditingController addressTextInput = TextEditingController();
  TextEditingController cityTextInput = TextEditingController();
  TextEditingController stateTextInput = TextEditingController();
  TextEditingController pincodeTextInput = TextEditingController();

  TextEditingController addressTextInputPermanent = TextEditingController();
  TextEditingController cityTextInputPermanent = TextEditingController();
  TextEditingController stateTextInputPermanent = TextEditingController();
  TextEditingController pincodeTextInputPermanent = TextEditingController();
  bool checkboxisCheck = false;
  bool checkForPermanent = true;

  final _formKey = GlobalKey<FormState>();
  int activeStep = 2;
  @override
  void initState() {
    addressTextInput.text = CustomTexts.address;
    cityTextInput.text = CustomTexts.city;
    stateTextInput.text = CustomTexts.state;
    pincodeTextInput.text = CustomTexts.pincode;

    addressTextInput.text = CommonValue.address;
    cityTextInput.text = CommonValue.city;
    stateTextInput.text = CommonValue.state;
    pincodeTextInput.text = CommonValue.pincode;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proof Of Identify and Address'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                ActiveStep(activeStep: activeStep),
                CommonTextField(
                  controller: addressTextInput,
                  label: "Address",
                  imagePath: ImagePath.addressPath,
                ),
                CommonTextField(controller: cityTextInput,
                label: "City",
                  imagePath: ImagePath.addressPath,
                ),
                CommonTextField(controller: stateTextInput,
                  label: "State",
                  imagePath: ImagePath.addressPath,
                ),
                CommonTextField(controller: pincodeTextInput,
                  label: "pin code",
                  imagePath: ImagePath.addressPath,
                  textInputType: TextInputType.number,
                ),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                        Checkbox(
                        tristate: false,
                        activeColor:  Colors.black,
                        checkColor: Colors.white,
                        value: checkboxisCheck,
                        onChanged: (bool? value) {
                          setState(() {
                            checkboxisCheck = !checkboxisCheck;
                            checkForPermanent=!checkForPermanent;
                            addressTextInputPermanent.text=addressTextInput.text;
                            cityTextInputPermanent.text=cityTextInput.text;
                            stateTextInputPermanent.text=stateTextInput.text;
                            pincodeTextInputPermanent.text=pincodeTextInput.text;
                          });
                        },
                      ),
                      Text("Is Current address same as permanent addres"),
                    ],
                  ),
                ),

                Visibility(
                  visible: checkForPermanent,
                  child: CommonTextField(
                    controller: addressTextInputPermanent,
                    label: "Address",
                    imagePath: ImagePath.addressPath,
                  ),
                ),
                Visibility(
                  visible: checkForPermanent,
                  child: CommonTextField(controller: cityTextInputPermanent,
                    label: "City",
                    imagePath: ImagePath.addressPath,
                  ),
                ),
                Visibility(
                  visible: checkForPermanent,
                  child: CommonTextField(controller: stateTextInputPermanent,
                    label: "State",
                    imagePath: ImagePath.addressPath,
                  ),
                ),
                Visibility(
                  visible: checkForPermanent,
                  child: CommonTextField(controller: pincodeTextInputPermanent,
                    label: "pin code",
                    imagePath: ImagePath.addressPath,
                    textInputType: TextInputType.number,
                  ),
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
                              CommonValue.address=addressTextInput.text;
                              CommonValue.city=cityTextInput.text;
                              CommonValue.state=stateTextInput.text;
                              CommonValue.pincode=pincodeTextInput.text;
                              if(CommonValue.nomineeDetailsNavigate==true)
                              {
                                _navigateToNominee();
                              }
                              else if(CommonValue.addressDetailsNavigate==true)
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
}
