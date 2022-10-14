part of 'progress_bloc.dart';

@immutable
abstract class ProgressEvent {}

class ProgressInitiated extends ProgressEvent {}

class ProgressSendResult extends ProgressEvent {}

class ProgressSendingFinished extends ProgressEvent {
  final BuildContext context;
  ProgressSendingFinished({required this.context});
}
