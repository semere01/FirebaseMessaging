import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

main() {
  // List<int> bytes = ;
  // String hash = ;
  // assert(hash ==
  //     'ab530a13e45914982b79f9b7e3fba994cfd1f3fb22f71cea1afbf02b460c6d1d'); // true
  // var x = ("C".compareTo("B"));
  // print(x);
  var username = "username";
  var foreignUserId = "usernamefriend";
  var messagesId;
  if (username.compareTo(foreignUserId) < 0) {
    messagesId =
        sha256.convert(utf8.encode('${username}_$foreignUserId')).toString();
  } else {
    messagesId =
        sha256.convert(utf8.encode('${foreignUserId}_$username')).toString();
  }
  print(messagesId);
}
