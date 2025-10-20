
import 'package:flutter/material.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnose'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.history)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                'https://play-lh.googleusercontent.com/AA97pRR18RPxaLqbPSHVMiBF_f5lA4Z4rFS2_yn-GHpkUvqI7jl2ZDmVl35sWiDj',
                height: 150,
              ),
              const SizedBox(height: 16),
              const Text(
                'Instant health checkup, diagnosis, and treatments',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                label: const Text('Auto Diagnose'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Problems by Plant', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPlantProblem('China rose', 'https://tse2.mm.bing.net/th/id/OIP.F9qeb4AUGO-0aOMx5s9moAHaE8?cb=12&pid=ImgDet&w=198&h=132&c=7&o=7&rm=3'),
                    const SizedBox(width: 16),
                    _buildPlantProblem('Evergreen Azalea', 'https://th.bing.com/th/id/OIP.Xt3SBU906JnuJy9lNQfWOgHaHa?w=200&h=200&c=10&o=6&cb=12&pid=genserp&rm=2'),
                    const SizedBox(width: 16),
                    _buildPlantProblem('Cape Jasmine', 'https://tse4.mm.bing.net/th/id/OIP.1gUS2r_DHsB40NHg-J4QgQHaHa?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantProblem(String name, String imageUrl) {
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
