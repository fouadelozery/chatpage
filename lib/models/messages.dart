class Messages {
  final String message;
  final String id;

  Messages(this.message, this.id);

  factory Messages.fromjson(jsonData) {
    return Messages(jsonData['message'] ?? jsonData['text'],
        jsonData['id'] ?? jsonData['text']);
  }
}
