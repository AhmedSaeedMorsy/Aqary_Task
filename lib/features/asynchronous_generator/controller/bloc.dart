import 'event.dart';
import 'states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsyncGeneratorBloc
    extends Bloc<AsyncGeneratorBaseEvent, AsyncGeneratorBaseStates> {
  static AsyncGeneratorBloc get(context) => BlocProvider.of(context);
  AsyncGeneratorBloc() : super(AsyncGeneratorInitState()) {
    on<AsyncGeneratorEvent>((event, emit) async {
      emit(AsyncGeneratorLoadingState());

      try {
        final data = await fetchData(); // Simulated data fetching

        emit(AsyncGeneratorSuccessState(data));
      } catch (error) {
        emit(AsyncGeneratorErrorState());
      }
    });
  }

  Future<List<String>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulating an API delay
    return ['Item 1', 'Item 2', 'Item 3'];
  }
}
