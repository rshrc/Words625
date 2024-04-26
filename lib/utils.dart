Map<String, String> flattenLanguage(
    Map<String, Map<String, String>> nestedMap) {
  Map<String, String> flatMap = {};

  nestedMap.forEach((category, items) {
    flatMap.addAll(items);
  });

  return flatMap;
}
