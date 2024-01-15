import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friendships/views/widgets/chat_bubble.dart';
import 'package:friendships/util/data.dart';
import 'package:google_fonts/google_fonts.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  static Random random = Random();
  String name = names[random.nextInt(10)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: InkWell(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/cm${random.nextInt(10)}.jpeg",
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Online",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 35, 247, 145),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              color: Colors.white,
              Icons.more_horiz,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: conversation.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  Map msg = conversation[index];
                  return ChatBubble(
                    message: msg['type'] == "text"
                        ? messages[random.nextInt(10)]
                        : "assets/images/cm${random.nextInt(10)}.jpeg",
                    username: msg["username"],
                    time: msg["time"],
                    type: msg['type'],
                    replyText: msg["replyText"],
                    isMe: msg['isMe'],
                    isGroup: msg['isGroup'],
                    isReply: msg['isReply'],
                    replyName: name,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomAppBar(
                color: Colors.black,
                elevation: 0,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 80,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Flexible(
                        child: TextField(
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  fontFamily:
                                      GoogleFonts.dancingScript().fontFamily,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Write your message...",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontFamily:
                                      GoogleFonts.dancingScript().fontFamily,
                                  color: Colors.white60,
                                ),
                          ),
                          maxLines: null,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
