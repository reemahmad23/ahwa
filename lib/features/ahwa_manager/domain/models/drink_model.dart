abstract class DrinkModel {
  final String id;
  final String name;

  DrinkModel({
    required this.id,
    required this.name,
  });

  double get price ;

}

class Tea extends DrinkModel {
  Tea(): super(id: 'tea', name: 'Tea');


  @override
  double get price => 40.0;
}


class TurkishCoffee extends DrinkModel {
  TurkishCoffee(): super(id : 'turkish_coffee', name :'Turkish Coffee');

  @override
  double get price => 80.0;
}

class HibiscusTea extends DrinkModel {
  HibiscusTea(): super(id : 'hibiscus', name: 'Hibiscus Tea');

  @override
  double get price => 60.0;
}

