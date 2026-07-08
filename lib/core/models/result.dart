abstract class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final String message;
  final Exception? exception;
  const Error(this.message, {this.exception});
}

class Loading<T> extends Result<T> {
  const Loading();
}
