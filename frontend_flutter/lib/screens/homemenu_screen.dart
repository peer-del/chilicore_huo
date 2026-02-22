import 'package:flutter/material.dart';

class HomeMenuScreen extends StatefulWidget {
  const HomeMenuScreen({super.key});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen> {
  String? _selectedSoup;
  String _selectedCategory = 'Premium Meat';

  final List<String> _soups = ['Mala Soup', 'Mushroom Soup', 'Creamy Tom Yum Soup', 'Pork Bone Soup'];
  final List<String> _categories = ['Premium Meat', 'Fresh Seafood', 'Vegetables', 'Mushrooms', 'Tofu & Bean', 'Noodles', 'Brewery', 'Dessert'];

  final Map<String, List<Map<String, String>>> _menuItems = {
    'Premium Meat': [
      {'name': 'Wagyu Beef Slices', 'image': 'assets/images/wagyu_beef.png'},
      {'name': 'Lamb Shoulder', 'image': 'assets/images/lamb_shoulder.png'},
    ],
    'Fresh Seafood': [
      {'name': 'Jumbo Shrimp', 'image': 'assets/images/jumbo_shrimp.png'},
      {'name': 'Scallops', 'image': 'assets/images/scallops.png'},
    ],
     'Vegetables': [
      {'name': 'Mixed Vegetables', 'image': 'assets/images/mixed_vegetables.png'},
    ],
    'Mushrooms': [
      {'name': 'Mixed Mushrooms', 'image': 'assets/images/mixed_mushrooms.png'},
    ],
    // Add other categories and items here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('ChiliCore Huo锅', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            backgroundColor: Theme.of(context).primaryColor,
            floating: true,
            pinned: true,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Find ingredients...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose Soup Base',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  _buildSoupSelection(),
                  const SizedBox(height: 20),
                  const Text(
                    'Select Ingredients',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildCategorySelector(),
                ],
              ),
            ),
          ),
          _buildMenuGrid(),
        ],
      ),
      bottomNavigationBar: _buildAddToCartBar(),
    );
  }

  Widget _buildSoupSelection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1.6,
          children: List.generate(_soups.length, (index) {
            return _buildSoupOption(_soups[index], index);
          }),
        ),
        
        // "SOUP" circle in the middle
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[200]!, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: const Center(
            child: Text(
              'SOUP',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Color(0xFF1E293B),
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSoupOption(String soup, int index) {
    final isSelected = _selectedSoup == soup;
    // Use red accent color as in the design, or fallback to theme's primary color
    final primaryColor = Colors.redAccent; 

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedSoup == soup) {
            _selectedSoup = null;
          } else {
            _selectedSoup = soup;
          }
        });
      },
      child: Container(
        // Add a red border when the item is selected
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.transparent,
            width: 3, // Border thickness
          ),
        ),
        child: ClipRRect(
          // Inner border radius should be slightly smaller than the container's
          borderRadius: BorderRadius.circular(13), 
          child: Stack(
            fit: StackFit.expand, // Make the stack's children fill the space
            children: [
              // 1. Soup Image
              Image.asset(
                'assets/images/${soup.toLowerCase().replaceAll(' ', '_')}.png',
                fit: BoxFit.cover,
                // Display a gray box if the image fails to load
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300]),
              ),
              
              // 2. Add a gradient overlay for better text readability
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              
              // 3. Soup name text, aligned to the bottom-left
              Positioned(
                bottom: 12,
                left: 12,
                child: Text(
                  soup,
                  style: const TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              
              // 4. Checkmark icon, displayed when selected
              if (isSelected)
                Positioned(
                  top: 8,
                  left: (index % 2 == 0) ? 8 : null,
                  right: (index % 2 != 0) ? 8 : null,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                }
              },
              backgroundColor: Colors.white,
              selectedColor: Theme.of(context).primaryColor,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              shape: StadiumBorder(side: BorderSide(color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuGrid() {
    final items = _menuItems[_selectedCategory] ?? [];
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = items[index];
            return _buildMenuItemCard(item);
          },
          childCount: items.length,
        ),
      ),
    );
  }

  Widget _buildMenuItemCard(Map<String, String> item) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              item['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.remove_circle, color: Theme.of(context).primaryColor), onPressed: () {}),
                const Text('1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(icon: Icon(Icons.add_circle, color: Theme.of(context).primaryColor), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black87,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'TOTAL',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Row(
              children: [
                Text('Add to Basket', style: TextStyle(color: Colors.white)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
