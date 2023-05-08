// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Size {
  final String size;
  final bool isSelected;

  Size({required this.size,
  required this.isSelected});

  Size copyWith({
    String? size,
    bool? isSelected,
  }) {
    return Size(
      size: size ?? this.size,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'size': size,
      'isSelected': isSelected,
    };
  }

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      size: map['size'] as String,
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Size.fromJson(String source) => Size.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Size(size: $size, isSelected: $isSelected)';

}
