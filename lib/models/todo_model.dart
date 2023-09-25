class TodoModel{
  int id;
  String name;
  String description;
  TodoModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory TodoModel.fromJson(Map<String,Object?> json){
    return TodoModel(
      id: json["id"] as int,
      name: json["name"] as String,
      description: json["description"]as String,
    );
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description":description,
  };

  @override
  String toString() {
    return 'TodoModel(id: $id, name: $name, description: $description)';
  }
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is TodoModel &&
              runtimeType == other.runtimeType &&
              id == other.id ;
  @override
  int get hashCode => id;

}