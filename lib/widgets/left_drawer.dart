import 'package:flutter/material.dart';
import 'package:goals_n_glory_mobile/screens/menu.dart';
import 'package:goals_n_glory_mobile/screens/product_form.dart';
import 'package:goals_n_glory_mobile/screens/product_entry_list.dart';
import 'package:goals_n_glory_mobile/screens/my_product_entry_list.dart';
import 'package:goals_n_glory_mobile/screens/login.dart'; 
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // Drawer Header
            decoration: BoxDecoration(
              color: Colors.cyan,
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
            leading: const Icon(Icons.home_rounded),
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
            leading: const Icon(Icons.add_circle_rounded),
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

          // ALL PRODUCTS
          ListTile(
            leading: const Icon(Icons.store_mall_directory_rounded),
            title: const Text('All Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductEntryListPage(),
                ),
              );
            },
          ),

          // MY PRODUCTS
          ListTile(
            leading: const Icon(Icons.person_rounded),
            title: const Text('My Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProductEntryListPage(),
                ),
              );
            },
          ),

          // LOGOUT
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
            onTap: () async {
              final response = await request.logout(
                  "http://localhost:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message See you again, $uname."),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}