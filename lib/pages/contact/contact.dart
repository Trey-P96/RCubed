
import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:rcubed/network_images/network_images.dart';

import '../../themes/fonts.dart';
import '../../themes/rcubed_theme.dart';
import '../../widgets/contact_dialog/contact_dialog.dart';
import '../../widgets/nav_bar/nav_bar.dart';


StateProvider<MessageInfo> contactDetails = StateProvider((ref) => MessageInfo());
StateProvider<int> index = StateProvider((ref) => 0);
StateProvider<int> statusCode = StateProvider((ref) => 404);

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

    // personal id's
    // const serviceId = 'service_v0g8ugj';
    // const templateId = 'template_boqz4hs';
    // const publicKey = '6N5P9Mz9o77w3IbIg';

    const serviceId = 'service_dquj6ra';
    const templateId = 'template_alxf3mg';
    const publicKey = 'NJa5aU3eFDivKM_hA';
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
        body: Stack(
          children: [
            //Forced to use mediaquery instead of positioned.fill ... not sure why positioned.fill wouldnt fill background image
            SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: CachedNetworkImage(imageUrl: Images.contactBG, fit: BoxFit.cover,),),

            SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                      children: [

                        Padding(padding: const EdgeInsets.symmetric(vertical: 40),
                        child: CachedNetworkImage(imageUrl: Images.rcubedLogoBlue, width: 340,)),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (input){
                              ref.read(contactDetails.state).state.name = input;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              labelStyle: const TextStyle(fontFamily: DefaultFonts.kumbhsans),
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
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              labelStyle: const TextStyle(fontFamily: DefaultFonts.kumbhsans),
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
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              labelStyle: const TextStyle(fontFamily: DefaultFonts.kumbhsans),
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
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintStyle: const TextStyle(fontFamily: DefaultFonts.kumbhsans),
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                //labelText: "Your message:",
                                hintText: "Message"
                              //helperText: "Your message"
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: IndexedStack(
                            index: ref.watch(index),
                            children: [
                              Center(
                                child: AnimatedButton(
                                  text: 'Submit',
                                  textStyle: const TextStyle(color: Colors.white, fontFamily: DefaultFonts.kumbhsans, fontSize: 22),
                                  selectedBackgroundColor: Colors.black,
                                  selectedTextColor: Colors.white,
                                  borderColor: Colors.transparent,
                                  height: 30,
                                  width: 150,
                                  borderWidth: 0,
                                  borderRadius: 50,
                                  transitionType: TransitionType.LEFT_TOP_ROUNDER,
                                  animatedOn: AnimatedOn.onHover,
                                  animationDuration: const Duration(milliseconds: 350),
                                  backgroundColor: RCubedTheme.primary,
                                  onPress: () {
                                    String name = ref.watch(contactDetails).name;
                                    String email = ref.watch(contactDetails).email;
                                    String subject = ref.watch(contactDetails).subject;
                                    String message = "$name: ${ref.watch(contactDetails).message}";

                                    sendEmail(name: name, email: email, subject: subject, message: message, ref: ref, context: context);

                                    ref.read(index.state).state = 1;
                                  },
                                ),
                              ),

                              const Center(child: CircularProgressIndicator()),
                              Center(
                                  child: ref.watch(statusCode)==200?
                                  RichText(text: const TextSpan(children: [
                                    WidgetSpan(child: Icon(Icons.check_circle, color: Colors.green,)),
                                    TextSpan(text: " MESSAGE SENT", style: TextStyle(color: Colors.green))
                                  ]))
                                      :
                                  RichText(
                                      text: TextSpan(children: [
                                        const WidgetSpan(child: Icon(Icons.clear, color: Colors.red,)),
                                        TextSpan(text: "MESSAGE FAILED DUE TO NETWORK ERROR\n\nStatus Code: ${ref.watch(statusCode)}", style: const TextStyle(color: Colors.red))
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
          ],
        ),
    );
  }

}