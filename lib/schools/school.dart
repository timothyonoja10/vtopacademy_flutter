
class School {
  final int schoolId;
  final String name;
  final int number;

  const School({
    required this.schoolId,
    required this.name,
    required this.number,
    
  });

  Map<String, Object?> toMap() {
    return {
      'schoolId': schoolId,
      'name': name,
      'number': number,
    };
  }

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      schoolId: map['schoolId'],
      name: map['name'],
      number: map['number'],
    );
  }

  factory School.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'schoolId': int schoolId,
        'name': String name,
        'number': int number,
      } =>
        School(
          schoolId: schoolId,
          name: name,
          number: number,
        ),
      _ => throw const FormatException('Failed to load school.'),
    };
  }

  @override
  String toString() {
    return 'School{schoolId: $schoolId, name: $name, number: $number}';
  }
}