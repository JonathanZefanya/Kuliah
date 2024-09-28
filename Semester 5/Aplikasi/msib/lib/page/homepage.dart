import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> allRecipes = [
    {
      "title": "Apple Pie",
      "image": "assets/food/apple-pie.jpg",
      "time": "50 min",
      "likes": "120",
      "markets": "20",
      "category": "Makanan"
    },
    {
      "title": "Beef Burger",
      "image": "assets/food/burger.jpeg",
      "time": "35 min",
      "likes": "85",
      "markets": "15",
      "category": "Makanan"
    },
    {
      "title": "Ramen Udang",
      "image": "assets/food/ramen-udang.jpeg",
      "time": "25 min",
      "likes": "45",
      "markets": "12",
      "category": "Makanan"
    },
    {
      "title": "Karaage",
      "image": "assets/food/kaarage.jpg",
      "time": "40 min",
      "likes": "70",
      "markets": "18",
      "category": "Makanan"
    },
    {
      "title": "Takoyaki",
      "image": "assets/food/takoyaki.jpeg",
      "time": "30 min",
      "likes": "55",
      "markets": "10",
      "category": "Makanan"
    },
    // Tidak ada resep minuman, tambahkan jika diperlukan.
  ];

  List<bool> isSelected = [true, false, false]; // Default tombol toggle
  String selectedCategory = "All"; // Kategori default
  String searchQuery = ""; // Query untuk pencarian

  @override
  Widget build(BuildContext context) {
    // Filter resep berdasarkan kategori yang dipilih dan pencarian
    List<Map<String, String>> filteredRecipes = selectedCategory == "All"
        ? allRecipes
        : allRecipes
            .where((recipe) => recipe["category"] == selectedCategory)
            .toList();

    // Pencarian dengan query pada filteredRecipes
    List<Map<String, String>> searchResults = searchQuery.isEmpty
        ? filteredRecipes
        : filteredRecipes
            .where((recipe) =>
                recipe["title"]!.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/logo/logo.png', // Logo aplikasi
              height: 40,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value; // Set query pencarian
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.settings),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Katalog Resep Makanan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ToggleButtons(
              borderColor: Colors.grey,
              fillColor: Colors.orange[200],
              borderWidth: 2,
              selectedBorderColor: Colors.orange,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }

                  if (index == 0) {
                    selectedCategory = "All";
                  } else if (index == 1) {
                    selectedCategory = "Makanan";
                  } else if (index == 2) {
                    selectedCategory = "Minuman";
                  }

                  searchQuery = ""; // Reset query pencarian saat kategori berubah
                });
              },
              isSelected: isSelected,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("All"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Makanan"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Minuman"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: searchResults.isEmpty
                  ? Center(
                      child: Text(
                        "Tidak ada resep",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          recipe: searchResults[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan aksi untuk menambah resep baru
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Map<String, String> recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              recipe['image']!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['title']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text("Time: ${recipe['time']}"),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.favorite, size: 16, color: Colors.red),
                        const SizedBox(width: 4),
                        Text(recipe['likes']!),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.store, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text("${recipe['markets']} Market"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
