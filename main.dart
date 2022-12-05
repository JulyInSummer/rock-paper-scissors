import 'dart:io';
import 'dart:math';

enum Move {
  rock,
  paper,
  scissors,
}

void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock, paper or scissors? ("r", "p", "s") ');
    final input = stdin.readLineSync()?.toLowerCase();
    if (input == 'r' || input == 'p' || input == 's') {
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      var playerMove;
      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else if (input == 's') {
        playerMove = Move.scissors;
      }
      print('You played: $playerMove');
      print('AI played: $aiMove');
      if (playerMove == aiMove) {
        print('It\'s draw!');
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.scissors && aiMove == Move.paper ||
          playerMove == Move.scissors && aiMove == Move.rock) {
        print('You win!');
      } else {
        print('You lose!');
      }
    } else if (input == 'q') {
      print('Selected: $input');
      print('Finishing program done!');
      break;
    } else {
      print('Invalid input: $input');
    }
  }
}
