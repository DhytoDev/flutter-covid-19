import 'package:meta/meta.dart';

class Resource<T> {
  final ResourceState resourceState;
  final T data;
  final String message;

  Resource({@required this.resourceState, this.data = null, this.message = null});
}

enum ResourceState { LOADING, SUCCESS, ERROR }
