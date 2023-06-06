import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

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
  int activeStep = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Details'),
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
                      labelText: 'UCC'),
                  controller: UCCController,
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
                      labelText: 'DP Number'),
                  controller: dpNumberController,
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
                      labelText: 'Portfolio Size'),
                  controller: portfolioSizeController,
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
                      labelText: 'Reference Medium'),
                  controller: UCCController,
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
                      labelText: 'Reference Description'),
                  controller: referenceDescriptionController,
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
