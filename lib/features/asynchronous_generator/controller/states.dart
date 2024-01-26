abstract class AsyncGeneratorBaseStates {}

class AsyncGeneratorInitState extends AsyncGeneratorBaseStates {}

class AsyncGeneratorLoadingState extends AsyncGeneratorBaseStates {}

class AsyncGeneratorSuccessState extends AsyncGeneratorBaseStates {
  final List<String> data;

  AsyncGeneratorSuccessState(this.data);
}

class AsyncGeneratorErrorState extends AsyncGeneratorBaseStates {}
