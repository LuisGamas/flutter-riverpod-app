import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textStyles = Theme.of(context).textTheme;
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data, style: textStyles.headlineSmall),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh ),
        onPressed: () {  },
      ),
    );
  }
}