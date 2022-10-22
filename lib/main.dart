import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_exports.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_bloc/screens/tabs_screen.dart';
import 'package:todo_bloc/services/app_router.dart';
import 'package:todo_bloc/services/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(
            appRouter: AppRouter(),
          )),
      storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.lightTheme]
                : AppThemes.appThemeData[AppTheme.darkTheme],
            home: const TabsScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
