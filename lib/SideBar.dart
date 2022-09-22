// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 36, 41, 47),
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
            leading: const Icon(Icons.apps, color: Colors.white70),
            title: const Text(
              'Product',
              style: TextStyle(color: Colors.white70),
            ),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.white70),
            title: const Text('Team', style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.shop, color: Colors.white70),
            title:
                const Text('Enterprise', style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.explore, color: Colors.white70),
            title: const Text('Explore', style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.shop, color: Colors.white70),
            title: const Text('Marketplace',
                style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.price_check, color: Colors.white70),
            title: const Text('Pricing', style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(color: Colors.white70),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white70),
            title:
                const Text('Settings', style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.white70),
            title: const Text('Help', style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(color: Colors.white70),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.white70),
            title: const Text('Exit', style: TextStyle(color: Colors.white70)),
            // ignore: avoid_returning_null_for_void
            onTap: () => exit(0),
          ),
        ],
      ),
    );
  }
}
