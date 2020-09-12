import 'package:acadpal_task/bloc/covid_bloc.dart';
import 'package:acadpal_task/repositories/connectivityService.dart';
import 'package:acadpal_task/repositories/enums.dart';
import 'package:acadpal_task/repositories/repositories.dart';
import 'package:acadpal_task/bloc/bloc_delegate.dart';
import 'package:acadpal_task/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  Stetho.initialize();
  final ApiRepository apiRepository = ApiRepository(
    apiClient: ApiClient(),
  );
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => Covid_19Bloc(apiRepository: apiRepository)),
    ],
    child: MyApp(
      apiRepository: apiRepository,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final ApiRepository apiRepository;

  const MyApp({Key key, @required this.apiRepository})
      : assert(apiRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<ConnectivityStatus>(
      create: (BuildContext context) =>
      ConnectivityService().connectionStatusController.stream,
      child: BlocBuilder<Covid_19Bloc, Covid_19State>(
        builder: (BuildContext context, Covid_19State state) {
          return ThemeProvider(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home:  BlocProvider(
                    create: (context) => Covid_19Bloc(
                      apiRepository: apiRepository,
                    ),
                    child: Home(),
                  ),
                ),
          );
        },
      ),
    );
  }
}