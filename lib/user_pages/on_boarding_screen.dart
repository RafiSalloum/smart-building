import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled3/shared/themes.dart';
import 'package:untitled3/user_pages/login_screen.dart';

class OnBoarding {
  final String image;
  final String title;
  final String desc;

  OnBoarding({required this.image, required this.title, required this.desc});
}

List<OnBoarding> board = [
  OnBoarding(
      image: 'assets/images/Smart home-pana.png',
      title: 'Welcome to your Smart Building!',
      desc: 'Get Started...'),
  OnBoarding(
      image: 'assets/images/Smart home-cuate.png',
      title: 'Take control of all what you need.',
      desc: 'House, Garage and Garden!'),
  OnBoarding(
      image: 'assets/images/Smart home-amico.png',
      title: 'Let\'s Start!',
      desc: 'Tap to go!'),
];
bool isLast = false;

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Smart Building',
          style: TextStyle(
            color: mainColor,
            fontFamily: 'MonoB',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: Text(
              'SKIP',
              style: TextStyle(fontFamily: 'MonoB',
              color: mainColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == board.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    onBoardingBuilder(board[index]),
                itemCount: 3,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Center(
                  child: SmoothPageIndicator(
                    controller: boardController,
                    count: board.length,
                    effect: JumpingDotEffect(
                        activeDotColor: mainColor,
                        dotColor: Colors.grey,
                        radius: 10.0,
                        dotWidth: 15.0,
                        dotHeight: 15.0),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    FloatingActionButton(
                      elevation: 10.0,
                      onPressed: () {
                        if (isLast) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } else {
                          boardController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOutBack,
                          );
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget onBoardingBuilder(OnBoarding model) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontFamily: 'Mono',
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(
          model.desc,
          style: mainTheme().textTheme.displayMedium,
        ),
      ],
    ),
  );
}
