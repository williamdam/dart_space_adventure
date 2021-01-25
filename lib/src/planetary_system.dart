import 'dart:math';
import 'planet.dart';

class PlanetarySystem {

  // Instantiate random number generator
  final Random _random = Random();
  // The name of the planetary system
  final String name;
  // The list of planet objects
  final List<Planet> planets;

  // Constructor sets planetary system name and list of planet objects
  PlanetarySystem({this.name = 'Unnamed System', this.planets = const[] });

  // Returns number of planets
  int get numberOfPlanets => planets.length;

  // Returns bool true if there are planets
  bool get hasPlanets => planets.isNotEmpty;

  // Returns random planet or null planet if none exist
  Planet randomPlanet() {
    if (!hasPlanets) return Planet.nullPlanet();
    return planets[_random.nextInt(planets.length)];
  }

  // Returns planet object with name matching arg, or null planet
  Planet planetWithName(String name) {
    return planets.firstWhere( 
      (planet) => planet.name == name,
      orElse: () => Planet.nullPlanet()
    );
  }
}

