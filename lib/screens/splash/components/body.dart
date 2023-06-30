import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:kaku/screens/sign_in/sign_in_screen.dart';
import 'package:kaku/size_config.dart';
import 'package:kaku/sharedprefrences.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Selamat Datang di Kaku", "image": "assets/images/splash_1.png"},
    {
      "text": "Kami menawarkan beberapa menu\nyang siap menikmati perut anda",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Kami menawarkan kemudahan untuk memesan",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    Future<String?> sudahIntro = readLocalStorage('sudahIntro');
    debugPrint('tes2');
    if (sudahIntro == 'sudah') {
      debugPrint('tes1');
      setState(() {
        Navigator.pushNamed(context, SignInScreen.routeName);
      });
    } else {
      debugPrint('tes');
      setLocalStorage('sudahIntro', 'sudah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Lanjutkan",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
