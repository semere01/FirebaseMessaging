import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatsDataProvider {
  Future<Iterable> getMessagesFromUser(String foreignUserId) async {
    return [];
  }

  Future<Iterable> getAllChats() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String email = FirebaseAuth.instance.currentUser!.email!;
    String username = email.substring(0, email.indexOf("@"));
    DocumentSnapshot chatsListDoc =
        await db.collection("chats").doc(username).get();
    if (chatsListDoc.exists) {
      return chatsListDoc["chat_list"];
    } else {
      return [];
    }
  }

  addUser(String foreignUserId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String email = FirebaseAuth.instance.currentUser!.email!;
    String username = email.substring(0, email.indexOf("@"));
    // Add primary user's name to friend's list
    print("ForeignUserId: $foreignUserId");
    print("username: $username");
    var friendsListRef = db.collection("chats").doc(foreignUserId);
    var friendsList = await friendsListRef.get();
    if (friendsList.exists) {
      print("A");
      friendsListRef.set({
        "chat_list": (friendsList.data()!["chat_list"] + [username])
      });
      // Add friend's name to primary user's list
      var myListRef = db.collection("chats").doc(username);
      var myList = await myListRef.get();
      print(myList.data());
      myListRef.set({
        "chat_list": (myList.data()!["chat_list"] + [foreignUserId])
      });
    } else {
      throw (Exception("User Doesn't Exist!"));
    }
  }
}
