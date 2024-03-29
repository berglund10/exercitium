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
      sets: 2,
      repetition: 10,
      rest: 60,
      weight: 80);

  var gw = GymWorkout();

gw.start();
gw.addExercise(deadlift);
gw.start();
gw.workout(deadlift, 10);
gw.workout(deadlift, 10);
gw.workout(deadlift, 10);
gw.workout(deadlift, 10);
gw.workout(deadlift, 10);
gw.addExercise(deadlift);
gw.start();
gw.workout(deadlift, 10);
gw.getStatus();

var wg = GymWorkout();
wg.addExercise(pullups);
wg.start();
wg.workout(pullups, 10);
wg.workout(pullups, 10);
wg.workout(pullups, 10);
wg.workout(pullups, 10);

wg.addExercise(deadlift);
wg.start();
wg.workout(deadlift, 10);
wg.workout(deadlift, 10);
wg.workout(deadlift, 10);
wg.workout(deadlift, 10);


Workout.workoutList.length;
for (var i = 0; i < Workout.workoutList.length; i++) {
  Workout.workoutList[i].printDoneExercises();
  
}


}
