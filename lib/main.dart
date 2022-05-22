import 'package:flutter/material.dart';
import 'package:player/screens/from_youtube.dart';
import 'package:pod_player/pod_player.dart';

import 'screens/from_network_urls.dart';

void main() {
  PodVideoPlayer.enableLogs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/fromYoutube': (context) => const PlayVideoFromYoutube(),
        '/fromNetworkQualityUrls': (context) =>
            const PlayVideoFromNetworkQualityUrls(),
      },
      home: const MainPage(),
    );
  }
}

///sds

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            // _button('Play video from File'),

            _button(
              'Play video from Youtube',
              onPressed: () => Navigator.of(context).pushNamed('/fromYoutube'),
            ),
            _button(
              'Play video from Network quality urls',
              onPressed: () =>
                  Navigator.of(context).pushNamed('/fromNetworkQualityUrls'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String text, {void Function()? onPressed}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: OutlinedButton(
          onPressed: onPressed ?? () {},
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
