import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'formulario_state.dart';

class FormularioCubit extends Cubit<FormularioState> {
  FormularioCubit() : super(FormularioInitial());

  void setSuccess({
    required String nombre,
    required String correo,
    required String password,
  }) async {
    emit(FormularioLoading()); 

    await Future.delayed(const Duration(seconds: 2)); 

    emit(FormularioSucess(
      nombre: nombre,
      correo: correo,
      password: password,
    ));
  }

  void setFailure(String mensaje) {
    emit(FormularioFailure(mensaje: mensaje));
  }
}
