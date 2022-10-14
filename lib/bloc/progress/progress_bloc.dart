import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:flutter_webspark_test/data/repository/result_repository.dart';
import 'package:flutter_webspark_test/data/repository/result_repository_impl.dart';
import 'package:flutter_webspark_test/presentation/screens/result_list_screen.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressInitial()) {
    ResultRepository resultRepository = ResultRepositoryImpl();

    on<ProgressInitiated>((event, emit) async {
      try {
        emit(ProgressStarted());
        StaticValues.results = await resultRepository.getResults();
        emit(ProgressFinished());
      } catch (e) {
        emit(ProgressError(error: e.toString()));
      }
    });
    on<ProgressSendResult>((event, emit) async {
      try {
        emit(ProgressResultSended());
        int statusCode = await resultRepository.sendResults();
        if (statusCode == 200) {
          emit(ProgressResultSendingFinished());
        } else if (statusCode == 429) {
          emit(ProgressResultSendedError(error: 'Too Many Requests'));
        } else if (statusCode == 500) {
          emit(ProgressResultSendedError(error: 'Internal Server Error'));
        }
      } catch (e) {
        emit(ProgressError(error: e.toString()));
      }
    });
    on<ProgressSendingFinished>(
      (event, emit) {
        Navigator.push(
          event.context,
          MaterialPageRoute(builder: (context) => const ResultListScreen()),
        );
      },
    );
  }
}
