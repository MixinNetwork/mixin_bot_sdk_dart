sealed class UtxoException implements Exception {}

class NotEnoughOutputsException extends UtxoException {}

class MaxCountNotEnoughUtxoException extends UtxoException {}
