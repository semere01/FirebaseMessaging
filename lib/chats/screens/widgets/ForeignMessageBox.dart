import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'MessageBox.dart';

class ForeignMessageBox extends MessageBox {
  ForeignMessageBox(
      {required super.message,
      super.backgroundColor: Colors.blue,
      super.foregroundColor: Colors.white,
      super.alignment: MainAxisAlignment.start});
}
