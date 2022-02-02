import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'app_routes.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String? youtubeURL;
  const CustomYoutubePlayer(this.youtubeURL);

  @override
  _CustomYoutubePlayerState createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayerController.convertUrlToId(widget.youtubeURL!)!,
        params: const YoutubePlayerParams(
            loop: true,
            color: 'transparent',
            desktopMode: true,
            strictRelatedVideos: true,
            showFullscreenButton: !kIsWeb));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 250,
      width: 400,
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: YoutubePlayerIFrame(
          controller: _controller,
        ),
      ),
    );
  }
}

class FinishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/star.png', scale: 0.2),
                Text('DU HAST ES GESCHAFFT!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2),
                const CustomYoutubePlayer('https://youtu.be/GxtYB-Wd-YU'),
                SizedBox(
                    width: 213,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.start);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.play_arrow),
                          Text(
                            "Zurück zum Start",
                          )
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.lime)),
                    )),
              ],
            ))));
  }
}
