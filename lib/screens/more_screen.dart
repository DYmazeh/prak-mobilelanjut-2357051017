
import 'package:flutter/material.dart';
import 'package:myapp/screens/auth_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120, // Set a height for the banner
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: NetworkImage('https://thumbs.dreamstime.com/b/row-books-multicolored-isolated-white-background-free-copy-space-44183773.jpg'),
                    fit: BoxFit.cover,
                    // Add a color filter to darken the image for text readability
                    colorFilter: ColorFilter.mode(
                      Colors.black54,
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Books\n[0] books unlocked',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('PictureThis Tools', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildToolItem(Icons.eco, 'Plant Finder'),
                  _buildToolItem(Icons.add_box, 'Diagnose'),
                  _buildToolItem(Icons.water_drop, 'Water Calculator'),
                  _buildToolItem(Icons.wb_sunny, 'Light Meter'),
                  _buildToolItem(Icons.crop_square, 'Repotting Checker'),
                  _buildToolItem(Icons.chat, 'Plant Advisor'),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('PictureThis ID', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5, // Adjust aspect ratio for better layout
                children: [
                  _buildIdCard('Weed ID', 'Control & Prevent', Icons.grass, Colors.green),
                  _buildIdCard('Allergen ID', 'Identify & Watch...', Icons.warning_amber, Colors.orange),
                  _buildIdCard('Toxic ID', 'Spot & Stay Safe', Icons.dangerous, Colors.red),
                  _buildIdCard('Tree ID', 'Recognize & Expl...', Icons.park, Colors.teal),
                  _buildIdCard('Tree-ring ID', 'Analyze Growth', Icons.data_usage, Colors.brown),
                  _buildIdCard('360 ID', 'Full-Circle Identify', Icons.threesixty, Colors.blue),
                  _buildIdCard('Bird ID', 'Observe & Learn', Icons.flutter_dash, Colors.pink),
                  _buildIdCard('Insect ID', 'Discover & Classi...', Icons.bug_report, Colors.purple),
                ],
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Log Out', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const AuthScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green, size: 30),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildIdCard(String title, String subtitle, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(icon, size: 40, color: iconColor),
          ),
        ],
      ),
    );
  }
}
