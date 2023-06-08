import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/Common/CommonTextField.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';
import 'package:trade_ganit/ProofOfIdentifyAndAddress.dart';

import '../Common/ImagePath.dart';


class BankDetail extends StatefulWidget {
  const BankDetail({Key? key}) : super(key: key);

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  TextEditingController accountNameController=TextEditingController();
  TextEditingController accountNumberController=TextEditingController();
  TextEditingController bankNameController=TextEditingController();
  TextEditingController ifscCodeController=TextEditingController();
  TextEditingController accountTypeController=TextEditingController();
  int activeStep=1;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Details'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
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
              CommonTextField(controller: accountNameController,
                label: "Account Name",
                imagePath: ImagePath.profilePath,
              ),
              CommonTextField(controller: accountNumberController,
                label: "Account Number",
                imagePath: ImagePath.profilePath,
                textInputType: TextInputType.number,
              ),
              CommonTextField(controller: bankNameController,
              label: 'Bank Name',
              imagePath: ImagePath.bankLogoPath,),
              CommonTextField(controller: ifscCodeController,
                label: 'IFSC Code',
              imagePath: ImagePath.cardPath,),
              CommonTextField(controller: accountTypeController,
                label: 'Account Type',
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
                            CommonValue.accountName=accountNameController.text;
                            CommonValue.accountNumber=accountNumberController.text;
                            CommonValue.bankName=bankNameController.text;
                            CommonValue.ifscCode=ifscCodeController.text;
                            CommonValue.accountType=accountTypeController.text;
                            _navigateToPersonalFormDetail();
                          }
                        },
                        style: ElevatedButton.styleFrom(fixedSize: const Size(130, 50)),
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
        builder: (context) => const ProofOfIdentifyAndAddress(),
      ),
    );
  }
}
