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

class GymWorkout extends Workout {}

void main() {
  WeightTraining? deadlift = WeightTraining(
      name: 'Deadlift',
      description: 'Exercise info for deadlift',
      sets: 3,
      repetition: 10,
      rest: 60,
      weight: 150);

      deadlift.updateExercise(repetition: 20, sets: 3, rest: 30, weight: 10);

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


      var w = GymWorkout();

      w.start();
      //Can't start workout because there are 0 exercises

      w.addExercise(deadlift);
      w.addExercise(benchPress);
      w.addExercise(pullups);

      w.updateExercise(deadlift, repetition: 10, sets: 3, rest: 30, weight: 10);
      //Adding Deadlift to this workout
      //Adding Bench Press to this workout
      //Adding Pull-Ups to this workout
      //w.workout(deadlift, 5);
      //You need to start an workout before you can exercise.
      w.start();
      w.workout(deadlift, 5);
      w.workout(deadlift, 5);
      w.workout(deadlift, 5);
      w.workout(deadlift, 5);

      w.workout(deadlift, 5);
      w.workout(deadlift, 5);

      w.workout(deadlift, 5);
      //This exercise is already done


      deadlift = null;


     // w.start();

}
