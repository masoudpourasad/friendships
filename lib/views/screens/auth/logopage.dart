import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:friendships/views/screens/auth/signup.dart';
import 'package:page_transition/page_transition.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('The',
                    style: Theme.of(context).textTheme.copyWith().labelLarge),
                Text('Minimalist',
                    style: Theme.of(context).textTheme.copyWith().labelLarge),
              ],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 7000),
                      child: Text("Welcome To Minimalist",
                          style: Theme.of(context)
                              .textTheme
                              .copyWith()
                              .labelLarge),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 5000),
                      child: Text("Let's Start Discover New Connections,",
                          style: Theme.of(context)
                              .textTheme
                              .copyWith()
                              .labelSmall),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 5200),
                      child: Text("Find Your Friends,",
                          style: Theme.of(context)
                              .textTheme
                              .copyWith()
                              .labelSmall),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 5400),
                      child: Text("Friendship Discovery,Connect & Explore,",
                          style: Theme.of(context)
                              .textTheme
                              .copyWith()
                              .labelSmall),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 5600),
                      child: Text("Friendship Quest,New Bonds Await,",
                          style: Theme.of(context)
                              .textTheme
                              .copyWith()
                              .labelSmall),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 5800),
                      child: Text("Explore Connections,Friend Finder,",
                          style: Theme.of(context)
                              .textTheme
                              .copyWith()
                              .labelSmall),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 6000),
                      child: Text("Connect & Thrive,Embark on Friendship...",
                          style: Theme.of(context)
                              .textTheme
                              .copyWith()
                              .labelSmall),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                            Text("Get Start",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .copyWith()
                                                    .labelLarge),
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
