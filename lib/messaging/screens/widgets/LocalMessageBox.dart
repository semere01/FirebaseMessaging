import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:messaging_bloc/messaging/screens/widgets/MessageBox.dart';

class LocalMessageBox extends MessageBox {
  LocalMessageBox({
    super.alignment: MainAxisAlignment.end,
    required super.message,
  });
}
