/*
  Используется для динамического добавления объекту новой функциональности,
путем оборачивания его в некоторый wrapper(класс обертку). Предоставляет гибкую
альтернативу наследованию. Позволяет изменять функциональность во время 
выполнения кода.
  Модифицируем объект на ходу.
  Мы можем работать с одним бозовым объектом и его оборачивать во врапперы.
  Либо можно всегда оборачивать ранее созданный объект добавляя к нему новой функциональности.
*/

abstract class IMagazine {
  int getPageCount();
}

class BaseMagazine implements IMagazine {
  final int count;
  BaseMagazine(this.count);
  @override
  int getPageCount() {
    return count;
  }
}

abstract class IMagazineDecorator implements IMagazine {
  final IMagazine magazine;
  // На уровне интерфеса декоратора можем добавить свойств для расширения ими
  // основного класса
  String name();
  IMagazineDecorator(this.magazine);
}

class FlowersPart extends IMagazineDecorator {
  FlowersPart(IMagazine magazine) : super(magazine);

  @override
  int getPageCount() {
    return magazine.getPageCount() + 5;
  }

  @override
  String name() {
    return 'Flowers and page = ${getPageCount()}';
  }
}

class CarPart extends IMagazineDecorator {
  CarPart(IMagazine magazine) : super(magazine);

  @override
  int getPageCount() {
    return magazine.getPageCount() + 15;
  }

  @override
  String name() {
    return 'Car and page = ${getPageCount()}';
  }
}

void main(List<String> args) {
  // Обертка одного и того же объекта
  IMagazine magazine = BaseMagazine(40);
  magazine = CarPart(magazine);
  print((magazine as CarPart).name());
  magazine = FlowersPart(magazine);
  print((magazine as FlowersPart).name());
  print(magazine.getPageCount());
  print('---' * 10);
  // Создание разных объектов из одного базового
  final baseMagazine = BaseMagazine(50);
  final m1 = FlowersPart(baseMagazine);
  final mm = FlowersPart(m1);
  final m2 = CarPart(baseMagazine);
  print(m1.getPageCount());
  print(m2.getPageCount());
}
