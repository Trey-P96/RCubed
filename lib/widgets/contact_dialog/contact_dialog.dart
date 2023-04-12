
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/contact_form_provider.dart';
import 'package:rcubed/pages/contact/contact.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:http/http.dart' as http;


StateProvider<MessageInfo> contactDetails = StateProvider((ref) => MessageInfo());

class MessageInfo{
  String name = "";
  String companyName = "none";
  String phone = "none";
  String email = "";
  String subject = "No Subject";
  String message = "";

  String emailError = "";
  String nameError = "";
  String messageError = "";

  MessageInfo();

  void resetErrors(WidgetRef ref){
    emailError = "";
    nameError = "";
    messageError = "";
    ref.read(showErrorMessage.state).state = false;
  }

  void processUserInput(WidgetRef ref){
    resetErrors(ref);

    if(name.isEmpty){
      ref.read(showErrorMessage.state).state = true;
      nameError = "Invalid Name";
    }

    if(email.isEmpty || !email.contains("@")){
      ref.read(showErrorMessage.state).state = true;
      emailError = "Invalid Email";
    }

    if(message.isEmpty){
      ref.read(showErrorMessage.state).state = true;
      messageError = "Invalid Message";
    }

    if(!ref.watch(showErrorMessage)){
      sendEmail(ref: ref);
      ref.read(index.state).state = 1;
    }
  }


  Future sendEmail({required WidgetRef ref,})async{

    // personal id's
    const serviceId = 'service_v0g8ugj';
    const templateId = 'template_ahiewbf';
    const publicKey = 'YfMq0KnyoF2lXik3X';

    // rcubed id's
    // const serviceId = 'service_dquj6ra';
    // const templateId = 'template_alxf3mg';
    // const publicKey = 'NJa5aU3eFDivKM_hA';
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
            'user_message': "$name: $message",
            'user_phone' : phone,
            'company' : companyName,
          }
        })
    );

    if(response.statusCode==200){
      ref.read(statusCode.state).state=200;
      Future.delayed(const Duration(seconds: 1), (){
        ref.read(index.state).state = 2;
      });
    }
    else{
      ref.read(statusCode.state).state=response.statusCode;
      Future.delayed(const Duration(seconds: 1), (){
        ref.read(index.state).state = 2;
      });
    }



    // Future.delayed(const Duration(seconds: 3),(){
    //   Navigator.pop(context);
    // });
    //print(response.statusCode);
  }


}

class ContactForm extends ConsumerWidget{
  const ContactForm({Key? key}) : super(key: key);

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message})async{

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
    //print(response.statusCode);
  }

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("CONTACT"),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (input){
                          // Provider.of<ContactProvider>(context, listen: false).name = input;
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
                          // Provider.of<ContactProvider>(context, listen: false).email = input;
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
                          // Provider.of<ContactProvider>(context, listen: false).subject = input;
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
                          // Provider.of<ContactProvider>(context, listen: false).message = input;
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
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: RCubedTheme.primary),
                          onPressed: () {
                            // String name = Provider.of<ContactProvider>(context, listen: false).name;
                            // String email = Provider.of<ContactProvider>(context, listen: false).email;
                            // String subject = Provider.of<ContactProvider>(context, listen: false).subject;
                            // String message = Provider.of<ContactProvider>(context, listen: false).message;
                            String name = ref.watch(contactDetails).name;
                            String email = ref.watch(contactDetails).email;
                            String subject = ref.watch(contactDetails).subject;
                            String message = ref.watch(contactDetails).message;

                            sendEmail(name: name, email: email, subject: subject, message: message);
                            Navigator.pop(context);

                          },
                          child: const Text("Submit"),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}