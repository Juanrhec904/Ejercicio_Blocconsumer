part of 'formulario_cubit.dart';

sealed class FormularioState extends Equatable {
  const FormularioState();

  @override
  List<Object> get props => [];
}

final class FormularioInitial extends FormularioState {}
final class FormularioSucess extends FormularioState{}
final class FormularioLoading extends FormularioState{}
final class FormularioFailure extends FormularioState{}