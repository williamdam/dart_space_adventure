import 'dart:convert';
import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';

// Dynamic List stores planet data
List<dynamic> planetData;
void main(List<String> arguments) {

  // Check program start command for arguments
  if (arguments.isNotEmpty) {

    // The json planet data converted to string
    final jsonString = File(arguments[0]).readAsStringSync();

    // The name of the planetary system, from planet data
    final systemName = jsonDecode(jsonString)['name'];
  
    // The planet data converted to json
    planetData = jsonDecode(jsonString)['planets'];

    // Starts space adventure program
    SpaceAdventure(
      planetarySystem: PlanetarySystem(
        name: systemName, 
        planets: getPlanets()
        )
      ).start();
  } else {
    print('Error: You must provide planet data (e.g. bin/data.json)');
  }
  
}

// The list of planet objects, mapped from planet data
List<Planet> getPlanets() {
  // Map key-value pairs to Planet objects
  // Returns as iterable, use .toList() to convert to list
  return planetData.map( 
    (planet) => Planet(name: planet['name'], description: planet['description'])
  ).toList();
}