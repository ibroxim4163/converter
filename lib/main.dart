import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/l10n/app_localizations.dart';
import 'data/repository/currency_repository.dart';
import 'data/services/api_service.dart';
import 'logic/language_bloc/language_bloc.dart';
import 'logic/main_bloc/main_bloc.dart';
import 'presentation/main_screen.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc(
            RepositoryImp(ApiService()),
          )..add(
              const LoadingEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(),
        )
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            locale: context.watch<LanguageBloc>().state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: const MainPage(),
          );
        }
      ),
    );
  }
}
