import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Mock Data: Listahan ng mga posts na parang galing sa database
  final List<Map<String, String>> posts = const [
    {
      "username": "katarinabluu",
      "profile": "https://pbs.twimg.com/media/FwyPVgFXsAMypfD.jpg",
      "postImage": "https://pbs.twimg.com/media/FwyPVgFXsAMypfD.jpg",
      "caption": "I am a rich man! 🍜 #foodie #ramen",
      "likes": "2.5M likes"
    },
    // ... iba pang data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Jamestagram',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline, color: Colors.black)),
        ],
      ),
      // ListView.builder: Para tipid sa memory, nira-render lang ang visible items
      body: ListView.builder(
        itemCount: posts.length + 1, // +1 dahil sa StoriesSection sa taas
        itemBuilder: (context, index) {
          if (index == 0) return const StoriesSection(); // Una munang lalabas ang stories
          return PostWidget(postData: posts[index - 1]); // Tapos yung mga posts
        },
      ),
    );
  }
}

// Widget para sa pahalang (horizontal) na listahan ng stories
class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});
  // ... list of names ...

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Gawing pakanan ang scroll
            itemCount: storyNames.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    // Bilog na may border para sa profile picture
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: index == 0 ? null : const LinearGradient(colors: [Color(0xFF9B2282), Color(0xFFEEA863)]),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://api.dicebear.com/7.x/avataaars/jpg?seed=${storyNames[index]}"),
                      ),
                    ),
                    Text(storyNames[index], style: const TextStyle(fontSize: 11)),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(),
      ],
    );
  }
}

// Widget para sa bawat isang post (User, Image, Buttons, Caption)
class PostWidget extends StatelessWidget {
  final Map<String, String> postData;
  const PostWidget({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header ng post (Profile pic at Username)
        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(postData['profile']!)),
          title: Text(postData['username']!, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_horiz),
        ),
        // Picture ng post
        Image.network(postData['postImage']!, fit: BoxFit.fitWidth),
        // Action Buttons (Like, Comment, Share, Save)
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
          ],
        ),
        // Section para sa Likes at Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(postData['likes']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("${postData['username']} ${postData['caption']}"),
            ],
          ),
        ),
      ],
    );
  }
}