/*
  Позволяет создавать сложные объекты пошагово.
  Позволяет создавать сложные объекты с разным представлением.
*/

class Phone {
  late final int screenSize;
  late final int weight;
  late final String os;

  Phone(PhoneBuilder builder) {
    screenSize = builder.screenSize;
    weight = builder.weight;
    os = builder.os;
  }
}

class PhoneBuilder {
  int _screenSize = 0;
  int _weight = 0;
  String _os = '';

  int get screenSize => _screenSize;
  int get weight => _weight;
  String get os => _os;

  void initScreenSize(int size) => _screenSize = size;
  void initWeight(int weight) => _weight = weight;
  void setupOS(String os) => _os = os;

  Phone buildPhone() => Phone(this);
}

void main(List<String> args) {
  final builder = PhoneBuilder()
    ..initScreenSize(5)
    ..initWeight(250)
    ..setupOS('Android');
  final myPhone = builder.buildPhone();

  print(myPhone.os);
}
