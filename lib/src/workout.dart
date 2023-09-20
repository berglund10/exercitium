import 'package:exercitium/src/exercise.dart';

enum Status { ongoing, paused, finish }

abstract class Workout {
  Status _status = Status.paused;

  final List<Exercise> _exercises = [];
  final List<Exercise> _doneExercises = [];
  static List<Workout> workoutList = [];

  Workout() {
    workoutList.add(this);
  }

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
    if (exercise.isDeleted == true) {
      print("This exercise is deleted");
      return;
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
      _status = Status.paused;
      print("There is no exercises registered, pausing workout.");
      return [];
    } else {
      for (var i = 0; i < _exercises.length; i++) {
        print("${_exercises[i].name} exercise is registered");
      }
      return _exercises;
    }
  }

  void updateExercise(Exercise exercise,
      {required int repetition,
      required int weight,
      required int sets,
      required int rest}) {
    exercise.updateExercise(
        repetition: repetition, weight: weight, sets: sets, rest: rest);
  }

  List<Exercise> getDoneExercises() {
    return _doneExercises;
  }

  void printDoneExercises() {
    for (var i = 0; i < _doneExercises.length; i++) {
      print("------------------Info about exercise------------------");
      print("Name: ${_doneExercises[i].name}");
      print("Sets: ${_doneExercises[i].sets}");
      print("Repetitions: ${_doneExercises[i].repetition}");
      print("Weight: ${_doneExercises[i].weight}");
      print("Rest: ${_doneExercises[i].rest}");
    }
  }

  void workout(Exercise exercise, int repetition) {
    if (exercise.isDeleted) {
      print("This exercise is deleted");
      return;
    }
    if (exercise.done) {
      print("This exercise is already done");
      return;
    }
    if (_status == Status.ongoing) {
      bool finished = exercise.oneExercise(repetition: repetition);

      if (finished == true) {
        print("Exercise is done.");
        _doneExercises.add(exercise);
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
