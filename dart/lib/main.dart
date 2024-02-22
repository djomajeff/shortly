import 'package:flutter/material.dart';
import 'package:shortly/logic/cubit/link_cubit.dart';
import 'package:shortly/repositories/link_repository.dart';
import 'views/views.dart';
import 'utils/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await dotenv.load();
  final apiKey = dotenv.get('APIKEY');
  final linkRepository = LinkRepository()..setApiKey(apiKey);
  runApp(App(linkRepository: linkRepository));
}

class App extends StatelessWidget {
  const App({super.key, required this.linkRepository});

  final LinkRepository linkRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ligthBaseTheme,
      themeMode: ThemeMode.light,
      home: RepositoryProvider(
        create: (context) => linkRepository,
        child: BlocProvider(
          create: (_) => LinkCubit(linkRepository),
          child: const HomePage(),
        ),
      ),
    );
  }
}
