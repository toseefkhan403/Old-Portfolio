import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IFrame extends StatefulWidget {
  final bool isAndroid;

  const IFrame({required this.isAndroid, Key? key}) : super(key: key);

  @override
  State<IFrame> createState() => _IFrameState();
}

class _IFrameState extends State<IFrame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 20),
      child: SizedBox(
        height: 600,
        width: 300,
        child: Stack(
          children: [
            widget.isAndroid
                ? Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        Uri url = Uri.parse(
                            'https://appetize.io/embed/ag_mxfsgeig72bumo6lyrpu3per54?device=pixel4&osVersion=12.0&scale=70&autoplay=true');
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      child: const Text('Tap to redirect to Android emulator'),
                    ),
                  )
                : Container(),
            widget.isAndroid
                ? Container()
                : Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        Uri url = Uri.parse(
                            'https://appetize.io/embed/ag_ihj33wjg6a7efmoh4mqv5fcmoa?scale=66&autoplay=true');
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      child: const Text('Tap to redirect to iOS simulator'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
