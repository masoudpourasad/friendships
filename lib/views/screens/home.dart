import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendships/views/widgets/post_item.dart';
import 'package:friendships/util/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Feeds",
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Colors.white70, fontSize: 28),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white70,
              ))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          Map post = posts[index];
          return PostItem(
            img: post['img'],
            name: post['name'],
            dp: post['dp'],
            time: post['time'],
          );
        },
      ),
    );
  }
}
