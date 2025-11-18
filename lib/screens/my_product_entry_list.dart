import 'package:flutter/material.dart';
import 'package:goals_n_glory_mobile/models/product_entry.dart';
import 'package:goals_n_glory_mobile/widgets/left_drawer.dart';
import 'package:goals_n_glory_mobile/widgets/product_entry_card.dart';
import 'package:goals_n_glory_mobile/screens/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductEntryListPage extends StatefulWidget {
  const MyProductEntryListPage({super.key});

  @override
  State<MyProductEntryListPage> createState() => _MyProductEntryListPageState();
}

class _MyProductEntryListPageState extends State<MyProductEntryListPage> {
  Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
    final response =
        await request.get('http://localhost:8000/json-my/');

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
        title: const Text('My Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMyProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(
              child: Text(
                'You have no products yet.',
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
