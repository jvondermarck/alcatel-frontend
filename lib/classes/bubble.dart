class Bubble {
  int id;
  String name;
  String topic;
  double latitude;
  double longitude;
  String creator;

  Bubble({
    this.id = 0,
    this.name = '',
    this.topic = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.creator = '',
  });

  factory Bubble.fromMap(Map<Object?, Object?> map) {
    return Bubble(
      name: map['name'] as String,
      topic: map['topic'] as String,
    );
  }
}
