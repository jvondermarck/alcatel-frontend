class Bubble {
  String id;
  String name;
  String topic;
  double latitude;
  double longitude;
  String creatorId;

  Bubble({
    this.id = '',
    this.name = '',
    this.topic = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.creatorId = '',
  });

  factory Bubble.fromMap(Map<Object?, Object?> map) {
    return Bubble(
      id: map['id'] as String,
      name: map['name'] as String,
      topic: map['topic'] as String,
      creatorId: map['creatorId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id, not to used for the moment
      'name': name,
      // 'topic': topic, not to use for the moment
      'latitude': latitude,
      'longitude': longitude,
      'creator': creatorId,
    };
  }
}
