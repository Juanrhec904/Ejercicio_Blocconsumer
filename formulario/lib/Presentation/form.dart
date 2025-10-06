import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/formulario_cubit.dart';
import 'loading.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos el cubit aquí
    return BlocProvider(
      create: (_) => FormularioCubit(),
      // Child que contiene la UI (el Scaffold)
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Bienvenido"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 113, 167, 236),
        ),
        body: Column(
          children: [
            Image.network(
              "https://media.istockphoto.com/id/1186972461/es/foto/coche-blanco-gen%C3%A9rico-aislado-sobre-fondo-blanco.jpg?s=612x612&w=0&k=20&c=hQgzsapAkGEo8gAmoTci9Ce6My3zsQQD8lST6C23yEY=",
              height: 240,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: BlocBuilder<FormularioCubit, FormularioState>(
                  buildWhen: (previous, current) =>
                      current is FormularioLoading ||
                      current is FormularioSucess ||
                      current is FormularioFailure,
                  builder: (context, state) {
                    if (state is FormularioLoading) {
                      return const loading();
                    } else if (state is FormularioSucess) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Nombre: ${state.nombre}"),
                          Text("Correo: ${state.correo}"),
                          Text("Contraseña: ${state.password}"),
                        ],
                      );
                    } else if (state is FormularioFailure) {
                      return Text(
                        state.mensaje,
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    return const Text("Esperando datos...");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
