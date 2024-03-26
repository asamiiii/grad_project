import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class LettersView extends StatefulWidget {
  const LettersView({super.key});

  @override
  State<LettersView> createState() => _LettersViewState();
}

class _LettersViewState extends State<LettersView> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            //! Screen Cover For Letters Screen
            Image.asset(
              'assets/images/letters_cover.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                top: 30,
                left: 10,
                child: Image.asset(
                  'assets/images/letter_close.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                )),

            //! To Left Button
            Positioned(
                top: 10,
                left: 10,
                child: SizedBox(
                    height: screenHight * 0.90,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/letter_to_left.png',
                          height: 40,
                          width: 40,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ))),

            //! To Right Button
            Positioned(
                top: 10,
                right: 10,
                child: SizedBox(
                    height: screenHight * 0.90,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/letter_to_right.png',
                          height: 40,
                          width: 40,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ))),

            //! White borad
            Positioned(
                top: 20,
                // right: 10,
                child: SizedBox(
                    height: screenHight * 0.90,
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/white_board.png',
                              height: screenHight * 0.80,
                              width: screenWidth * 0.80,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ],
                    ))),

                    
            Positioned(
                bottom: 5,
                // right: 10,
                child: SizedBox(
                    height: screenHight * 0.30,
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                              'assets/images/letter_duck.png',
                              height: 80,
                              width: 130,
                              fit: BoxFit.fill,
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/letter_girl_1.png',
                              height: 125,
                              width: 85,
                              fit: BoxFit.fill,
                            ),
                            Image.asset(
                              'assets/images/letter_girl_2.png',
                              height: 90,
                              width: 76,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        Image.asset(
                              'assets/images/letter_girl_3.png',
                              height: 100,
                              width: 190,
                              fit: BoxFit.fill,
                            ),

                            
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
