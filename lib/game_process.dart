import 'dart:math';

class GameProcess {
  int _answer=0;
  int _guessCount = 0;

  GameProcess() {
    var r = Random();
    _answer = r.nextInt(100) + 1;
    print(_answer);
  }
  int get guessCount {
    return _guessCount;
  }
  int doGuess(int num) {
    _guessCount++;
    if (num > _answer) {
      return -1;
    } else if (num < _answer) {
      return -2;
    } else {
      return 0;
    }
  }
}
//