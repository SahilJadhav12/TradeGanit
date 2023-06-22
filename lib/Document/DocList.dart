import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trade_ganit/Common/CommonValue.dart';
import 'package:url_launcher/url_launcher.dart';

class DocList extends StatefulWidget {
  const DocList({Key? key}) : super(key: key);


  @override
  State<DocList> createState() => _DocListState();
}

class _DocListState extends State<DocList> {

  late List<String> docName=<String>[];

  late List<bool> _isChecked;
  @override
  void initState() {
    // TODO: implement initState



    // _isChecked = List<bool>.filled(5, false);
    getUserDocByIdByEmail("");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          leading: Text('Document List',style: TextStyle(color: Colors.white,fontSize: 20)),
          trailing: Text('Download',style: TextStyle(color: Colors.white,fontSize: 18)),
        ),
      ),
      body: ListView.builder(
        itemCount: CommonValue.docIdList.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          // final item = items[index];
          return Container(
            margin: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
              color: Colors.white,
              boxShadow:  const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: ListTile(
              subtitle: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      redirectToUrl(CommonValue.docIdList[index],"");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Document Name: ${docName[index]}",style: TextStyle(color: Colors.deepPurple),),
                    Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Download'),
                      ),
                      ],
                    ),
                  ),
                ],),
            ),
          );
        },
      ),
    );
  }


  Future<void> redirectToUrl(String docId,email) async {
    //TODO: For temporary basis till login flow is not applied
    email="pshinde@infimatrix.com";
    var url="https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/get-document-details/$docId";
    var urlParse=Uri.parse(url);
    http.Response response=await http.get(
        urlParse,
        headers: {
          // "":
          "Content-Type":"application/json",
        }
    );
    var result=jsonDecode(response.body);
    if(response.statusCode==200)
    {
      for(int i=0;i<result['recipients'].length;i++) {
        if (result['recipients'][i]['email'] == email) {
          String sharelink = result['recipients'][i]['shared_link'];
          final Uri _url = Uri.parse('https://flutter.dev');
          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          }

        }
      }

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
    }
    print(result);

  }

  ///This function use to pass emailID and get doc ID.
  Future<void> getUserDocByIdByEmail(String email) async {
    email="pshinde@infimatrix.com";
    var url="https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/get-documents-by-email?tag=$email";
    var urlParse=Uri.parse(url);
    http.Response response=await http.get(
        urlParse,
        headers: {
          // "":
          "Content-Type":"application/json",
        }
    );
    var result=jsonDecode(response.body);
    if(response.statusCode==200)
    {
      for(int i=0;i<result['results'].length;i++)
      {
        CommonValue.docIdList.add(result['results'][i]['id']);
        docName.add(result['results'][i]['name']);

      }
      setState(() {});

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
    }
    print(result);

    // Navigator.of(context).pop();

  }


  Future<void> downloadDoc(String id) async {
    var url="https://pidone-backend-cloudrun-dev001-v3ieck43fa-el.a.run.app/download-document/$id";
    var urlParse=Uri.parse(url);
    http.Response response=await http.get(
        urlParse,
        headers: {
          // "":
          "Content-Type":"application/json",
        }
    );
    var result=jsonDecode(response.body);
    if(response.statusCode==200)
    {

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
    }
    print(result);

    // Navigator.of(context).pop();

  }


}
