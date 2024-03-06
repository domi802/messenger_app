// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:messenger_app/components/my_drawer.dart';
import 'package:messenger_app/components/user_tile.dart';
import 'package:messenger_app/pages/chat_page.dart';
import 'package:messenger_app/services/auth/authh_service.dart';
import 'package:messenger_app/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth service
  final ChatServices _chatService = ChatServices();
  // ignore: unused_field
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("ERROR");
        }
        //loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("LOADING ..");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build individual list tile for user

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //dispaly all user except current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return userTile(
        text: userData["email"],
        onTap: () {
          //tapped on a user -> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
