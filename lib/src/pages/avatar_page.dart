import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Avatar Page'),
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://ichef.bbci.co.uk/news/800/cpsprodpb/A85B/production/_104299034_tv050571340.jpg'),
                radius: 30.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: const Text('SL'),
                backgroundColor: Colors.brown[500],
              ),
            )
          ],
        ),
        body: const Center(
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            image: NetworkImage(
                'https://ichef.bbci.co.uk/news/800/cpsprodpb/A85B/production/_104299034_tv050571340.jpg'),
          ),
        ));
  }
}
