
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../../themes/rcubed_theme.dart';
import '../../widgets/contact_dialog/contact_dialog.dart';
import '../../widgets/nav_bar/nav_bar.dart';


StateProvider<MessageInfo> contactDetails = StateProvider((ref) => MessageInfo());
StateProvider<int> index = StateProvider((ref) => 0);
StateProvider<bool> sent = StateProvider((ref) => false);

class Contact extends ConsumerWidget{
  const Contact({Key? key}) : super(key: key);

  Future sendEmail({
    required WidgetRef ref,
    required BuildContext context,
    required String name,
    required String email,
    required String subject,
    required String message})async{
    ref.read(index.state).state = 1;
    const serviceId = 'service_v0g8ugj';
    const templateId = 'template_boqz4hs';
    const publicKey = '6N5P9Mz9o77w3IbIg';
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json',},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': publicKey,
          'template_params':{
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          }
        })
    );

    if(response.statusCode==200){
      ref.read(sent.state).state=true;
      Future.delayed(const Duration(seconds: 1), (){
        ref.read(index.state).state = 2;
      });
    }
    else{
      ref.read(sent.state).state=false;
      Future.delayed(const Duration(seconds: 1), (){
        ref.read(index.state).state = 2;
      });
    }



    // Future.delayed(const Duration(seconds: 3),(){
    //   Navigator.pop(context);
    // });
    //print(response.statusCode);
  }

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: RCubedTheme.primary,
          centerTitle: true,
          elevation: 5,
          title: SvgPicture.asset("assets/images/contact/contact.svg"),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (input){
                          ref.read(contactDetails.state).state.name = input;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name:",
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (input){
                          ref.read(contactDetails.state).state.email = input;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email:",
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (input){
                          ref.read(contactDetails.state).state.subject = input;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Subject:",
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 10,
                        onChanged: (input){
                          ref.read(contactDetails.state).state.message = input;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //labelText: "Your message:",
                            hintText: "Message"
                          //helperText: "Your message"
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IndexedStack(
                        index: ref.watch(index),
                        children: [
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: RCubedTheme.primary),
                              onPressed: () {
                                String name = ref.watch(contactDetails).name;
                                String email = ref.watch(contactDetails).email;
                                String subject = ref.watch(contactDetails).subject;
                                String message = "$name: ${ref.watch(contactDetails).message}";

                                sendEmail(name: name, email: email, subject: subject, message: message, ref: ref, context: context);
                                // Navigator.pop(context);

                                ref.read(index.state).state = 1;

                              },
                              child: const Text("Submit"),
                            ),
                          ),

                          const Center(child: CircularProgressIndicator()),
                          Center(
                              child: ref.watch(sent)?
                              RichText(text: const TextSpan(children: [
                                WidgetSpan(child: Icon(Icons.check_circle, color: Colors.green,)),
                                TextSpan(text: " MESSAGE SENT", style: TextStyle(color: Colors.green))
                              ]))
                                  :
                              RichText(
                                  text: const TextSpan(children: [
                                    WidgetSpan(child: Icon(Icons.clear, color: Colors.red,)),
                                    TextSpan(text: "MESSAGE FAILED DUE TO NETWORK ERROR", style: TextStyle(color: Colors.red))
                              ]))
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

}