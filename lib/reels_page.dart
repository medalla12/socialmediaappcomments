import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});
  // Listahan ng video links
  final List<String> videoUrls = const [ ... ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // PageView.builder: Ginagawang "Swipeable" ang screen (parang TikTok)
      body: PageView.builder(
        scrollDirection: Axis.vertical, // Scrolling pataas at pababa
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return ReelVideoPlayer(url: videoUrls[index]);
        },
      ),
    );
  }
}

class ReelVideoPlayer extends StatefulWidget { ... }

class _ReelVideoPlayerState extends State<ReelVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // I-initialize ang video gamit ang URL
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {}); // I-refresh ang UI pag handa na ang video
        _controller.play(); // Auto-play agad
        _controller.setLooping(true); // Uulit-ulit ang video
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Tinitigilan ang video sa memory para hindi mag-lag ang phone
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Pinapakita ang VideoPlayer kung tapos na mag-load (isInitialized)
        _controller.value.isInitialized
            ? Center(child: AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)))
            : const Center(child: CircularProgressIndicator()),
        // Overlay: Yung text na nakapatong sa video (username, description)
        Positioned(bottom: 20, left: 15, child: Text("@user_creator", style: TextStyle(color: Colors.white))),
      ],
    );
  }
}