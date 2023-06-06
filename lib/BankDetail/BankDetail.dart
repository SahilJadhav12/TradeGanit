import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:trade_ganit/FirstNomineeDetail.dart';
import 'package:trade_ganit/ProofOfIdentifyAndAddress.dart';


class BankDetail extends StatefulWidget {
  const BankDetail({Key? key}) : super(key: key);

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  TextEditingController accountNameController=TextEditingController();
  int activeStep=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
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
                      child: ImageIcon(AssetImage('images/profile.png'),),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Account Name'),
                keyboardType: TextInputType.emailAddress,
                controller: accountNameController,
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
                      child: ImageIcon(AssetImage('images/profile.png'),),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Account Number'),
                keyboardType: TextInputType.emailAddress,
                controller: accountNameController,
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
                      child: ImageIcon(AssetImage('images/bank.png'),),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Bank Name'),
                keyboardType: TextInputType.emailAddress,
                controller: accountNameController,
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
                      child: ImageIcon(AssetImage('images/ifsc.png'),),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'IFSC Code'),
                keyboardType: TextInputType.emailAddress,
                controller: accountNameController,
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
                      child: ImageIcon(AssetImage('images/panNumber.png'),),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Account Type'),
                keyboardType: TextInputType.emailAddress,
                controller: accountNameController,
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
