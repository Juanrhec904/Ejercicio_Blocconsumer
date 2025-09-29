import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/Presentation/loading.dart';
import 'package:formulario/Presentation/failure.dart';
import 'bloc/home_bloc.dart';
import 'cubit/formulario_cubit.dart';
import 'api/api.dart';
import 'presentation/inicial.dart';
import 'presentation/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final formularioCubit = FormularioCubit();
    final dioApi = DioApi();

    return BlocProvider(
      create: (_) => HomeBloc(formularioCubit, dioApi),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login con Bloc & Cubit',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: BlocProvider.value(
          value: formularioCubit,
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeSucess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BlocProvider.value(
                          value: formularioCubit,
                          child: const form(),
                        ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is HomeInitial) {
                return const Inicial();
              } else if (state is HomeLoading) {
                return const loading();
              } else if (state is HomeFailure) {
                return failure(mensaje: state.mensaje);
              }
              return const Inicial();
            },
          ),
        ),
      ),
    );
  }
}
