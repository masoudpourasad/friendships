import 'dart:math';

import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  final String message, time, username, type, replyText, replyName;
  final bool isMe, isGroup, isReply;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.time,
      required this.isMe,
      required this.isGroup,
      required this.username,
      required this.type,
      required this.replyText,
      required this.isReply,
      required this.replyName});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  List colors = Colors.primaries;
  static Random random = Random();
  int rNum = random.nextInt(18);

  Color chatBubbleColor() {
    if (widget.isMe) {
      return Theme.of(context).colorScheme.background;
    } else {
      if (Theme.of(context).brightness == Brightness.dark) {
        return Colors.black;
      } else {
        return Colors.black;
      }
    }
  }

  Color chatBubbleReplyColor() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.black;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final align =
        widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = widget.isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(10.0),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(5.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: radius,
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.76,
            minWidth: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.isMe
                  ? const SizedBox()
                  : widget.isGroup
                      ? Padding(
                          padding: const EdgeInsets.only(right: 48.0),
                          child: Container(
                            color: Colors.black,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.username,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )
                      : const SizedBox(),
              widget.isGroup
                  ? widget.isMe
                      ? const SizedBox()
                      : const SizedBox(height: 5)
                  : const SizedBox(),
              widget.isReply
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      constraints: const BoxConstraints(
                        minHeight: 25,
                        maxHeight: 100,
                        minWidth: 80,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              color: Colors.black,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.isMe ? "You:" : widget.replyName,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Container(
                              color: Colors.black,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.replyText,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                        color: Colors.white60,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(width: 2.0),
              widget.isReply ? const SizedBox(height: 5) : const SizedBox(),
              Padding(
                padding: EdgeInsets.all(widget.type == "text" ? 5 : 0),
                child: widget.type == "text"
                    ? !widget.isReply
                        ? Text(
                            widget.message,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                          )
                        : Container(
                            color: Colors.black,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.message,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                            ),
                          )
                    : Image.asset(
                        widget.message,
                        height: 130,
                        width: MediaQuery.of(context).size.width / 1.3,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
        ),
        Padding(
          padding: widget.isMe
              ? const EdgeInsets.only(right: 10, bottom: 10.0)
              : const EdgeInsets.only(left: 10, bottom: 10.0),
          child: Text(
            widget.time,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white38,
                fontSize: 11,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
