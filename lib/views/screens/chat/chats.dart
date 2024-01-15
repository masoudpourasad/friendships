import 'package:flutter/material.dart';
import 'package:friendships/views/widgets/chat_item.dart';
import 'package:friendships/util/data.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white70,
            ),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          dividerHeight: 0,
          controller: _tabController,
          indicatorColor: Colors.white60,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text(
                "Message",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.white60, fontSize: 22),
              ),
            ),
            Tab(
              child: Text(
                "Groups",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.white60, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView.separated(
            padding: const EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: const Divider(thickness: 0.1),
                ),
              );
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              Map chat = chats[index];
              return ChatItem(
                dp: chat['dp'],
                name: chat['name'],
                isOnline: chat['isOnline'],
                counter: chat['counter'],
                msg: chat['msg'],
                time: chat['time'],
              );
            },
          ),
          ListView.separated(
            padding: const EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: const Divider(thickness: 0.1),
                ),
              );
            },
            itemCount: groups.length,
            itemBuilder: (BuildContext context, int index) {
              Map chat = groups[index];
              return ChatItem(
                dp: chat['dp'],
                name: chat['name'],
                isOnline: chat['isOnline'],
                counter: chat['counter'],
                msg: chat['msg'],
                time: chat['time'],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
