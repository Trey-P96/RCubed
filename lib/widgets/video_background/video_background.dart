//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rcubed/themes/rcubed_theme.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../network_images/network_images.dart';
//
// class BackgroundVideo extends StatefulWidget{
//   const BackgroundVideo({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return BackgroundVideoState();
//   }
//
// }
//
// class BackgroundVideoState extends State<BackgroundVideo>{
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(Images.videoBackground)
//       ..initialize().then((_) =>
//       {
//         _controller.setVolume(0),
//         _controller.setLooping(true),
//         _controller.setPlaybackSpeed(1),
//         _controller.play(),
//         setState(() {})
//       });
//   }
//
//   @override
//   void dispose(){
//     super.dispose();
//     _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return _controller.value.isInitialized?
//     Align(
//       child: FittedBox(
//         fit: BoxFit.fill,
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: SizedBox.expand(
//               child: FittedBox(
//                   fit: BoxFit.cover,
//                   child: Container(
//                       width: _controller.value.size.width,
//                       height: _controller.value.size.height,
//                       color: Colors.white,
//                       child: Opacity(opacity: .3,
//                           child: VideoPlayer(_controller),
//                       )
//                   )
//               )
//           )
//         ),
//       ),
//     )
//         :
//     Container();
//   }
//
// }