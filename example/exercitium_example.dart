import 'package:exercitium/exercitium.dart';

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

class GymWorkout extends Workout {}

void main() {
  WeightTraining? deadlift = WeightTraining(
      name: 'Deadlift',
      description: 'Exercise info for deadlift',
      sets: 3,
      repetition: 10,
      rest: 60,
      weight: 150);

  Running run = Running(
      name: "Running",
      description: "Exercise info for running",
      repetition: 10,
      weight: 0,
      rest: 60,
      sets: 2);

  var benchPress = WeightTraining(
      name: 'Bench Press',
      description: 'Exercise info for bench press',
      sets: 3,
      repetition: 10,
      rest: 60,
      weight: 150);

  var pullups = WeightTraining(
      name: 'Pull-Ups',
      description: 'Exercise info for pull-ups',
      sets: 1,
      repetition: 10,
      rest: 60,
      weight: 80);

  print(Exercise.exerciseList[1]);

  var w = GymWorkout();

  pullups.deleteExercise();

  print(w.getExercises().length);

  w.addExercise(run);
  w.addExercise(run);

  w.addExercise(benchPress);

  print(w.getStatus());

  w.addExercise(pullups);

  w.addExercise(Exercise.exerciseList[0]);

  w.getExercises();

  w.workout(run, 10);

  w.start();

  w.workout(run, 10);

  w.workout(run, 10);

  w.workout(run, 10);

  w.workout(run, 10);

  w.start();

  w.workout(benchPress, 5);
  //Endpoint som tar emot vilken övning och hur många reps;
  w.workout(benchPress, 5);
  w.workout(benchPress, 5);
  w.workout(benchPress, 5);
  w.workout(benchPress, 5);
  w.workout(benchPress, 5);
  w.workout(benchPress, 5);
  //Endpoint som visar alla färdiga övningar
  w.printDoneExercises();
}
