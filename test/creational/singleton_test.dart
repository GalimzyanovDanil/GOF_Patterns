import 'package:gof_patterns/creational/singleton.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void singletonTest() {
  group(
    'Singleton',
    (() {
      test(
        'Type 1',
        () {
          final object1 = SingletonType1.instance;
          final object2 = SingletonType1.instance;

          expect(object1.hashCode == object2.hashCode, isTrue);
        },
      );

      test(
        'Type 2',
        () {
          final object1 = SingletonType2.instance();
          final object2 = SingletonType2.instance();

          expect(object1.hashCode == object2.hashCode, isTrue);
        },
      );
    }),
  );
}
