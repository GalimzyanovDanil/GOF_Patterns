import 'package:gof_patterns/creational/factory_method.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void factoryMethodTest() {
  group(
    'Factory Method',
    (() {
      test(
        'All objects implements base',
        () {
          final object1 = IPath.create();
          final object2 = IPath.create(isDefault: false);

          expect(object1, isA<DefaultPath>());
          expect(object2, isA<CustomPath>());
        },
      );
    }),
  );
}
