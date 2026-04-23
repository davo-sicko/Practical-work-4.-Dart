// ЗАДАНИЕ 1
class Person{
  String name;

  Person(this.name);

  void drinkFromCup(Cup cup, double amount)=>cup.drink(amount);
}

class Cup{
  double currentVolume;
  final double capacity;

  Cup(this.currentVolume, this.capacity);
  
  void drink(double amount){
    if (amount > currentVolume){
      print("В кружке не хватает жидкости. Выпито: $currentVolume мл");
      currentVolume = 0;
    } else{
      currentVolume -= amount;
      print("Вы выпили $amount. В кружке осталось $currentVolume мл");
    }
  }
}

// ЗАДАНИЕ 2

class StorageSystem{
  int capacity = 10;
  List<String> currentItems = [];

  StorageSystem(this.capacity, this.currentItems);

  bool addItem(String item){
    if (currentItems.length < capacity){
      currentItems.add(item);
      print("К счастью есть свободное место) Всего вещей: ${currentItems.length}");
      return true;
    } else{
      print("К сожалению нету места для нового предмета.. :( ");
      return false;
    }
  }

  bool removeItem(String item){
    if (currentItems.contains(item)){
        currentItems.remove(item);
        return true;
    }
    return false;
  }
}

class Wardrobe{
  List<StorageSystem> shelves;
  Wardrobe(this.shelves);

  void putItem(String item){
    for (var shelf in shelves){
      if (shelf.addItem(item)){
        print("Вещь положена на полку");
        return;
      }
    }
    print("Места в шкафу нет!");
  }

  void takeItem(String item){
    for (var shelf in shelves){
      if (shelf.removeItem(item)){
        print("Вы достали из полки: $item");
        return;
      }
    }
    print("Вещи: '$item' нету ни на одной полки!");
  }
}

// ЗАДАНИЕ 3
class Pancake{
  final double weight;
  Pancake(this.weight);
}

class Barbell{
  final double maxWeight;
  final double barWeight = 20.00;

  List<Pancake> leftSide;
  List<Pancake> rightSide;
  Barbell(this.maxWeight, this.leftSide, this.rightSide);

  double _getcurrentWeight() {
    double total = barWeight;
      for (var p in leftSide) {
        total += p.weight;
      }
      for (var p in rightSide) {
        total += p.weight;
     }
    
      return total;
  }
  
  void addPancake(Pancake pancake, String side) {
    double currentTotal = _getcurrentWeight();
    
    if (currentTotal + pancake.weight > maxWeight) {
      print("Гриф не выдержит такой вес. Лимит: $maxWeight кг.");
      return;
    }

    if (side == "левая") {
      leftSide.add(pancake);
      print("Блин ${pancake.weight}кг добавлен слева.");
    } else if (side == "правая") {
      rightSide.add(pancake);
      print("Блин ${pancake.weight}кг добавлен справа.");
    } else {
      print("Неверная сторона! Используйте 'левая' или 'правая'.");
    }
  }
}

// ЗАДАНИЕ 4

class CurrencyConverter{
  Map<String, double> Currencies = {
    'USD': 1.0,    
    'EUR': 0.86,   
    'RUB': 75.88
  };

  void convert(double amount, String fromCurrency, String toCurrency){
    if (!Currencies.containsKey(fromCurrency) || !Currencies.containsKey(toCurrency)){
      print("Такой валюты у нас нету..");
      return;
    }

    double inUsd = amount / Currencies[fromCurrency]!;
    double result = inUsd * Currencies[toCurrency]!;

    print("$amount $fromCurrency = $result $toCurrency");
  }

  void updateRate(String currency, double newCurrency) {
    Currencies[currency] = newCurrency;
    print("Курс $currency обновлен до $newCurrency");
  }

}


// ЗАДАНИЕ 5

abstract class Vehicle{
  void startEngine();
  void showModel();
}

class Car implements Vehicle{
  String name;
  Car(this.name);

  @override
  void startEngine(){
    print("Машина $name заведена");
  }

  @override
  void showModel(){
    print("Модель данной машины: $name");
  }
}

class Motorcycle implements Vehicle{
  String name;
  Motorcycle(this.name);

  @override
  void startEngine(){
    print("Мотоцикл $name заведен");
  }

  @override
  void showModel(){
    print("Модель данного мотоцикла: $name");
  }
}

class Garage<T extends Vehicle>{
  List<T> storage = [];

  void park(T unit) {
    storage.add(unit);
    unit.showModel();   
    unit.startEngine(); 
  }
}

void main(){
  print("ЗАДАНИЕ 1");
  var myCup = Cup(250, 300);
  var myCup1 = Cup(300, 500);
  
  var person = Person("Давид");
  var person1 = Person("Даниил"); 
  

  person.drinkFromCup(myCup, 50);
  person.drinkFromCup(myCup, 200);

  person1.drinkFromCup(myCup, 100);
  person1.drinkFromCup(myCup1, 1000);

  print("\nЗАДАНИЕ 2");
  var firstShelf = StorageSystem(2, []);
  var secondShelf = StorageSystem(2, []);
  
  var myWardrobe = Wardrobe([firstShelf, secondShelf]);
  myWardrobe.putItem("Носки");
  myWardrobe.putItem("Нижнее белье");
  myWardrobe.putItem("Футболка");
  myWardrobe.putItem("Кроссовки");
  myWardrobe.putItem("Джинсы");
  
  myWardrobe.takeItem("Кроссовки");

  print("\nЗАДАНИЕ 3");
  var myBarbell = Barbell(100, [], []);

  var mediumPancake = Pancake(20.0);
  var heavyPancake = Pancake(35.0);

  myBarbell.addPancake(mediumPancake, "правая");
  myBarbell.addPancake(heavyPancake, "левая");
  myBarbell.addPancake(heavyPancake, "правая");

  // Знаю, ошибка, но это проверка!
  myBarbell.addPancake(mediumPancake, "левая");
  
  print("\n ЗАДАНИЕ 4");
  var myConverter = CurrencyConverter();

  myConverter.convert(10000, "RUB", "USD");
  myConverter.convert(200, "EUR", "KZT");

  myConverter.updateRate("RUB", 100.0);
  myConverter.convert(10000, "RUB", "USD");

  // ЗНАЮ ОШИБКА
  myConverter.convert(50, "JPY", "USD");

  print("ЗАДАНИЕ 5:");
  var myCarGarage = Garage<Car>();
  myCarGarage.park(Car("BMW"));
  myCarGarage.park(Car("Mercedes"));
  
  var MyMotorcycleGarage = Garage<Motorcycle>();
  MyMotorcycleGarage.park(Motorcycle("Kawasaki"));
}