import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../PersonalDetails/personalDetails.dart';


class SelectionType extends StatefulWidget {
  const SelectionType({Key? key}) : super(key: key);

  @override
  State<SelectionType> createState() => _SelectionTypeState();
}

class _SelectionTypeState extends State<SelectionType> {

  String categoryValue="AYAN";
  String accountTypeValue="Checking Account1";
  String broker="BOBC";
  int activeStep=0;
  var _formKey = GlobalKey<FormState>();
  SingleValueDropDownController selectCategoryController = SingleValueDropDownController();
  SingleValueDropDownController accountTypeController = SingleValueDropDownController();
  SingleValueDropDownController brokerController = SingleValueDropDownController();


  void _navigateToPersonalDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PersonalDetail(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    // selectCategoryController.dropDownValue!.value.toString()=="";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Trade Ganit"),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Select Category',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: selectCategoryController,
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
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Acount Type',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: accountTypeController,
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
                          DropDownValueModel(name: 'Checking Account', value: "Checking Account"),
                          DropDownValueModel(name: 'Savings Account', value: "Savings Account"),
                          DropDownValueModel(name: 'Certificate of Deposit (CD)', value: "Certificate of Deposit (CD)"),
                          DropDownValueModel(name: 'Joint Account', value: "Joint Account"),
                          DropDownValueModel(name: 'Business Account', value: "Business Account"),
                          DropDownValueModel(name: 'Trust Account', value: "Trust Account"),
                          DropDownValueModel(name: 'Student Account', value: "Student Account"),
                        ],
                        listTextStyle: const TextStyle(color: Colors.black),
                        dropDownItemCount: 5,

                        onChanged: (val) {
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child:
                      Text('Broker',),
                    ),
                    Expanded(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        listSpace: 20,
                        controller: brokerController,
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
                          DropDownValueModel(name: 'BOBC', value: "BOBC"),
                        ],
                        listTextStyle: const TextStyle(color: Colors.black),
                        dropDownItemCount: 1,

                        onChanged: (val) {
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(

                onPressed: () {
                  // if(selectCategoryController.dropDownValue!.value.toString()=="")
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("Please select category")),
                  //     );
                  //   }
                  // else if(accountTypeController.dropDownValue!.value.toString()=="")
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("Please select Account Type")),
                  //     );
                  //   }
                  // else if(brokerController.dropDownValue!.value.toString()=="")
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("Please select broker")),
                  //     );
                  //   }
                  // else{
                    _navigateToPersonalDetail();
                  // }
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                child: Text('Next'),
              ),

              // const Text(
              //   'You have pushed the button this many times:',
              // ),
              // Text(
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
