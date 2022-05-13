/*
  Предоставляет интерфейс для создания семейства связанных объектов
без привязки к их контретным классам. 
*/

abstract class Engine {
  final int displacement;
  Engine(this.displacement);

  @override
  String toString() {
    return 'Engine with ${displacement}l displacment';
  }
}

class SportEngine extends Engine {
  SportEngine() : super(5);
}

class CivilEngine extends Engine {
  CivilEngine() : super(2);
}

abstract class Transmission {
  final String type;
  Transmission(this.type);

  @override
  String toString() {
    return 'Transmission with $type';
  }
}

class AutoTransmission extends Transmission {
  AutoTransmission() : super('Automatic');
}

class ManualTransmission extends Transmission {
  ManualTransmission() : super('Manual');
}

abstract class Factory {
  Engine installEngine();
  Transmission installTransmission();

  factory Factory.factory(carType type) {
    switch (type) {
      case carType.civil:
        return CivilFactory();

      case carType.sport:
        return SportFactory();
    }
  }
}

class CivilFactory implements Factory {
  @override
  Engine installEngine() => CivilEngine();

  @override
  Transmission installTransmission() => AutoTransmission();
}

class SportFactory implements Factory {
  @override
  Engine installEngine() => SportEngine();

  @override
  Transmission installTransmission() => ManualTransmission();
}

enum carType { civil, sport }

void abstractFactory() {
  final comFactory = Factory.factory(carType.sport);
  final engine = comFactory.installEngine();
  final transmission = comFactory.installTransmission();
  print('We have a car with $engine and $transmission');
}
