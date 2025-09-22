import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../modelo/modelo.dart';
import '../cubit/formulario_cubit.dart';
import '../api/api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FormularioCubit formularioCubit;
  final UsuarioApi usuarioApi;

  HomeBloc(this.formularioCubit, this.usuarioApi) : super(HomeInitial()) {
    on<InicioSession>((event, emit) async {
      emit(HomeLoading());

      await Future.delayed(const Duration(seconds: 2));

      try {
        final usuarios = await usuarioApi.fetchUsuarios();

        final usuario = usuarios.firstWhere(
          (u) =>
              u.nombre == event.nombre &&
              u.correo == event.correo &&
              u.password == event.password,
        );
        emit(
          HomeSucess(
            nombre: usuario.nombre ?? "",
            correo: usuario.correo,
            password: usuario.password,
          ),
        );

        formularioCubit.setSuccess(
          nombre: usuario.nombre ?? "",
          correo: usuario.correo,
          password: usuario.password,
        );
      } catch (e) {
        emit(const HomeFailure(mensaje: "Usuario o contraseña incorrectos"));
        formularioCubit.setFailure("Usuario o contraseña incorrectos");
      }
    });
  }
}

