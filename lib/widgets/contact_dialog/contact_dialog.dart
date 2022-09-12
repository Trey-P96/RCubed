
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/contact_form_provider.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:http/http.dart' as http;

class ContactForm extends StatelessWidget{
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
  Widget build(BuildContext context) {
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
                          Provider.of<ContactProvider>(context, listen: false).name = input;
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
                          Provider.of<ContactProvider>(context, listen: false).email = input;
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
                          Provider.of<ContactProvider>(context, listen: false).subject = input;
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
                          Provider.of<ContactProvider>(context, listen: false).message = input;
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
                            String name = Provider.of<ContactProvider>(context, listen: false).name;
                            String email = Provider.of<ContactProvider>(context, listen: false).email;
                            String subject = Provider.of<ContactProvider>(context, listen: false).subject;
                            String message = Provider.of<ContactProvider>(context, listen: false).message;

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