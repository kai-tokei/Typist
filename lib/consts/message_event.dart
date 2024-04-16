// メッセージイベントの構造体
class MessageEvent {
  const MessageEvent({
    required this.label,
    required this.posX,
    required this.posY,
    required this.width,
    required this.height,
    required this.message,
  });

  final String label;
  final int posX;
  final int posY;
  final int width;
  final int height;
  final String message;

  List<String> toCSVFormat() =>
      [label, '$posX', '$posY', '$width', '$height', message];
}
