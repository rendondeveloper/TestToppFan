import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_toppfan/ui/provider/providerstadium.dart';
import 'package:test_toppfan/ui/view/stadium.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TestToppFan());
}

class TestToppFan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProviderStadium())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Stadium(),
        ));
  }
}