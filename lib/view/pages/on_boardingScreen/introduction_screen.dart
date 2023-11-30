import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:scipro_application/view/colors/colors.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25.0,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      // autoScrollDuration: 1000,
      infiniteAutoScroll: false,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        // child: SafeArea(
        //   child:
        //   Padding(
        //     padding: const EdgeInsets.only(top: 16, right: 16),
        //     child: _buildImage('flutter.png', 100),
        //   ),
        // ),
      ),

      // ),
      pages: [
        PageViewModel(
          image: Image.asset('assets/images/SCIPRO.png'),
          title: "WELCOME TO",
          body: "SCIPRO",
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset('assets/images/SCIPRO.png'),
          title: "Your Dream JOB Is Just a Finger Tip Away",
          body: "SCIPRO",
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset('assets/images/SCIPRO.png'),
          title: "Welcome To new Phase of Education",
          body: "SCIPRO",
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset('assets/images/SCIPRO.png'),
          title: "Thank you for your patience please wait",
          body: "SCIPRO",
          footer: Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: SizedBox(
              height: 80.h,
              width: double.infinity,
              // decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //     gradient: LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomLeft,
              //       colors: [
              //         Color.fromARGB(251, 235, 111, 152),
              //         Color.fromARGB(255, 255, 103, 92),
              //       ],
              //     )),
              child: ElevatedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColorBlue,
                  shape: const RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(20.0),
                      ),
                ),
                child: Text(
                  'Launch App',
                  style: TextStyle(color: Colors.white, fontSize: 22.sp),
                ),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        // PageViewModel(
        //   image: Image.asset('assets/images/SCIPRO.png'),
        //   title: "Full Screen Page",
        //   body:
        //       "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
        //   decoration: pageDecoration.copyWith(
        //     contentMargin: const EdgeInsets.symmetric(horizontal: 16),
        //     fullScreen: true,
        //     bodyFlex: 2,
        //     imageFlex: 3,
        //     safeArea: 100,
        //   ),
        // ),
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   image: _buildImage('img2.jpg'),
        //   footer: ElevatedButton(
        //     onPressed: () {
        //       introKey.currentState?.animateScroll(0);
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.lightBlue,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //     ),
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 6,
        //     imageFlex: 6,
        //     safeArea: 80,
        //   ),
        // ),
        // PageViewModel(
        //   title: "Title of last page - reversed",
        //   bodyWidget: const Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text("Click on ", style: bodyStyle),
        //       Icon(Icons.edit),
        //       Text(" to edit a post", style: bodyStyle),
        //     ],
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 2,
        //     imageFlex: 4,
        //     bodyAlignment: Alignment.bottomCenter,
        //     imageAlignment: Alignment.topCenter,
        //   ),
        //   image: _buildImage('img1.jpg'),
        //   reverse: true,
        // ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: EdgeInsets.all(16.sp),
      controlsPadding: kIsWeb
          ? EdgeInsets.all(12.0.sp)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: const Color(0xFFBDBDBD),
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0.sp)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
