import 'package:flutter/material.dart';

void main() {
  runApp(const CategoryTabApp());
}

class CategoryTabApp extends StatelessWidget {
  const CategoryTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced Category Tab',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: CategoryTabScreen(),
    );
  }
}

class CategoryTabScreen extends StatelessWidget {
  final List<List<Map<String, dynamic>>> ls = [
    [
      {
        'id': 1,
        'name': 'EM water',
        'price': 1.5,
        'category': 'soft drink',
        'country': 'KH',
        'photo': 'images/EM water 1500.jpg'
      },
      {
        'id': 2,
        'name': 'Kiwi soda',
        'price': 1.75,
        'category': 'soft drink',
        'country': 'KH',
        'photo': 'images/Kiwi soda.jpg'
      },
      {
        'id': 3,
        'name': 'OrangeShake',
        'price': 2.05,
        'category': 'soft drink',
        'country': 'KH',
        'photo': 'images/OrangeShake.jpg'
      },
      {'id': 4, 'name': 'Passion', 'price': 1.85, 'category': 'soft drink', 'country': 'KH', 'photo': 'images/sm7.jpg'},
      {
        'id': 5,
        'name': 'Sting',
        'price': 0.85,
        'category': 'soft drink',
        'country': 'KH',
        'photo': 'images/sting can.jpg'
      },
      {
        'id': 6,
        'name': 'Yeos Soy Bean Milk',
        'price': 0.85,
        'category': 'soft drink',
        'country': 'KH',
        'photo': 'images/Yeos Soy Bean Milk.jpg'
      },
      {
        'id': 7,
        'name': 'Coke',
        'price': 0.5,
        'category': 'soft drink',
        'country': 'KH',
        'photo': 'images/cocacola can.jpg'
      },
    ],
    [
      {
        'id': 100,
        'name': 'Chicken quessadilla',
        'price': 3.85,
        'category': 'Food',
        'country': 'KH',
        'photo': 'images/Chicken quessadilla.jpg'
      },
      {'id': 101, 'name': 'Steak', 'price': 2.75, 'category': 'Food', 'country': 'KH', 'photo': 'images/fl9.jpg'},
      {
        'id': 102,
        'name': 'Hanami red can',
        'price': 2.75,
        'category': 'Food',
        'country': 'TH',
        'photo': 'images/Hanami red can.jpg'
      },
      {
        'id': 103,
        'name': 'Nutela sanwich',
        'price': 4.75,
        'category': 'Food',
        'country': 'KH',
        'photo': 'images/Nutela sanwich.jpg'
      },
      {
        'id': 104,
        'name': 'Spaghetti',
        'price': 5.05,
        'category': 'Food',
        'country': 'KH',
        'photo': 'images/spaghetti.jpg'
      },
      {
        'id': 105,
        'name': 'Vitamilk Yaor',
        'price': 0.75,
        'category': 'Food',
        'country': 'TK',
        'photo': 'images/Vitamilk Yaor.jpg'
      },
    ],
    [
      {
        'id': 200,
        'name': 'Angkor botle',
        'price': 1.75,
        'category': 'Beer',
        'country': 'KH',
        'photo': 'images/Angkor botle.jpg'
      },
      {
        'id': 201,
        'name': 'Angkor Can',
        'price': 1.70,
        'category': 'Beer',
        'country': 'KH',
        'photo': 'images/Angkor Can.jpg'
      },
    ],
  ];

  final List<String> categories = ['Soft Drink', 'Food', 'Beer'];

  CategoryTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.cyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text('Product'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: categories
                .map(
                  (category) => Tab(
                    text: category,
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: List.generate(categories.length, (index) {
            return GridView.builder(
              padding: const EdgeInsets.all(12.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
              ),
              itemCount: ls[index].length,
              itemBuilder: (context, itemIndex) {
                final item = ls[index][itemIndex];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(item['name']),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(item['photo']),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Price: \$${item['price'].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 6,
                    shadowColor: Colors.tealAccent.withOpacity(0.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  item['photo'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${item['price'].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _showItemDetails(context, item);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Details',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

void _showItemDetails(BuildContext context, Map<String, dynamic> item) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(item['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(item['photo']),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: \$${item['price'].toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Category: ${item['category']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
