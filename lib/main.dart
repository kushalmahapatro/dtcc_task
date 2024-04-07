import 'package:dtcc_task/constants/app_strings.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_parser.dart';
import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';

const String url =
    'https://flutter-task-19599-default-rtdb.firebaseio.com/test/data.json';

void main() async {
  await Mirai.initialize(parsers: [
    ...CardParser.parsers,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MiraiApp(
      theme: const MiraiTheme(fontFamily: AppStrings.fontFamily),
      darkTheme: const MiraiTheme(fontFamily: AppStrings.fontFamily),
      homeBuilder: (BuildContext context) => Mirai.fromNetwork(
        context: context,
        request: const MiraiNetworkRequest(
          method: Method.get,
          url: url,
        ),
      ),
    );
  }
}
