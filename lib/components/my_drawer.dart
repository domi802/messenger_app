// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:messenger_app/auth/authh_service.dart';
import 'package:messenger_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get auth service

    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              //home
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("H O M E "),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              //setting
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("S E T T I N G S "),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          //logout
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("L O G O U T "),
              leading: Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
