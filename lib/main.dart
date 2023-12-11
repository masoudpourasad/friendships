import 'package:animate_do/animate_do.dart';
import 'package:friendships/login/createaccount.dart';
import 'package:flutter/material.dart';
import 'package:friendships/login/welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
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
                      type: PageTransitionType.fade,
                      child: const Createaccount()));
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
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/fit-model-posing-dark-studio_651396-650.jpg?w=1380&t=st=1702305648~exp=1702306248~hmac=1d0a635d86a9e451abb7c3ae6b1bcd65f1fb0e2a99858f8439e342eb293ca1a1'),
              fit: BoxFit.cover),
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
                  child: Text("Welcome To Friendships",
                      style: GoogleFonts.dancingScript(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 1200),
                  child: FadeInLeft(
                    child: Text(
                      "Let's Start Discover New Connections",
                      style: GoogleFonts.dancingScript(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 1400),
                  child: Text(
                    "Find Your Friends ",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 1600),
                  child: Text(
                    "Friendship Discovery,Connect & Explore",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 1800),
                  child: Text(
                    "Friendship Quest,New Bonds Await",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 2000),
                  child: Text(
                    "Explore Connections,Friend Finder",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 2200),
                  child: Text(
                    "Connect & Thrive,Embark on Friendship",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
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
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 3000),
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
                                    color: Colors.transparent,
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
