//
//
// import 'dart:ui';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:rcubed/providers/primary_scroll_provider.dart';
// import 'package:rcubed/themes/rcubed_theme.dart';
//
// import '../../pages/page.dart';
// import '../blurred_box/blurred_box.dart';
//
//
// class CoverPage extends StatelessWidget{
//   final String backgroundPath;
//   final String titlePath;
//   final int page;
//   const CoverPage({required this.titlePath, required this.backgroundPath, required this.page, Key? key}) : super(key: key);
//   PageState? parent(BuildContext context)=>context.findAncestorStateOfType<PageState>();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Stack(
//       children: [
//         // ImageNetwork(image: backgroundPath, height: 150, width: 150, imageCache: CachedNetworkImageProvider(backgroundPath), fullScreen: true,),
//         Positioned.fill(child: CachedNetworkImage(
//          // placeholder: (context, url)=> SizedBox(height: 100, width: 100, child: CircularProgressIndicator()),
//           fit: BoxFit.cover,
//           imageUrl: backgroundPath,)),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               children: [
//                 Align(
//                   child: Padding(
//                     padding: const EdgeInsets.all(50.0),
//                     child: Container(
//                       constraints: const BoxConstraints(maxWidth: 500),
//                       child: ClipRRect(
//                         child: AspectRatio(
//                           aspectRatio: 8,
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
//                             child: Container(
//                               //child: FittedBox(fit: BoxFit.fitWidth, child: SvgPicture.asset("assets/images/what_we_do/what_we_do.svg")),
//                               color: Colors.black.withOpacity(0.5),),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Align(
//                   child: Padding(
//                     padding: const EdgeInsets.all(50.0),
//                     child: Container(
//                       constraints: const BoxConstraints(maxWidth: 500),
//                       child: ClipRRect(
//                         child: AspectRatio(
//                           aspectRatio: 8,
//                           child: Container(
//                             child: FittedBox(fit: BoxFit.fitHeight, child: SvgPicture.asset(titlePath, color: Colors.white,)),
//                             color: Colors.transparent),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30, bottom: 10),
//                 child: SizedBox(width: 300, height: 50,
//                     child: ElevatedButton(
//                         onPressed: (){
//                           parent(context)?.animateTo();
//                           Provider.of<PrimaryScrollProvider>(context, listen: false).getKey().currentState?.animateTo(page);
//                         },
//                         style: ElevatedButton.styleFrom(primary: RCubedTheme.primary, elevation: 25),
//                         child: const Text("LEARN MORE"))),
//               ),
//             )
//
//
//           ],
//         ),
//       ],
//     );
//   }
//
// }
//
//
//
// // ClipRRect(
// // borderRadius: BorderRadius.circular(radius),
// // child: BackdropFilter(
// // filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
// // child: FittedBox(
// // child: Container(
// // alignment: Alignment.center,
// // width: width,
// // height: height,
// // color: color.withOpacity(opacity),
// // child: Align(
// // alignment: Alignment.center,
// // child: child,
// // ),
// // ),
// // ),
// // ),
// // ),