
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandung'),
        actions: [
          const Text('20C-27C'),
          IconButton(onPressed: () {}, icon: const Icon(Icons.cloud)),
        ],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search plants',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionItem(Icons.camera_alt, 'Identify'),
                  _buildActionItem(Icons.add_box, 'Diagnose'),
                  _buildActionItem(Icons.eco, 'My Garden'),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'Trending in ', style: TextStyle(color: Colors.white)),
                        TextSpan(
                          text: 'Bandung',
                          style: TextStyle(color: Colors.green, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTrendingCard('Cape Jasmine', 'https://tse4.mm.bing.net/th/id/OIP.1gUS2r_DHsB40NHg-J4QgQHaHa?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3'),
                    const SizedBox(width: 16),
                    _buildTrendingCard('China Rose', 'https://tse2.mm.bing.net/th/id/OIP.F9qeb4AUGO-0aOMx5s9moAHaE8?cb=12&pid=ImgDet&w=198&h=132&c=7&o=7&rm=3'),
                    const SizedBox(width: 16),
                    _buildTrendingCard('Evergreen Azalea', 'https://th.bing.com/th/id/OIP.Xt3SBU906JnuJy9lNQfWOgHaHa?w=200&h=200&c=10&o=6&cb=12&pid=genserp&rm=2'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'Plant Index in ', style: TextStyle(color: Colors.white),  ),
                        TextSpan(
                          text: 'Bandung',
                          style: TextStyle(color: Colors.green, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildPlantIndexCard(
                        'Native Plants',
                        'Bandung',
                        'https://tse2.mm.bing.net/th/id/OIP.uVj8r7h6d5eHTnC7F6PE7QAAAA?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: _buildPlantIndexCard(
                              'Toxic Plants',
                              'Bandung',
                              'https://www.epicgardening.com/wp-content/uploads/2024/05/Low-angle-view-of-purple-digitalis-with-raindrops.jpg',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: _buildPlantIndexCard(
                              'Flowers',
                              'Bandung',
                              'https://tse3.mm.bing.net/th/id/OIP.5UZAWXE48JesaiLfbR5QqgHaEK?cb=12&w=3840&h=2160&rs=1&pid=ImgDetMain&o=7&rm=3',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantIndexCard(String title, String location, String imageUrl) {
    return Card(
      color: Colors.amber[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown[800])),
                const SizedBox(height: 4),
                Text(location, style: TextStyle(color: Colors.brown[600])),
              ],
            ),
          ),
          Expanded(
            child: Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(icon, color: Colors.green, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildTrendingCard(String name, String imageUrl) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(imageUrl, height: 120, width: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
