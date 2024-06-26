class Source {
  Source({
    required this.id,
    required this.name,
  });
  late final String? id;
  late final String name;

  Source.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}