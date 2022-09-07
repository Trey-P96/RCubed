
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier{
  String _name = "", _email="", _subject="", _message="";

  set name(name){_name = name;}
  set email(email){_email = email;}
  set subject(subject){_subject = subject;}
  set message(message){_message = message;}

  String get name=>_name;
  String get email=>_email;
  String get subject=>_subject;
  String get message=>_message;
}