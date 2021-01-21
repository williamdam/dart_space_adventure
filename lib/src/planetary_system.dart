import 'planet.dart';

class PlanetarySystem {

  // Instance variable
  final String name;
  
  // Dynamic array of Planet objects
  final List<Planet> planets;

  // Constructor with inline initializing formal
  PlanetarySystem({this.name = 'Unnamed System', this.planets = const[] });

  // Get function returns number of planets. Uses arrow syntax.
  int get numberOfPlanets => planets.length;

  // Get function returns bool true if there are planets
  bool get hasPlanets => planets.isNotEmpty;
  
}

