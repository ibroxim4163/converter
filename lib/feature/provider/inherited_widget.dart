import 'package:flutter/material.dart';
import 'package:homework/feature/provider/data_provider.dart';

class MyProvider extends InheritedNotifier<DataProvider> {
  final DataProvider dataProvider;
  const MyProvider({
    required this.dataProvider,
    required super.child,
    super.key,
  }) : super(notifier: dataProvider);

  static DataProvider of(BuildContext context, [bool listen = true]) => listen
      ? context.dependOnInheritedWidgetOfExactType<MyProvider>()!.dataProvider
      : (context.getElementForInheritedWidgetOfExactType<MyProvider>()!.widget
              as MyProvider)
          .dataProvider;
}
