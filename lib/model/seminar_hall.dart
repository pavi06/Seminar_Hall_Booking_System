class Seminar{
  String docId;
  String name;
  int capacity;
  int session;
  String event;
  bool isBooked;
  String image;
  String status;
  String bookedPerson;

  Seminar(this.docId,this.name, this.capacity,this.session,this.event,this.isBooked, this.image,this.status, this.bookedPerson);

  Seminar.fromJson(Map<String, dynamic> json, String documentId) {
    name = json['name'];
    capacity = json['capacity'];
    session =json['session'];
    event =json['event'];
    isBooked = json['isBooked'];
    image = json['image'];
    status=json['status'];
    bookedPerson=json['bookedPerson'];
    docId=documentId;
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'capacity': capacity,
    'session': session,
    'event': event,
    'isBooked': isBooked,
    'image': image,
    'status':status,
    'bookedPerson': bookedPerson,
  };
}
