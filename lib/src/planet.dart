class Planet {

  final String name;        // The name of the planet
  final String description; // The description of the planet
  
  // Constructor sets name and description with args
  Planet({this.name, this.description});

  // Named constructor sets null planet
  Planet.nullPlanet() : name = 'Null', description = 'Null';

}