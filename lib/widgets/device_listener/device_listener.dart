//
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:rcubed/providers/device_provider.dart';
//
// class DeviceListener extends StatelessWidget{
//   final Widget child;
//   const DeviceListener({required this.child, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Listener(
//       onPointerHover: (pointer){
//         Provider.of<DeviceProvider>(context, listen: false).updateDevice(pointer.kind);
//       },
//       onPointerDown: (pointer){
//         Provider.of<DeviceProvider>(context, listen: false).updateDevice(pointer.kind);
//       },
//       child: child,
//     );
//   }
//
// }