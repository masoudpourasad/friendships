import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:friendships/login/welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: FadeIn(
            duration: const Duration(milliseconds: 3000),
            child: Text(
              'The Manimalist',
              style: GoogleFonts.dancingScript(
                letterSpacing: 0.5,
                color: Colors.grey.shade400,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: WelcomePage()));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/women2.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeInRight(
                  duration: const Duration(milliseconds: 3000),
                  child: Text(
                    "Welcome To The Minimalist",
                    style: GoogleFonts.dancingScript(
                      color: Colors.grey.shade100,
                      fontSize: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 1800),
                  child: FadeInLeft(
                    child: Text(
                      "Let's Start Discover New Connections",
                      style: GoogleFonts.dancingScript(
                        color: Colors.grey.shade400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 2000),
                  child: Text(
                    "Find Your Friends ",
                    style: GoogleFonts.dancingScript(
                      color: Colors.grey.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 2200),
                  child: Text(
                    "Friendship Discovery,Connect & Explore",
                    style: GoogleFonts.dancingScript(
                      color: Colors.grey.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 2400),
                  child: Text(
                    "Friendship Quest,New Bonds Await",
                    style: GoogleFonts.dancingScript(
                      color: Colors.grey.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 2600),
                  child: Text(
                    "Explore Connections,Friend Finder",
                    style: GoogleFonts.dancingScript(
                      color: Colors.grey.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 2800),
                  child: Text(
                    "Connect & Thrive,Embark on Friendship",
                    style: GoogleFonts.dancingScript(
                      color: Colors.grey.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeIn(
                        duration: const Duration(milliseconds: 3200),
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: hide == false
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        Text(
                                          "Get Start",
                                          style: GoogleFonts.dancingScript(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ])
                                : Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          colors: [
                                            Colors.black.withOpacity(.8),
                                            Colors.white.withOpacity(.3),
                                            Colors.black.withOpacity(.2),
                                          ]),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
