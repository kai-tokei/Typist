import 'package:typist/consts/message_event.dart';

class Messages {
  Messages._();
  static final instance = Messages._();

  List<MessageEvent> events = [];

  void add(MessageEvent event) {
    events.add(event);
  }

  void remove(MessageEvent event) {
    events.remove(event);
  }

  List<MessageEvent> getAll() {
    return events;
  }
}
