class Band {
  String id;
  String name;
  int votes;
  Band({required this.id, required this.name, required this.votes});

  factory Band.fromMap(Map<String, dynamic> o) =>
      Band(id: o["id"], name: o["name"], votes: o["votes"]);
}
