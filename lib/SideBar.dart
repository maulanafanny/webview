// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('maulanafanny'),
            accountEmail: const Text('maulanafanny38@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile-pic.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 27, 34),
                image: DecorationImage(
                  image: AssetImage('assets/images/background-pic.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.apps),
            title: const Text('Product'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Team'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Enterprise'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.explore),
            title: const Text('Explore'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Marketplace'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.price_check),
            title: const Text('Pricing'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            // ignore: avoid_returning_null_for_void
            onTap: () => exit(0),
          ),
        ],
      ),
    );
  }
}
