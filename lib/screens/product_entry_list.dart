import 'package:flutter/material.dart';
import 'package:goals_n_glory_mobile/models/product_entry.dart';
import 'package:goals_n_glory_mobile/widgets/left_drawer.dart';
import 'package:goals_n_glory_mobile/widgets/product_entry_card.dart';
import 'package:goals_n_glory_mobile/screens/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');

    List<ProductEntry> products = [];
    for (var d in response) {
      if (d != null) {
        products.add(ProductEntry.fromJson(d));
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(
              child: Text(
                'No products available.',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: snapshot.data[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: snapshot.data[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
