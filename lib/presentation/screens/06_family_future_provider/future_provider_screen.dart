import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {

  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;
    final pokemonAsync = ref.watch(PokemonProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Future Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Pokemon número: $pokemonId', style: textStyles.bodyLarge),

            const SizedBox(height: 10),

            pokemonAsync.when(
              data: (data) => Text(data, style: textStyles.headlineSmall),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator()
            ),

          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: 'fab_next',
            child: const Icon( Icons.chevron_right_rounded ),
            onPressed: () { 
              if (pokemonId == 600) return;
              pokemonId++;
              setState(() { });
            },
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'fab_prev',
            child: const Icon( Icons.chevron_left_rounded ),
            onPressed: () { 
              if (pokemonId <= 1) return;
              pokemonId--;
              setState(() { });
            },
          ),

        ],
      )
    );
  }
}