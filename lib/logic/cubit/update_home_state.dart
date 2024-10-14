part of 'update_home_cubit.dart';

@immutable
sealed class UpdateHomeState {}

final class UpdateHomeInitial extends UpdateHomeState {}

final class UpdateHomeLoading extends UpdateHomeState {}

final class UpdateHomeLoaded extends UpdateHomeState {}

final class UpdateHomeError extends UpdateHomeState {}

final class UpdateHomeLanguageChanged extends UpdateHomeState {
  final Locale locale;

  UpdateHomeLanguageChanged(this.locale);
}
