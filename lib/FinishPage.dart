import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_kagan_gredlein/app_routes.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/star.png', scale: 0.2),
                Text('DU HAST ES GESCHAFFT!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
                CustomYoutubePlayer(
                    'https://www.youtube.com/watch?v=5hvcNXN5OXw&t=27s'),
                Container(
                    width: 199,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.game);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          Text(
                            "Nochmal spielen",
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
