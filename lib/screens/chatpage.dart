import 'package:flutter/material.dart';
import 'package:flutter_application_8/models/messages.dart';
import 'package:flutter_application_8/widgets/chatbuble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  Chatpage({super.key, required this.emails});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ScrollController _controller = ScrollController();
  final String emails;
  CollectionReference message =
      FirebaseFirestore.instance.collection('message');
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('created At', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messages> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(Messages.fromjson(snapshot.data!.docs[i].data()));
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 50,
                  ),
                  const Text(
                    'chat',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagelist.length,
                      itemBuilder: (context, index) {
                        return messagelist[index].id == emails
                            ? Chatbuble(
                                messages: messagelist[index],
                              )
                            : ChatbubleReceiver(messages: messagelist[index]);
                      }),
                ),
                TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    message.add({
                      'message': data,
                      'created At': DateTime.now(),
                      'id': emails
                    });
                    controller.clear();
                    _controller.animateTo(
                      0,
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 1000),
                    );
                  },
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      hintText: 'send message',
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(16))),
                )
              ],
            ),
          );
        } else {
          return const Text('isloading');
        }
      },
    );
  }
}
