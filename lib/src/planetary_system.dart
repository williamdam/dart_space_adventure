import 'dart:math';
import 'planet.dart';

class PlanetarySystem {

  // Instantiate random number
  final Random _random = Random();

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

  // Return random planet
  Planet randomPlanet() {
    if (!hasPlanets) return Planet.nullPlanet();
    return planets[_random.nextInt(planets.length)];
  }

  Planet planetWithName(String name) {

    // Return first planet where planet.name == name
    return planets.firstWhere( 
      (planet) => planet.name == name,
      // Return null planet
      orElse: () => Planet.nullPlanet()
    );
  }
}

