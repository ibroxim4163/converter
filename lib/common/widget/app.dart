import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

import '../../feature/data/repository.dart';
import '../../feature/main_page/main_page.dart';
import '../../feature/models/city_model.dart';
import '../../feature/provider/data_provider.dart';
import '../../feature/provider/inherited_widget.dart';
import '../../feature/provider/local_provider.dart';
import '../../l10n/l10n.dart';
import '../services/api_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final Repository repository;
  late final TextEditingController controller1;
  late final TextEditingController controller2;

  List<CityModel> cities = [];
  void getAllCities() async {
    cities = await repository.getAllUser();
    setState(() {});
  }

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    repository = RepositoryImp(ApiService());
    getAllCities();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LocalProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocalProvider>(context);
        return MyProvider(
          dataProvider: DataProvider(
            controller1: controller1,
            controller2: controller2,
            cities: cities,
          ),
          child: MaterialApp(
            locale: provider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            home: const MainPage(),
          ),
        );
      },
    );
  }
}