
import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
    TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList =  [
    Task(
      "Aprender Flutter",
      "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      4),
    Task(
        "Meditar",
        'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
        4),
    Task(
        "Jogar bola",
        'https://vasco.com.br/wp-content/themes/VascoTemplate/img/logo_home2.png',
        3),
    Task(
        "Ver TV",
        'https://m.media-amazon.com/images/G/01/pv_starlight/trop-c9184079-2c78-432f-9f38-49d5ab3c4158/Galadriel_1080_Thumbnail_7b18ca42-8116-4b54-8d55-c071efe7772d._SX256_.jpg',
        1),
    Task(
        "Andar de bike",
        'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
        2),
    Task(
        "Jogar LOL",
        'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Volibear_0.jpg',
        3),
    Task(
        "Caçar Pokemon",
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/197.png',
        2),
    Task(
        "Ouvir Musica",
        'https://upload.wikimedia.org/wikipedia/commons/8/8a/Jackson_5_tv_special_1972.JPG',
        1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
