class Planet {

  final String name;
  final String description;
  
  // Constructor
  Planet({this.name, this.description});

  // Named constructor, intializer list.
  Planet.nullPlanet() : name = 'Null', description = 'Null';

}