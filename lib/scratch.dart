

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:provider/provider.dart';



//RIVER POD DOCUMENTATION
// STATELESS WIDGETS: https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/ConsumerWidget-class.html
// STATEFUL WIDGETS: https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/Consumer-class.html



final numberStateProvider = StateProvider<int>((ref) => 0);

void main(){
  runApp(const ProviderScope(child: ScratchHomePage()));
}

class ScratchHomePage extends StatelessWidget{
  const ScratchHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(home: Scaffold(body: Body()));
  }
}

class Body extends ConsumerWidget{
  const Body({Key? key}) : super(key: key);

  void increment(WidgetRef ref){
    ref.read(numberStateProvider.state).state;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final number = ref.watch(numberStateProvider).toString();
            return Text(number);
          }),
          ElevatedButton(onPressed: (){
            increment(ref);
          }, child: const Text("Press"))
        ],
      ),
    );
  }

}