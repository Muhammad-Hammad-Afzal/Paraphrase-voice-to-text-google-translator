import 'package:flutter/material.dart';
import 'package:paraphrasing_tool/utils/routes/routes_name.dart';
import 'package:paraphrasing_tool/views/home.dart';
import 'package:paraphrasing_tool/views/import_screen.dart';
import 'package:paraphrasing_tool/views/paraphrase_text.dart';
import 'package:paraphrasing_tool/views/splash_screen.dart';
import 'package:paraphrasing_tool/views/translate_text.dart';
import 'package:paraphrasing_tool/views/voice_text.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) =>const SplashScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) =>const Home());

      case RoutesName.importText:
        return MaterialPageRoute(builder: (BuildContext context) =>const ImportText());

      case RoutesName.paraphraseText:
        return MaterialPageRoute(builder: (BuildContext context) =>const ParaphraseText());

      case RoutesName.voiceText:
        return MaterialPageRoute(builder: (BuildContext context) =>const VoiceText());

      case RoutesName.translateText:
        return MaterialPageRoute(builder: (BuildContext context) =>const TranslateText());

      default:
        return MaterialPageRoute(builder: (BuildContext context) =>const Scaffold(
          body: Center(child: Text('There Is No Such Route')),
        ));
    }
  }
}