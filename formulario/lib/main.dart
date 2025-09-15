import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';
import 'cubit/formulario_cubit.dart';
import 'api/api.dart';
import 'presentation/inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final formularioCubit = FormularioCubit();
    final usuarioApi = UsuarioApi();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(formularioCubit, usuarioApi)),
        BlocProvider(create: (_) => formularioCubit),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login con Bloc & Cubit',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home:  const Inicial(),
      ),
    );
  }
}
