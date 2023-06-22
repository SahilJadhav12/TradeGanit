import 'dart:io';

import 'package:flutter/material.dart';

class CommonValue{
  static String email = "";

//Personal Detail Image
  static File? adhaarFrontBase64;
  static File? adhaarBackBase64;
  static File? panFrontBase64;
  static File? photoBase64;
  static File? passportFrontBase64;
  static File? passportBackBase64;

// Personal Detail Fields
static String fullName="";
static String fatherName="";
static String motherName="";
static String dateOfBirth="";
static String gender="";
static String category="";
static String emailId="";
static String mobileNumber="";
static String address="";
static String city="";
static String state="";
static String pincode="";
static String adhaarNumber="";
static String panNumber="";

//Bank details
static String accountNumber="";
static String accountName="";
static String bankName="";
static String ifscCode="";
static String accountType="";

//Nominee Detail Image
//Personal Detail Image
  static File? adhaarFrontBase64Nominee;
  static File? adhaarBackBase64Nominee;
  static File? panFrontBase64Nominee;
  static File? photoBase64Nominee;
  static File? passportFrontBase64Nominee;
  static File? passportBackBase64Nominee;

// Personal Detail Fields
  static String fullNameNominee="";
  static String fatherNameNominee="";
  static String motherNameNominee="";
  static String dateOfBirthNominee="";
  static String genderNominee="";
  static String categoryNominee="";
  static String emailIdNominee="";
  static String mobileNumberNominee="";
  static String addressNominee="";
  static String cityNominee="";
  static String stateNominee="";
  static String pincodeNominee="";
  static String adhaarNumberNominee="";
  static String panNumberNominee="";

  //
  static bool personalDetailsNavigate=true;
  static bool bankingDetailsNavigate=true;
  static bool addressDetailsNavigate=true;
  static bool nomineeDetailsNavigate=true;
  static bool additionalDetailsNavigate=true;


  //UCC details
  static String ucc="";
  static String dpNumber="";
  static String portfolioSize="";
  static String referenceMedium="";
  static String referenceDescription="";

  //value of Id doc store
  static List<String> docIdList=<String>[];
  static List<String> docIdListName=<String>[];



}