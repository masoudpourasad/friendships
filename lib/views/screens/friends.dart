import 'package:flutter/material.dart';
import 'package:friendships/util/data.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Colors.white70, fontSize: 28),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white70,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: const Divider(
                thickness: 0.1,
              ),
            ),
          );
        },
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          Map friend = friends[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  friend['dp'],
                ),
                radius: 25,
              ),
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                friend['name'],
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14),
              ),
              subtitle: Text(
                friend['status'],
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white54,
                    fontSize: 14),
              ),
              trailing: friend['isAccept']
                  ? TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Unfollow",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                            fontSize: 18),
                      ),
                    )
                  : TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Follow",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                            fontSize: 18),
                      ),
                    ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
