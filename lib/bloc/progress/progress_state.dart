part of 'progress_bloc.dart';

@immutable
abstract class ProgressState {}

class ProgressInitial extends ProgressState {}

class ProgressStarted extends ProgressState {}

class ProgressFinished extends ProgressState {}

class ProgressError extends ProgressState {
  final String error;

  ProgressError({required this.error});
}

class ProgressResultSended extends ProgressState {}

class ProgressResultSendingFinished extends ProgressState {}

class ProgressResultSendedError extends ProgressState {
  final String error;
  ProgressResultSendedError({required this.error});
}
