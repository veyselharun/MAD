// Application of first Flutter app codelab from Flutter documentation
// https://codelabs.developers.google.com/codelabs/flutter-codelab-first
// https://docs.flutter.dev/get-started/codelab
//
// Original app and license info can be found in the codelab repo here:
// https://github.com/flutter/codelabs/tree/main/namer/step_08

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
