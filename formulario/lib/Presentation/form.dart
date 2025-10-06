import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/formulario_cubit.dart';
import 'loading.dart';

class FormScreen extends StatefulWidget {
  final String nombre;
  final String correo;
  final String password;

  const FormScreen({
    super.key,
    required this.nombre,
    required this.correo,
    required this.password,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormularioCubit()..setLoading(),
      child: BlocBuilder<FormularioCubit, FormularioState>(
        builder: (context, state) {
          final cubit = context.read<FormularioCubit>();

  
          Future.delayed(const Duration(seconds: 3), () {
            cubit.setSuccess(
              nombre: widget.nombre,
              correo: widget.correo,
              password: widget.password,
            );
          });

          return Scaffold(
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
                    child: () {
                      if (state is FormularioLoading) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            loading(),
                            SizedBox(height: 10),
                            Text("Cargando datos..."),
                          ],
                        );
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
                    }(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
