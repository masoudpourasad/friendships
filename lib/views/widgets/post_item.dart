import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  final String dp;
  final String name;
  final String time;
  final String img;

  const PostItem({
    super.key,
    required this.dp,
    required this.name,
    required this.time,
    required this.img,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  widget.dp,
                ),
              ),
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                widget.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              trailing: Text(
                widget.time,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
              ),
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: 10,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(
                    widget.img,
                    fit: BoxFit.cover,
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            // Image.asset(
            //   widget.img,
            //   height: 170,
            //   width: MediaQuery.of(context).size.width,
            //   fit: BoxFit.cover,
            // ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
