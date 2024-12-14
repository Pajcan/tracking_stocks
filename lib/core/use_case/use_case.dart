abstract class UseCase<ReturnType, Params> {
  ReturnType execute(Params params);
}

abstract class UseCaseNoParams<ReturnType> {
  ReturnType execute();
}
