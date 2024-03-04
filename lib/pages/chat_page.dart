import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/components/my_textfield.dart';
import 'package:messenger_app/services/auth/authh_service.dart';
import 'package:messenger_app/services/chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});
  //text controller

  final TextEditingController _messageController = TextEditingController();

  //chat & auth services
  final ChatServices _chatService = ChatServices();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    //if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      //send message
      await _chatService.sendMessange(receiverID, _messageController.text);

      //clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children: [
          //display all message
          Expanded(
            child: _buildMessageList(),
          ),
          //user input
          _buildUSerInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessage(receiverID, senderID),
        builder: (context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return Text("Error");
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading ...");
          }
          //return list view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  //build message input
  Widget _buildUSerInput() {
    return Row(
      children: [
        //textfield should take up most of the space
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: "Type a message",
            obscureText: false,
          ),
        ),
        //send button
        IconButton(
          onPressed: sendMessage,
          icon: Icon(Icons.arrow_upward),
        ),
      ],
    );
  }
}
