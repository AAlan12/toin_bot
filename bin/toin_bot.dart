
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async {
  String toinBot = 'ToinBOT:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().toinStream(1,10);
  var subscriber = myStream.listen((event) {
    print("                     Toinbot está ativo por $event segundos");
  },onDone: () {
    print("Toinbot está sendo finalizado, faça a ultima pergunta");
    a = false;
  });
  
  print('-- Iniciando o ToinBOT, aguarde..--');

  print('ToinBOT:\n Oi :) \n Como posso ajudar?');
  await BotClock().clock(2);
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(toinBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock().clock(2);
      TimeQuestions(usuario).timeQuestion();
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
      await BotClock().clock(2);
      print(toinBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(toinBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando ToinBOT--');
}
