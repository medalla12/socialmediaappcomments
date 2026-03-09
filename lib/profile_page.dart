import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('James_Dev', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Header Section (Avatar at Username)
          const CircleAvatar(radius: 50, backgroundImage: NetworkImage("...")),
          const Text('@jamestagram_official', style: TextStyle(fontWeight: FontWeight.bold)),

          // Stats Section (Following, Followers, Likes)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatItem("120", "Following"),
              _buildStatItem("45M", "Followers"),
              _buildStatItem("900M", "Likes"),
            ],
          ),

          // Edit Profile button
          // ... code for buttons ...

          // GridView.builder: Dito lumalabas yung gallery ng pictures
          Expanded(
            child: GridView.builder(
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Tatlong pictures bawat row
                childAspectRatio: 3/4, // Vertical rectangle para magmukhang TikTok/Instagram
              ),
              itemBuilder: (context, index) {
                return Image.network("...", fit: BoxFit.cover);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper function para i-format yung stats (Count sa taas, Label sa baba)
  Widget _buildStatItem(String count, String label) {
    return Column(children: [Text(count), Text(label)]);
  }
}