import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendships/util/extensions.dart';
import 'package:friendships/views/screens/auth_screen.dart';
import 'package:friendships/views/widgets/animations/fade_page_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String documentsDirectory = "Loading...";

  @override
  void initState() {
    super.initState();
    _getDocumentsDirectory();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          FadePageRoute(
            (const LogoPage()),
          ));
    });
  }

  Future<void> _getDocumentsDirectory() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      setState(() {
        documentsDirectory = directory.path;
      });
    } catch (error) {
      if (kDebugMode) {
        print("Error getting documents directory: $error");
      }
      setState(() {
        documentsDirectory = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: FadeIn(
            duration: const Duration(milliseconds: 3000),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('The',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontSize: 62))
                    .fadeInList(1, true),
                Text('Minimalist',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontSize: 62))
                    .fadeInList(2, true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> with TickerProviderStateMixin {
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
              Navigator.push(context, FadePageRoute(const AuthScreen()));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/women2.jpg'),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 7000),
                      child: Text("Welcome To Minimalist",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 5000),
                      child: Text(
                        "Let's Start Discover New Connections,",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontFamily:
                                    GoogleFonts.dancingScript().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 5200),
                      child: Text(
                        "Find Your Friends,",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontFamily:
                                    GoogleFonts.dancingScript().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 5400),
                      child: Text(
                        "Friendship Discovery,Connect & Explore,",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontFamily:
                                    GoogleFonts.dancingScript().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 5600),
                      child: Text(
                        "Friendship Quest,New Bonds Await,",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontFamily:
                                    GoogleFonts.dancingScript().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 5800),
                      child: Text(
                        "Explore Connections,Friend Finder,",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontFamily:
                                    GoogleFonts.dancingScript().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 6000),
                      child: Text(
                        "Connect & Thrive,Embark on Friendship...",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontFamily:
                                    GoogleFonts.dancingScript().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                            Text("Get Start",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500)),
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
        ),
      ),
    );
  }
}
