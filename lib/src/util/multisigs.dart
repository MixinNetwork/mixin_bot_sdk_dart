String encodeScript(int threshold) {
  var s = threshold.toRadixString(16);
  if (s.length == 1) {
    s = '0$s';
  }
  if (s.length > 2) {
    throw Exception('invalid threshold. $threshold');
  }
  return 'fffe$s';
}
