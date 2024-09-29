import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile image
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(height: 20),

                    // Nama
                    Text(
                      'Jonathan Natannael Zefanya',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Program
                    Text(
                      'MAD - LearningX',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Contact Information
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email, color: Colors.deepPurple),
                        const SizedBox(width: 8),
                        Text(
                          'jonathan.zefanya16@gmail.com',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.phone, color: Colors.deepPurple),
                        const SizedBox(width: 8),
                        Text(
                          '+62 838-0791-4090',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // About Section
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'saya adalah seorang mahasiswa di Institut Teknologi, '
              'Indonesia yang mengambil jurusan Teknik Informatika, '
              'saya aktif dalam kegiatan organisasi di kampus saya dan'
              'saya juga aktif dalam kegiatan organisasi di luar kampus.',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),

            // Add any other feature widgets or buttons here
            ElevatedButton(
              onPressed: () {
                // Placeholder for any feature or functionality
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.deepPurple.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Explore More',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
