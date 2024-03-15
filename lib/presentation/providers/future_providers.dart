import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(PokemonNameRef ref) async {

  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

  ref.onDispose(() {
    print('A punto de eliminar este provider');
  });

  return pokemonName;
  
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  
  @override
  int build() => 1;

  void prevPokemon() {
    if (state > 1) {
      state--;
    }
  }

  void nextPokemon() {
    state++;
  }
}