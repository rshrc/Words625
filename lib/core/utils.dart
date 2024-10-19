import 'dart:math';

Map<String, String> flattenLanguage(
    Map<String, Map<String, String>> nestedMap) {
  Map<String, String> flatMap = {};

  nestedMap.forEach((category, items) {
    flatMap.addAll(items);
  });

  return flatMap;
}

Map<K, V> shuffleMap<K, V>(Map<K, V> inputMap) {
  List<MapEntry<K, V>> entries = inputMap.entries.toList();

  var random = Random();
  entries.shuffle(random);

  return Map.fromEntries(entries);
}

String getFormattedTime(int totalSeconds) {
  final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
  final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
  return "$minutes:$seconds";
}
