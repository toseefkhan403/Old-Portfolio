import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:portfolio/components/iframe.dart';
import 'package:portfolio/ui/theme.dart';
import 'package:portfolio/ui/up_fade_animation.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/ui/corner_bottom_painter.dart';
import 'package:portfolio/ui/corner_top_painter.dart';
import 'package:portfolio/ui/navigation_bar.dart' as nav_bar;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Color color1;
  late Color color2;
  late Color color1Copy;
  late Color color2Copy;
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isAndroid = false;

  String description =
      "I am a mobile developer with 2 years of experience specializing in Flutter. I'm passionate about creating elegant and user-friendly applications. \nWith expertise in Flutter, I have built cross-platform apps that deliver exceptional performance. \nCheck out some of my apps in the emulator!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1100 && constraints.maxHeight > 480) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: MouseRegion(
            onEnter: swapColors,
            onExit: swapColors,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomPaint(
                    size: const Size(300, 300),
                    painter: CornerTopPainter(_animation, color1, color2),
                  ),
                ),
                const Align(
                    alignment: Alignment.topCenter,
                    child: nav_bar.NavigationBar()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: introWidget(color1Copy, color2Copy)),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: ToggleSwitch(
                            minWidth: 120.0,
                            cornerRadius: 20.0,
                            initialLabelIndex: isAndroid ? 0 : 1,
                            activeFgColor: Colors.black,
                            inactiveBgColor: Colors.blueGrey,
                            inactiveFgColor: Colors.white,
                            totalSwitches: 2,
                            labels: const ['Android', 'iOS'],
                            icons: const [
                              MaterialIcons.android,
                              FontAwesome5Brands.apple
                            ],
                            iconSize: 24,
                            activeBgColors: const [
                              [Colors.lightGreen],
                              [Colors.white]
                            ],
                            onToggle: (index) {
                              print('switched to: $index $isAndroid');
                              if (index == 0) {
                                isAndroid = true;
                              } else if (index == 1) {
                                isAndroid = false;
                              }

                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      IFrame(
                        isAndroid: isAndroid,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomPaint(
                    size: const Size(300, 300),
                    painter: CornerBottomPainter(_animation, color1, color2),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return smallScreenLayout();
      }
    }));
  }

  smallScreenLayout() {
    return MouseRegion(
      onEnter: swapColors,
      onExit: swapColors,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomPaint(
              size: const Size(300, 300),
              painter: CornerTopPainter(_animation, color1, color2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView(
              children: [
                // top half
                const nav_bar.NavigationBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: introWidget(color1Copy, color2Copy),
                ),

                // bottom half
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: ToggleSwitch(
                          minWidth: 120.0,
                          cornerRadius: 20.0,
                          initialLabelIndex: isAndroid ? 0 : 1,
                          activeFgColor: Colors.black,
                          inactiveBgColor: Colors.blueGrey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ['Android', 'iOS'],
                          icons: const [
                            MaterialIcons.android,
                            FontAwesome5Brands.apple
                          ],
                          iconSize: 24,
                          activeBgColors: const [
                            [Colors.lightGreen],
                            [Colors.white]
                          ],
                          onToggle: (index) {
                            print('switched to: $index $isAndroid');
                            if (index == 0) {
                              isAndroid = true;
                            } else if (index == 1) {
                              isAndroid = false;
                            }

                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    IFrame(
                      isAndroid: isAndroid,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomPaint(
              size: const Size(300, 300),
              painter: CornerBottomPainter(_animation, color1, color2),
            ),
          ),
        ],
      ),
    );
  }

  swapColors(_) {
    // swap the colors
    var temp = color1;
    color1 = color2;
    color2 = temp;
    _controller.reset();
    _controller.forward();
    setState(() {});
  }

  introWidget(Color color1, Color color2) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Toseef Ali Khan',
                textStyle: const TextStyle(fontSize: 56.0, height: 1.2),
                speed: const Duration(milliseconds: 340),
              ),
            ],
            totalRepeatCount: 1,
          ),
          UpFadeAnimation(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: cornerGradient(color1, color2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/me.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 3,
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: cornerGradient(color1, color2),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 70, top: 5),
                    child: Column(
                      children: [
                        Text(
                          description,
                        ),
                        cvButton(color1, color2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  cvButton(Color color1, Color color2) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: MouseRegion(
        onEnter: (_) {
          print('on enter');
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          print('on exit');
          setState(() {
            isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: () async {
            // download the cv
            if (!await launchUrl(Uri.parse(
                "https://github.com/toseefkhan403/toseefkhan403.github.io/blob/main/Resume.pdf"))) {
              throw Exception('Could not launch');
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 130,
              child: Column(
                children: [
                  Text(
                    "Download CV",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context)
                            .iconTheme
                            .color!
                            .withOpacity(isHovered ? 1 : 0.85)),
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: cornerGradient(isHovered ? color2 : color1,
                          isHovered ? color1 : color2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    color1 = getRandomColor();
    color2 = getRandomColor();
    color1Copy = color1;
    color2Copy = color2;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
