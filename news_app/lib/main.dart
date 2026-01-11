import 'package:flutter/material.dart';
import 'about_us.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'NotoSansKhmer'),
  home: const NewsFeedPage(),
));

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Widget bodyContent;
    switch (_currentIndex) {
      case 1:
        bodyContent = SingleChildScrollView(
          child: Column(
            children: [
              _buildVideoSection(),
            ],
          ),
        );
        break;
      case 3:
        bodyContent = Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('ទំនាក់ទំនង - លេខទូរស័ព្ទ: +855 12 345 678\nអ៊ីមែល: info@example.com'),
          ),
        );
        break;
      default:
        bodyContent = Column(
          children: [
            _buildCategoryBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMainNewsCard(),
                    _buildVideoSection(),
                  ],
                ),
              ),
            ),
          ],
        );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200], // Light grey background like the image
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 40),
            SizedBox(width: 8),
            Icon(Icons.mic, color: Colors.red, size: 30),
            SizedBox(width: 4),
            Text("ព្រៃវែង ព័ត៌មាន", style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: bodyContent,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Horizontal Category Chips
  Widget _buildCategoryBar() {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ActionChip(avatar: Icon(Icons.explore), label: Text("ស្វែងរក"), onPressed: null),
          ),
          FilterChip(label: Text("ទាំងអស់"), selected: true, onSelected: null),
          // Add more chips here...
        ],
      ),
    );
  }

  // Large News Card
  Widget _buildMainNewsCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/news_event.jpg', fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "អភិបាលខេត្តព្រៃវែង...",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text("២០-ធ្នូ-២០២៥", style: TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Horizontal Video Thumbnails
  Widget _buildVideoSection() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.video_library, color: Colors.red),
              SizedBox(width: 10),
              Text("វីដេអូខ្លី", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/thumbs/thumb${index + 1}.jpg',
                      width: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        width: 150,
                        height: double.infinity,
                        child: const Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index == 2) {
          // Open About as a full page
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
        } else {
          setState(() => _currentIndex = index);
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "ទំព័រដើម"),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: "វីដេអូខ្លី"),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: "អំពីយើង"),
        BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "ទំនាក់ទំនង"),
      ],
    );
  }
}