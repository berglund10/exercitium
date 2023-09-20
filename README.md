<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Features

Biblioteket består av två olika klasser, exercise och workout som ska underlätta skapandet av ett träningssystem.

## Getting started

Efter att du har importerat paketet behöver du skapa egna Exercise klasser som ärver av exercise.

Exempelvis: 

class WeightTraining extends Exercise {
  WeightTraining(
      {required super.name,
      required super.description,
      required super.repetition,
      required super.weight,
      required super.rest,
      required super.sets});
}

class Running extends Exercise {
  Running(
      {required super.name,
      required super.description,
      required super.repetition,
      required super.weight,
      required super.rest,
      required super.sets});
}

Sedan skapa nya instanser av klassen med required named variabler.

  WeightTraining deadlift = WeightTraining(
      name: 'Deadlift',
      description: 'Exercise info for deadlift',
      sets: 3,
      repetition: 10,
      rest: 60,
      weight: 150);

Nästa steg är att skapa en instans av workout klassen, denna är också abstrakt så behöver ärvas av en annan klass.

class GymWorkout extends Workout {}

var gw = GymWorkout();

I workout klassen finns samtliga metoder som kan användas nedan visas några exempel.

gw.start(); Can't start workout because there are 0 exercises
gw.addExercise(deadlift); //Adding Deadlift to this workout
gw.start();
gw.workout(deadlift, 10); // Good job, 2 sets left
gw.workout(deadlift, 10); // Good job, 1 sets left
gw.workout(deadlift, 10); // Good job, 0 sets left
//Exercise is done.
//Removed Deadlift from this workout
gw.workout(deadlift, 10); // This exercise is already done
gw.getStatus(); // Status.finish

