import 'planet.dart';

class PlanetarySystem {

  // Instance variable
  String name;
  
  List<Planet> planets;

  // Constructor with inline initializing formal
  // [] optional, or {} named parameter
  PlanetarySystem({this.name = 'Unnamed System', this.planets = const[] });

  int get numberOfPlanets => planets.length;

}

