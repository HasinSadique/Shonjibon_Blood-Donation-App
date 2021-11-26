class Album {
  final String name, email, username;

  Album(
    this.name,
    this.email,
    this.username,
  );

  // factory Album.fromJson(Map<String, dynamic> json) {
  //   return Album(
  //     userId: json['userId'],
  //     id: json['id'],
  //     title: json['title'],
  //   );
  // }
}
