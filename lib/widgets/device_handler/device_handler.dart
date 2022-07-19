
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../providers/input_device_provider.dart';

class InputDeviceHandler extends StatefulWidget{
  final Widget child;
  const InputDeviceHandler({required this.child, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputDeviceHandlerState();
  }
}

class InputDeviceHandlerState extends State<InputDeviceHandler>{

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      onPointerHover: (pointer)=>Provider.of<InputDevice>(context,listen: false).updateDevice(pointer.kind),
      onPointerDown: (pointer)=>Provider.of<InputDevice>(context,listen: false).updateDevice(pointer.kind),
      onPointerSignal: (pointer)=>Provider.of<InputDevice>(context,listen: false).updateDevice(pointer.kind),
      child: widget.child,
    );
  }
}