import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Tinanggal ang shadow para magmukhang flat at malinis
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, color: Colors.black) // Button para isara ang page
        ),
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          // TextButton para sa "Share" action sa kanang bahagi ng AppBar
          TextButton(
            onPressed: () {
              // SnackBar: Isang maliit na popup message sa ibaba para magbigay ng feedback
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Post Shared! 🎉")),
              );
            },
            child: const Text(
              "Share",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. IMAGE PREVIEW AT CAPTION AREA
          // Dito nakalagay ang thumbnail ng picture at ang input field para sa caption
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container para sa maliit na preview ng image na ipo-post
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage("https://picsum.photos/200"),
                      fit: BoxFit.cover, // Sinisiguro na puno ang box ng image
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // Expanded TextField: Para makuha ang natitirang space sa Row para sa text
                const Expanded(
                  child: TextField(
                    maxLines: 4, // Pinapayagan ang user na mag-type hanggang 4 na linya
                    decoration: InputDecoration(
                      hintText: "Write a caption...",
                      border: InputBorder.none, // Tinanggal ang guhit sa ilalim para sa clean look
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(), // Manipis na linya pang-hati ng mga section

          // 2. MENU OPTIONS
          // Mga karagdagang settings gaya ng Location, Tagging, at Music
          _buildMenuOption(Icons.location_on_outlined, "Add Location"),
          const Divider(height: 1),
          _buildMenuOption(Icons.person_outline, "Tag People"),
          const Divider(height: 1),
          _buildMenuOption(Icons.music_note_outlined, "Add Music"),
          const Divider(height: 1),

          const Spacer(), // Spacer: Itutulak nito ang susunod na widget sa pinakababa ng screen

          // 3. BOTTOM GALLERY PREVIEW (TikTok Style)
          // Ito ang itsura ng gallery selection sa ibaba
          Container(
            height: 200,
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Recent Photos", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  // GridView.builder: Ginagamit para sa pag-display ng maraming images sa grid form
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Apat na pictures bawat row
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Image.network(
                        "https://picsum.photos/id/${index + 50}/150/150",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Function: Isang reusable na widget para hindi paulit-ulit ang code sa menu options
  Widget _buildMenuOption(IconData icon, String title) {
    return ListTile(
        leading: Icon(icon, color: Colors.black), // Icon sa kaliwa
        title: Text(title), // Text sa gitna
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors