import 'package:flutter/material.dart';
import 'package:friendships/util/data.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Colors.white70, fontSize: 28),
        ),
        centerTitle: true,
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
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map notif = notifications[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  notif['dp'],
                ),
                radius: 25,
              ),
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                notif['notif'],
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade300,
                    fontSize: 14),
              ),
              trailing: Text(
                notif['time'],
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white54, fontSize: 11),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
