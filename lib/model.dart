import 'package:flutter/material.dart';

class Politics {
  int id;
  String name;

  Politics(this.id, this.name);
  static List<Politics> getCompanies() {
    return <Politics>[
      Politics(1, 'Admin'),
      Politics(2, 'User'),
    ];
  }
}
class Categorylist {
  int id;
  String name;

  Categorylist(this.id, this.name);
  static List<Categorylist> getCompanies() {
    return <Categorylist>[
      Categorylist(1, 'Novel'),
      Categorylist(2, 'biography'),
      Categorylist(2, 'motivation'),
    ];
  }
}
class Repo {
  final String author;
  final String name;
  final String avatar;

  final String url;
  final String description;
  final String language;
  final String languageColor;
  final int stars;
  final int forks;

  const Repo({
    @required this.author,
    @required this.name,
    @required this.url,
    this.avatar,
    this.description,
    this.language,
    this.languageColor,
    this.stars,
    this.forks,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      author: json['author'],
      name: json['name'],
      url: json['url'],
      avatar: json['avatar'],
      description: json['description'],
      language: json['language'],
      languageColor: json['languageColor'],
      stars: json['stars'],
      forks: json['forks'],
    );
  }
}