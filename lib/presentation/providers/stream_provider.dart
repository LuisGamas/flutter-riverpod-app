import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<String>> usersInChat(UsersInChatRef ref) async*{
  
  final names = <String>['Luis Gamas [Gamas.dev] @Developer'];
  yield names;
  
  await for ( final name in RandomGenerator.randomNameStream() ) {
    names.add(name);
    yield names;
  }
  
}