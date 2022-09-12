
import 'dart:html';
import 'dart:io' show Platform;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbeddedWebPage extends StatefulWidget{
  final String url;
  const EmbeddedWebPage({required this.url, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EmbeddedWebPageState();
  }
}

class EmbeddedWebPageState extends State<EmbeddedWebPage>{

  @override
  void initState(){
    super.initState();
    IFrameElement _iFrameElement = IFrameElement();
    _iFrameElement.src = widget.url;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
          (int viewId) => _iFrameElement,
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: HtmlElementView(viewType: 'iframeElement'),
    );
  }

}