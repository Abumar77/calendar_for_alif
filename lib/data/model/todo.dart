class Todo {
  int? id;
  String? name;
  String? description;
  String? time;
  String? location;
  int? color;
  String? date;
  String? monthYear;

  Todo({
    this.id,
    this.description,
    this.color,
    this.name,
    this.location,
    this.time,
    this.date,
    this.monthYear,
  });

  factory Todo.fromDatabaseJson(Map<String, dynamic> data) => Todo(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        time: data['time'],
        location: data['location'],
        color: data['color'],
        date: data['date'],
        monthYear: data['monthYear'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "id": id,
        "name": name,
        "description": description,
        "time": time,
        "location": location,
        "color": color,
        "date": date,
        "monthYear": monthYear,
      };
}
