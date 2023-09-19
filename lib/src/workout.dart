import 'package:exercitium/src/exercise.dart';

enum Status { ongoing, paused, finish }

abstract class Workout {
  Status _status = Status.paused;

  final List<Exercise> _exercises = [];

  Workout();

  void start() {
    if (_exercises.isEmpty) {
      print("Can't start workout because there are 0 exercises");
    } else {
      _status = Status.ongoing;
    }
  }

  void pause() {
    _status = Status.paused;
  }

  void finish() {
    _status = Status.finish;
  }

  Status getStatus() {
    return _status;
  }

  void addExercise(Exercise exercise) {
    if (_status == Status.finish) {
      print("This workout is already over");
    }
    if (!_exercises.contains(exercise)) {
      print("Adding ${exercise.name} to this workout");
      _exercises.add(exercise);
    } else {
      print("${exercise.name} is already registered");
    }
  }

  void removeExercise(Exercise exercise) {
    if (_status == Status.finish) {
      print("This workout is already over");
    } else {
      print("Removed ${exercise.name} from this workout");
      _exercises.remove(exercise);
    }
  }

  List<Exercise> getExercises() {
    if (_exercises.isEmpty) {
      _status = Status.finish;
      print("There is no exercises registered, stopping workout.");
      return [];
    } else {
      for (var i = 0; i < _exercises.length; i++) {
        print("${_exercises[i].name} exercise is registered");
      }
      return _exercises;
    }
  }

  void updateExercise(Exercise exercise, {required int repetition, required int weight, required int sets, required int rest}) {
      exercise.updateExercise(repetition: repetition, weight: weight, sets: sets, rest: rest);
  }

  void workout(Exercise exercise, int repetition) {
    if (_status == Status.ongoing) {
      bool finished = exercise.oneExercise(repetition: repetition);

      if (finished == true) {
        print("Exercise is done.");
        removeExercise(exercise);
        _status = Status.finish;
      } else {
        print("Exercise is not yet complete.");
        _status = Status.ongoing;
      }
    } else {
      print("You need to start an workout before you can exercise.");
    }
  }
}
