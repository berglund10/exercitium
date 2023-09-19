abstract class Exercise {
  final String name;
  final String description;
  int repetition;
  int weight;
  int sets;
  int rest;
  bool done = false;
  int index = 0;
  static List<Exercise> exerciseList = [];

  Exercise(
      {required this.name,
      required this.description,
      required this.repetition,
      required this.weight,
      required this.rest,
      required this.sets}) {
    exerciseList.add(this);
    index = repetition;
  }

  void updateExercise(
      {required int repetition,
      required int weight,
      required int sets,
      required int rest}) {
    done = false;
    if (repetition < 0 || weight < 0 || sets < 0 || rest < 0) {
      print("Can't update with negative values");
    }

    this.repetition = repetition.abs();
    this.weight = weight.abs();
    this.sets = sets.abs();
    this.rest = rest.abs();
    index = this.repetition;
  }

  bool oneExercise({required int repetition}) {
    if(done) {
      return done;
    }
    if (this.repetition - repetition == 0) {
      print("One set done, good job");
      sets--;
      this.repetition = index;
      if (sets == 0) {
        done = true;
        return done;
      } else {
        return false;
      }
    } else {
      this.repetition -= repetition;
      return false;
    }
  }
}
