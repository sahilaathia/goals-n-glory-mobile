import 'package:flutter/material.dart';
import 'package:goals_n_glory_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.cyan.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Featured badge
                      if (product.isFeatured)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Text(
                            "Featured",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                      
                      if (product.isFeatured) const SizedBox(width: 8),
                      
                      // Category Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.cyan.shade100,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          product.categoryDisplay,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan.shade700,
                          ),
                        ),
                      ),
                    
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Price
                  Text(
                    "Rp ${product.price}",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 16),


                  // Stock
                  Row(
                    children: [
                      const Icon(Icons.inventory_2, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "Stock: ${product.stock}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Brand
                  Row(
                    children: [
                      const Icon(Icons.sell, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "Brand: ${product.brand}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Size + Color
                  Row(
                    children: [
                      const Icon(Icons.style, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "Size: ${product.size} • Color: ${product.color}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Thumbnail
                  if (product.thumbnail.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          "http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.broken_image, size: 50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                  const SizedBox(height: 24),
                  
                  // Description
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
