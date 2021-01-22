import 'package:dart_space_adventure/dart_space_adventure.dart';

// Hold system name
  const systemName = 'Solar System';

  // Map holds name:description pairs for planet data
  const planetData = {
    'Mercury': 'A very hot planet, closest to the sun.',
    'Venus': 'It\'s very cloudy here!',
    'Earth': 'There is something very familiar about this planet.',
    'Mars': 'Known as the red planet.',
    'Jupiter': 'A gas giant, with a noticeable red spot.',
    'Saturn': 'This planet has beautiful rings around it.',
    'Uranus': 'Strangely, this planet rotates around on its side.',
    'Neptune': 'A very cold planet, furthest from the sun.',
    'Pluto': 'I don\'t care what they say - it\'s a planet.'
  };

void main(List<String> arguments) {

  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: systemName, 
      planets: mockPlanets()
      )
    ).start();
}

// Build list of planet objects from key-value pairs
List<Planet> mockPlanets() {
  // Get entries from key-value pairs, map, then return objects
  // Returns as iterable, use .toList() to convert to list
  return planetData.entries.map( 
    (e) => Planet(name: e.key, description: e.value)
  ).toList();
}