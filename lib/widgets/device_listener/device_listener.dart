
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/device_provider.dart';

StateProvider<PointerDeviceKind> device = StateProvider((ref) => PointerDeviceKind.touch);

class DeviceListener extends ConsumerWidget{
  final Widget child;
  const DeviceListener({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return Listener(
      onPointerHover: (pointer){
        // Provider.of<DeviceProvider>(context, listen: false).updateDevice(pointer.kind);
        if(pointer.kind != ref.watch(device)){
          ref.read(device.state).state=pointer.kind;
        }


      },
      onPointerDown: (pointer){
        // Provider.of<DeviceProvider>(context, listen: false).updateDevice(pointer.kind);
        if(pointer.kind != ref.watch(device)){
          ref.read(device.state).state=pointer.kind;
        }

      },
      child: child,
    );
  }

}