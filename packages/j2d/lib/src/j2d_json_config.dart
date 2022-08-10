class JsonConfig {
  JsonConfig({required this.name});
  JsonConfig.fromMap(Map<String, dynamic> map)
      : assert(map[r'$name'] != null, r'set $name in json'),
        name = map[r'$name'];

  final String name;
}

Map<String, dynamic> filterMapKeys(Map<String, dynamic> map) {
  final result = <String, dynamic>{};
  for (var item in map.entries) {
    if (item.key.contains('#')) continue;
    if (item.key.contains(r'$')) continue;
    result.putIfAbsent(item.key, () => item.value);
  }

  return result;
}

String typeOfEntry(dynamic entryValue, String? typeValue) {
  if (typeValue != null) return typeValue;
  if (entryValue is String) return 'String';
  if (entryValue is num) return 'num';
  if (entryValue == null) return 'Null';
  if (entryValue is bool) return 'bool';
  if (entryValue is Map) {
    return entryValue[r'$name'];
  }
  if (entryValue is List) {
    if (entryValue.isEmpty) return 'List';
    final first = entryValue.first;
    String? nextTypeValue = first is Map ? first[r'$name'] : null;
    return 'List<${typeOfEntry(first, nextTypeValue)}>';
  }
  return 'Null';
}
