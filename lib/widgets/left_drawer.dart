import 'package:flutter/material.dart';
import 'package:goals_n_glory_mobile/screens/menu.dart';
import 'package:goals_n_glory_mobile/screens/product_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // Drawer Header
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              children: [
                Text(
                  'Goals n\' Glory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Gear up for the pitch! Discover top-quality football products today ",
                  // Gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  )
                ),
              ],
            ),
          ),

          // Routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            // Redirection ke ProductFormPage
            onTap: () {
              // Routing ke ProductFormPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductFormPage(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}