/*
  Суть паттерна заключается в создании объекта, который существутет в единсвенном
экземпляре на все приложение.
  Реализация:
    1) Создание приватного конструктора.
    2) Создание static поля в этом классе и присвоения ему экземпляра этого
    класса.
    3) Либо А, либо Б:
      А) Создание static  геттера с присвоением ему static поля.
      Б) Создание фабричного конструктора.
*/

class SingletonType1 {
  var i = 0;
  static final SingletonType1 _instance = SingletonType1._();
  static SingletonType1 get instance => _instance;
  SingletonType1._();
}

class SingletonType2 {
  var i = 0;
  static final SingletonType2 _instance = SingletonType2._();
  factory SingletonType2.instance() => _instance;
  SingletonType2._();
}
