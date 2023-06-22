import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/Common/CommonTextField.dart';
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';
import 'package:trade_ganit/ProofOfIdentifyAndAddress.dart';

import '../AdditionalDetails.dart';
import '../Common/ImagePath.dart';
import '../Common/widget/stepper.dart';


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
  void initState() {
    // TODO: implement initState

    accountNameController.text=CommonValue.accountName;
    accountNumberController.text=CommonValue.accountNumber;
    bankNameController.text=CommonValue.bankName;
    ifscCodeController.text=CommonValue.ifscCode;
    accountTypeController.text=CommonValue.accountType;
    super.initState();
  }
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
              ActiveStep(activeStep: activeStep),
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
                            if(CommonValue.addressDetailsNavigate==true)
                            {
                              _navigateToAddressDetail();
                            }
                            else if(CommonValue.nomineeDetailsNavigate==true)
                            {
                              _navigateToNominee();
                            }
                            else if(CommonValue.addressDetailsNavigate==true)
                            {
                              CommonValue.addressDetailsNavigate=false;
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
}
