import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext {
  Size get deviceSize => MediaQuery.sizeOf(this);
}
