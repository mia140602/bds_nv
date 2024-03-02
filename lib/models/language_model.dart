class Language {
  String? id;
  String? name;
  String? code;
  String? image;
  Language({
    this.id,
    this.name,
    this.image,
    this.code,
  });
  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        code: json['code'],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "image": image, 'code': code};
}
