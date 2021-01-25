import 'dart:io';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {

  // The planetary system that holds all Planet objects
  final PlanetarySystem planetarySystem;
  // Constructor sets planetary system
  SpaceAdventure({this.planetarySystem});

  // Runs the space adventure game
  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');

    if (planetarySystem.hasPlanets) {
      travel(promptForRandomOrSpecificDestination(
      'Shall I randomly choose a planet for you to visit? (Y or N)'
      )
    );
    } else {
      print('Aw, there are no planets to explore.');
    }
    
  }

  // Print greeting with planetary system name and number of planets
  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}.');
    print('There are ${planetarySystem.numberOfPlanets} planets to explore.');
  }

  // Print greeting with user's name
  void printIntroduction(String name) {
    print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  // Returns user input, after printing prompt from arg
  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }

  // Sets planet object randomly, or from arg, then invokes travelTo()
  void travel(bool randomDestination) {
    Planet planet;
    if (randomDestination) {
      planet = planetarySystem.randomPlanet();
    } else {
      planet = getPlanetInput();
    }
    travelTo(planet);
  }

  // Returns planet object based on user input
  Planet getPlanetInput() {
    Planet planet;
    var planetExists = false;
    while (planetExists != true) {
      planet = planetarySystem.planetWithName(
        responseToPrompt('Name the planet you would like to visit.')
      );
      if (checkPlanetExists(planet) == false) {
        print('Planet doesn\'t exist.  Enter another planet name.');
      } else {
        planetExists = true;
      }
    }
    return planet;
  }

  // Returns false if planet arg doesn't exist
  bool checkPlanetExists(Planet planet) {
    if (planet.name == 'Null' && planet.description == 'Null') {
      return false;
    }
    return true;
  }

  // Prints planet name and description
  void travelTo(Planet planet) {
    print('Traveling to ${planet.name}');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  // Returns true if user wants random destination
  bool promptForRandomOrSpecificDestination(String prompt) {
    String answer;
    while (answer != 'Y' && answer != 'N') { 
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {      
        return false;
      } else {
        print('Sorry, I didn\'t get that.');
      }
    }
    return false;
  }

}
