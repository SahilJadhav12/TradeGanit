import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class ActiveStep extends StatelessWidget {
  ActiveStep({Key? key,required int this.activeStep}) : super(key: key);


  int activeStep=0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        // onStepReached: (index) =>
        //     setState(() => activeStep = index),
      ),
    );
  }
}
