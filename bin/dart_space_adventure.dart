import 'dart:convert';
import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';

// Hold system name
const systemName = 'Solar System';

// Dynamic List stores planet data
List<dynamic> planetData;
void main(List<String> arguments) {

  // Read in json file passed as arg, to string
  final jsonString = File(arguments[0]).readAsStringSync();

  // Get planetary system name from json
  final systemName = jsonDecode(jsonString)['name'];
  
  // Get list of planets from json
  planetData = jsonDecode(jsonString)['planets'];

  // Instantiate SpaceAdventure object with data, and call start()
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: systemName, 
      planets: getPlanets()
      )
    ).start();
}

// Build list of planet objects from key-value pairs, using map function
List<Planet> getPlanets() {
  // Get entries from key-value pairs, map, then return objects
  // Returns as iterable, use .toList() to convert to list
  return planetData.map( 
    (planet) => Planet(name: planet['name'], description: planet['description'])
  ).toList();
}