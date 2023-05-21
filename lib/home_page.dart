import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        _onScroll();
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _scrollOffset = 0.0;
  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
      print(_scrollOffset);
    });
  }

  //Speeds:
  final double _layer1Speed = 0.5;
  final double _layer2Speed = 0.45;
  final double _layer3Speed = 0.42;
  final double _layer4Speed = 0.375;
  final double _sunSpeed = 0.2;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final layoutHeight = screenSize.height * 3;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 66, 240, 210),
                Color.fromARGB(255, 253, 244, 193),
              ]),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: screenSize.height * .5 + (_scrollOffset * _sunSpeed),
              left: 0,
              right: screenSize.width * .3,
              child: SvgPicture.asset('lib/parallax/assets/sun.svg'),
            ),
            Positioned(
              bottom: -10 + _layer4Speed * _scrollOffset,
              left: 0,
              right: 0,
              child:
                  SvgPicture.asset('lib/parallax/assets/mountains-layer-4.svg'),
            ),
            Positioned(
              bottom: -10 + _layer3Speed * _scrollOffset,
              left: 0,
              right: 0,
              child:
                  SvgPicture.asset('lib/parallax/assets/mountains-layer-2.svg'),
            ),
            Positioned(
              bottom: -10 + _layer2Speed * _scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset('lib/parallax/assets/trees-layer-2.svg'),
            ),
            Positioned(
              bottom: -60 + _layer1Speed * _scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset('lib/parallax/assets/layer-1.svg'),
            ),
            Positioned(
              top: screenSize.height + (_layer1Speed * _scrollOffset * -1),
              left: 0,
              right: 0,
              height: screenSize.height,
              child: Container(
                color: Colors.black,
              ),
            ),
            //ScrollerView
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: SizedBox(
                  height: layoutHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
