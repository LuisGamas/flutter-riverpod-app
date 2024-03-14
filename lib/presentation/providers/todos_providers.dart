import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:uuid/uuid.dart';
import 'package:riverpod_app/domain/domain.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();
enum TodoFilterType { all, completed, pending }

@riverpod
class TodoCurrentFilter extends _$TodoCurrentFilter {

  @override
  TodoFilterType build() => TodoFilterType.all;

  void setCurrentFilter( TodoFilterType newFilter) {
    state = newFilter;
  }

}

@riverpod
class Todos extends _$Todos {

  @override
  List<Todo> build() => [

    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now() ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now() ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now() ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now() ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
    Todo( id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),

  ];

  void createTodo(String description) {
    state = [
      ...state,
      Todo( id: uuid.v4(), description: description, completedAt: null )
    ];
  }

}