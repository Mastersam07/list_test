import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:list_test/main.dart';

class NameVm extends ChangeNotifier {
  final _nameList = <String>[];
  final _namesGrouped = <String, Iterable<String>>{};

  UnmodifiableMapView<String, Iterable<String>> get nameList =>
      UnmodifiableMapView(_namesGrouped);

  loadData() {
    _addToNameList(sampleNames);
    if (hasListeners) notifyListeners();
  }

  void _addToNameList(Iterable<String> list) {
    _nameList.addAll(list);

    _namesGrouped.clear();
    final uniqueNameStrings = _nameList.map((name) => name[0]);

    for (var firstLetter in uniqueNameStrings) {
      _namesGrouped[firstLetter] = _nameList.where(
        (name) => name[0] == firstLetter,
      );
    }
  }
}
