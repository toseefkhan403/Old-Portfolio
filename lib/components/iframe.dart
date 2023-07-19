import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IFrame extends StatefulWidget {
  final bool isAndroid;

  const IFrame({required this.isAndroid, Key? key}) : super(key: key);

  @override
  State<IFrame> createState() => _IFrameState();
}

class _IFrameState extends State<IFrame> {
  Widget? _iframeWidget;
  Widget? _iframeWidgetiOS;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 20),
      child: SizedBox(
        height: 600,
        width: 300,
        child: Stack(
          children: [
            AnimatedOpacity(
                opacity: widget.isAndroid ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: _iframeWidget!),
            AnimatedOpacity(
                opacity: widget.isAndroid ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                child: _iframeWidgetiOS!),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    final IFrameElement _iframeElement = IFrameElement();
    _iframeElement.height = '700';
    _iframeElement.width = '320';
    // autoplay = true in prod
    _iframeElement.src =
        'https://appetize.io/embed/ag_mxfsgeig72bumo6lyrpu3per54?device=pixel4&osVersion=12.0&scale=70';
    _iframeElement.style.border = 'none';
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );

    // for iOS
    final IFrameElement _iframeElement2 = IFrameElement();
    _iframeElement2.height = '700';
    _iframeElement2.width = '320';
    // autoplay = true in prod
    _iframeElement2.src =
        'https://appetize.io/embed/ag_ihj33wjg6a7efmoh4mqv5fcmoa?scale=66&autoplay=true';
    _iframeElement2.style.border = 'none';
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement2',
      (int viewId) => _iframeElement2,
    );

    _iframeWidgetiOS = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement2',
    );
  }
}
