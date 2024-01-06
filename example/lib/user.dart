@jsonGenerate
class User {
  String name;
  int age;
  String job;
}
// class User {
//   String name;
//   int age;
//   String job;
//   User({
//     required this.name,
//     required this.age,
//     required this.job,
//   });
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'age': age,
//       'job': job,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       name: map['name'],
//       age: map['age'],
//       job: map['job'],
//     );
//   }
// }
