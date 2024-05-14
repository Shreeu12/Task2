import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(index: index);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final int index;

  const ProductCard({required this.index});

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/samsung.jpg',
      'assets/oppo.jpg',
      'assets/vivo.jpg',
      'assets/apple.jpg',
      'assets/redmi.jpg',
    ];

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePaths[index],
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            //child: Text('Product $index'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(productIndex: index),
                ),
              );
            },
            child: Text('Read More'),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final int productIndex;

  const ProductDetailPage({required this.productIndex});

  @override
  Widget build(BuildContext context) {
    String title;
    String description;

    // Set details based on product index
    switch (productIndex) {
      case 0:
        title = 'Samsung Galaxy';
        description = 'An excellent smartphone from Samsung with advanced features.';
        break;
      case 1:
        title = 'Oppo Find X';
        description = 'Innovative design and powerful performance.';
        break;
      case 2:
        title = 'Vivo V21';
        description = 'Sleek design and impressive camera capabilities.';
        break;
      case 3:
        title = 'iPhone 13';
        description = 'The latest iPhone with cutting-edge technology.';
        break;
      case 4:
        title = 'Xiaomi Redmi Note 10';
        description = 'Great value for money with a large display and long battery life.';
        break;
      default:
        title = 'Product Details';
        description = 'No details available';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
