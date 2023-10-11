import 'package:flutter_test/flutter_test.dart';
import 'package:list_test/name_vm.dart';

void main() {
  group('NameVm', () {
    late NameVm vm;

    setUp(() {
      vm = NameVm();
      vm.loadData();
    });

    test('should group names by first letter', () {
      for (var entry in vm.nameList.entries) {
        for (var name in entry.value) {
          expect(name[0], entry.key);
        }
      }
    });
  });
}
