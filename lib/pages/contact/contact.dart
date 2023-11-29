
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
StateProvider<bool> showErrorMessage = StateProvider((ref) => false);

class Contact extends ConsumerWidget{
  const Contact({Key? key}) : super(key: key);

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
              primary: true,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                      children: [

                        //RCUBED LOGO
                        Padding(padding: const EdgeInsets.symmetric(vertical: 40),
                        child: CachedNetworkImage(imageUrl: Images.rcubedLogoBlue, width: 340,)),

                        //NAME INPUT FIELD
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
                              errorText: ref.watch(contactDetails).nameError.isEmpty?null:ref.watch(contactDetails).nameError,
                            ),
                          ),
                        ),

                        //COMPANY NAME INPUT FIELD
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (input){
                              ref.read(contactDetails.state).state.companyName = input;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              labelStyle: const TextStyle(fontFamily: DefaultFonts.kumbhsans),
                              labelText: "Company Name: (optional)",
                            ),
                          ),
                        ),

                        //PHONE NUMBER INPUT FIELD
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (input){
                              ref.read(contactDetails.state).state.phone = input;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              labelStyle: const TextStyle(fontFamily: DefaultFonts.kumbhsans),
                              labelText: "Phone: (optional)",
                            ),
                          ),
                        ),

                        //EMAIL INPUT FIELD
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
                              errorText: ref.watch(contactDetails).emailError.isEmpty?null:ref.watch(contactDetails).emailError,
                            ),
                          ),
                        ),

                        //SUBJECT INPUT FIELD
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
                              labelText: "Subject: (optional)",
                            ),
                          ),
                        ),

                        //MESSAGE INPUT FIELD
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
                                hintText: "Message",
                                errorText: ref.watch(contactDetails).messageError.isEmpty?null:ref.watch(contactDetails).messageError,
                              //helperText: "Your message"
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: IndexedStack(
                            index: ref.watch(index),
                            children: [

                              //index 0
                              Column(
                                children: [
                                  //TOGGLE FOR NOTIFYING USER INPUT ERROR
                                  Visibility(visible: ref.watch(showErrorMessage), child: const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text("Please fill required fields above.", style: TextStyle(color: Colors.red),),
                                  )),

                                  //SEND BUTTON
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
                                        ref.read(contactDetails).processUserInput(ref);

                                        //scrolls to bottom of page for user to see any error messages.
                                        Future.delayed(const Duration(milliseconds: 100), (){
                                          PrimaryScrollController.of(context)?.animateTo(
                                              PrimaryScrollController.of(context)!.position.maxScrollExtent,
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.easeInOut);
                                        });

                                      },
                                    ),
                                  ),
                                ],
                              ),

                              //index 1
                              const Center(child: CircularProgressIndicator()),

                              //index 2
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
                                        TextSpan(text: "Message failed due to network error.\n\nStatus Code: ${ref.watch(statusCode)}", style: const TextStyle(color: Colors.red))
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