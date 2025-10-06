import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../api/api.dart';
import '../cubit/formulario_cubit.dart';
import 'form.dart';
import 'failure.dart';
import 'loading.dart';

class Inicial extends StatefulWidget {
  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formularioCubit = FormularioCubit();
    final dioApi = DioApi();

    return BlocProvider(
      create: (_) => HomeBloc(formularioCubit, dioApi),
      child: Scaffold(
        appBar: AppBar(title: const Text("Formulario")),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeSucess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: formularioCubit,
                    child: FormScreen(
                      nombre: _nombreController.text,
                      correo: _correoController.text,
                      password: _passwordController.text,
                    ),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const loading();
            } else if (state is HomeFailure) {
              return failure(mensaje: state.mensaje);
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _nombreController,
                    decoration: const InputDecoration(labelText: "Nombre"),
                  ),
                  TextField(
                    controller: _correoController,
                    decoration: const InputDecoration(labelText: "Correo"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: "Contraseña"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(
                            InicioSession(
                              nombre: _nombreController.text,
                              correo: _correoController.text,
                              password: _passwordController.text,
                            ),
                          );
                    },
                    child: const Text("Ingresar"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
