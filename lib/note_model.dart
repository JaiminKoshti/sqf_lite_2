class Note {
  final int? id;
  final String title;
  final String description;

  const Note({required this.title, required this.description, this.id});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
      title: json['title'],
      description: json['description'],
      id: json['id']
  );

  Map<String,dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'description' : description,
  };
}