import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';

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
  int activeStep = 2;
  @override
  void initState() {
    addressTextInput.text = CustomTexts.address;
    cityTextInput.text = CustomTexts.city;
    stateTextInput.text = CustomTexts.state;
    pincodeTextInput.text = CustomTexts.pincode;

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
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12),
                        child: ImageIcon(AssetImage('images/address.png'),),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Address'),
                  controller: addressTextInput,
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12),
                        child: ImageIcon(AssetImage('images/address.png'),),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'City'),
                  controller: cityTextInput,
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12),
                        child: ImageIcon(AssetImage('images/address.png'),),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'State'),
                  controller: stateTextInput,
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12),
                        child: ImageIcon(AssetImage('images/address.png'),),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Pincode'),
                  controller: pincodeTextInput,
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
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
                          _navigateToPersonalFormDetail();
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
        builder: (context) => const FirstNomineeDetail(),
      ),
    );
  }
}
