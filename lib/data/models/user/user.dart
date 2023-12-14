import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final Avatar avatar;
  final int id;
  final String name;
  final String username;

  const User({
    required this.avatar,
    required this.id,
    required this.name,
    required this.username,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: Avatar.fromJson(json["avatar"]),
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar.toJson(),
        "id": id,
        "name": name,
        "username": username,
      };

  factory User.initial() {
    return const User(
        avatar: Avatar(
          gravatar: Gravatar(hash: ''),
          tmdb: Tmdb(avatarPath: ''),
        ),
        id: 0,
        name: '',
        username: '');
  }

  @override
  List<Object> get props => [avatar, id, name, username];
}

class Avatar extends Equatable {
  final Gravatar gravatar;
  final Tmdb tmdb;

  const Avatar({
    required this.gravatar,
    required this.tmdb,
  });

  factory Avatar.fromRawJson(String str) => Avatar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        gravatar: Gravatar.fromJson(json["gravatar"]),
        tmdb: Tmdb.fromJson(json["tmdb"]),
      );

  Map<String, dynamic> toJson() => {
        "gravatar": gravatar.toJson(),
        "tmdb": tmdb.toJson(),
      };

  @override
  List<Object> get props => [gravatar, tmdb];
}

class Gravatar extends Equatable {
  final String hash;

  const Gravatar({
    required this.hash,
  });

  factory Gravatar.fromRawJson(String str) =>
      Gravatar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
      };

  @override
  List<Object> get props => [hash];
}

class Tmdb extends Equatable {
  final String avatarPath;

  const Tmdb({
    required this.avatarPath,
  });

  factory Tmdb.fromRawJson(String str) => Tmdb.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
        avatarPath: json["avatar_path"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_path": avatarPath,
      };

  @override
  List<Object> get props => [avatarPath];
}
