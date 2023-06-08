import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_ganit/AdditionalDetails.dart';
import 'package:trade_ganit/CustomText.dart';

import 'Common/CommonValue.dart';
import 'FirstNomineeFromDetails.dart';

class FirstNomineeDetail extends StatefulWidget {
  const FirstNomineeDetail({Key? key}) : super(key: key);

  @override
  State<FirstNomineeDetail> createState() => _FirstNomineeDetailState();
}

class _FirstNomineeDetailState extends State<FirstNomineeDetail> {

  XFile? image;
  XFile? image2,image3,image4,passportImageFront,passportImageBack;
  int activeStep=3;

  final ImagePicker picker = ImagePicker();

  String textchange="Select File (Back Side)";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Nominee Details'),
      ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 40,top: 10),
                      child: Text('Upload Adhar Card')),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        companyImageUpload("adhaarFront");
                      },
                      child: image !=null
                          ? Image.file(
                        //to show image, you type like this.
                        File(image!.path),
                        fit: BoxFit.cover,
                        height: 200,
                      ):
                      DottedBorder(
                        dashPattern: [4, 3],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(CustomTexts.adharFrontLabel),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        companyImageUpload("adhaarBack");
                      },
                      child: image2 !=null
                          ? Image.file(
                        //to show image, you type like this.
                        File(image2!.path),
                        fit: BoxFit.cover,
                        height: 200,
                      ):
                      DottedBorder(
                        dashPattern: [4, 3],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(CustomTexts.adharBackLabel),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 40,top: 10),
                      child: Text('Upload PAN Card',)),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        companyImageUpload("panFront");
                      },
                      child: image3 !=null
                          ? Image.file(
                        //to show image, you type like this.
                        File(image3!.path),
                        fit: BoxFit.cover,
                        height: 200,
                      ):
                      DottedBorder(
                        dashPattern: [4, 3],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(CustomTexts.panFrontLabel),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 40,top: 10),
                      child: Text('Upload Photo',)),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        companyImageUpload("panBack");
                      },
                      child: image4 !=null
                          ? Image.file(
                        //to show image, you type like this.
                        File(image4!.path),
                        fit: BoxFit.cover,
                        height: 200,
                      ):
                      DottedBorder(
                        dashPattern: [4, 3],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(CustomTexts.panBackLabel),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 40,top: 10),
                      child: Text('Upload Passport Image')),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        companyImageUpload("passportFront");
                      },
                      child: passportImageFront !=null
                          ? Image.file(
                        //to show image, you type like this.
                        File(passportImageFront!.path),
                        fit: BoxFit.cover,
                        height: 200,
                      ):
                      DottedBorder(
                        dashPattern: [4, 3],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(CustomTexts.adharFrontLabel),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        companyImageUpload("passportBack");
                      },
                      child: passportImageBack !=null
                          ? Image.file(
                        //to show image, you type like this.
                        File(passportImageBack!.path),
                        fit: BoxFit.cover,
                        height: 200,
                      ):
                      DottedBorder(
                        dashPattern: [4, 3],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(CustomTexts.adharBackLabel),
                        ),
                      ),
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
                            onPressed: () async {
                              if(image!=null&&image2!=null&&image3!=null&&image4!=null&&passportImageFront!=null&&passportImageBack!=null) {

                                //Image of Adhaar front
                                File file=File(image!.path);
                                Uint8List imagebytes = await file.readAsBytes(); //convert to bytes
                                String adharFront = base64.encode(imagebytes); //convert bytes to base64 string
                                print(adharFront);

                                //Image of Adhaar back
                                File file2=File(image2!.path);
                                Uint8List imagebytes2 = await file2.readAsBytes(); //convert to bytes
                                String adharBack = base64.encode(imagebytes2); //convert bytes to base64 string
                                print(adharBack);

                                //Image of Pan card
                                File file3=File(image3!.path);
                                Uint8List imagebytes3 = await file3.readAsBytes(); //convert to bytes
                                String panFront = base64.encode(imagebytes3); //convert bytes to base64 string
                                print(panFront);

                                //Image of Photo
                                File file4=File(image4!.path);
                                Uint8List imagebytes4 = await file4.readAsBytes(); //convert to bytes
                                String photo = base64.encode(imagebytes4); //convert bytes to base64 string
                                print(photo);

                                //Image of PassportFront
                                File file5=File(passportImageFront!.path);
                                Uint8List imagebytes5 = await file5.readAsBytes(); //convert to bytes
                                String adharFront5 = base64.encode(imagebytes5); //convert bytes to base64 string
                                print(adharFront5);

                                //Image of PassportBack
                                File file6=File(passportImageBack!.path);
                                Uint8List imagebytes6 = await file6.readAsBytes(); //convert to bytes
                                String adharFront6 = base64.encode(imagebytes6); //convert bytes to base64 string
                                print(adharFront6);

                                //Saving Image value in base64
                                CommonValue.adhaarFrontBase64Nominee=adharFront.toString();
                                CommonValue.adhaarBackBase64Nominee=adharBack.toString();
                                CommonValue.panFrontBase64Nominee=panFront.toString();
                                CommonValue.photoBase64Nominee=photo.toString();
                                CommonValue.passportFrontBase64Nominee=adharFront5.toString();
                                CommonValue.passportBackBase64Nominee=adharFront6.toString();


                                _navigateToFirstNomineeFormDetail();

                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please select image")),
                                );
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
          ],
        ),
      ),
    );
  }

  void _navigateToFirstNomineeFormDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FirstNomineeFormDetail(),
      ),
    );
  }

  void companyImageUpload(String card) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery,card);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera,card);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImage(ImageSource media, String card) async {
    var img = await picker.pickImage(source: media);
    //convert bytes to base64 string
    setState(() {
      if(card=="adhaarFront")
      {
        image = img;
        getRecognisedText(image!,card);
      }
      else if(card=="adhaarBack")
      {
        image2 = img;
        getRecognisedText(image2!, card);
      }
      else if(card=="panFront")
      {
        image3 =img;
        getRecognisedText(image3!, card);
      }
      else if(card=="panBack")
      {
        image4 = img;
        getRecognisedText(image4!, card);
      }
      else if(card=="passportFront"){
        passportImageFront=img;
        getRecognisedText(passportImageFront!, card);
      }
      else if(card=="passportBack"){
        passportImageBack=img;
        getRecognisedText(passportImageBack!, card);
      }
    });
  }

  void getRecognisedText(XFile image,String card) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    // scannedText = "";
    int i=0,j=0;
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        if(line.text.contains("Permanent Account Number Card\n")&&card=="panFront"||i==4 && card=="panFront")
        {
          CustomTexts.panNum=line.text.replaceAll("Permanent Account Number Card\n", "");
        }
        if(i==1 && card=="adhaarFront")
        {
          CustomTexts.userName=line.text;
        }
        // RegExp exp = RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$');
        // String str = 'Parse my string';
        // RegExpMatch? match = exp.firstMatch(str);
        if(i==2 && card=="adhaarFront")
        {

          CustomTexts.adharNum=line.text;
        }
        if(line.text.contains("Address:")&& card=="adhaarBack"||j==1||j==2)
        {
          CustomTexts.address=CustomTexts.address.replaceAll("Address:", "")+line.text;
          j++;
        }
        // scannedText = scannedText + line.text + "\n";
        textchange=textchange+line.text+"\n";
        i++;
      }
      if(CustomTexts.address!="")
      {
        List<String> substrings = CustomTexts.address.split(",");
        int j=0;
        for(int i=(substrings.length-1);j<=2;i--)
        {
          if(j==1)
          {
            CustomTexts.state=substrings[i].replaceAll("\n", "");
          }
          if(j==2)
          {
            CustomTexts.city=substrings[i];
          }
          if(j==0)
          {
            CustomTexts.pincode=substrings[i];
          }
          j++;
        }
      }
    }
    // textScanning = false;
    setState(() {});
  }
}
