
import 'dart:convert';

class MenuModal {
  final String name;
  final String assets;

  const MenuModal({required this.name, required this.assets});
  MenuModal copyWith({
    String? name,
    String? asset,
  }) {
    return MenuModal(
      name: name ?? this.name,
      assets: asset ?? this.assets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'asset': assets,
    };
  }

  factory MenuModal.fromMap(Map<String, dynamic> map) {
    return MenuModal(
      name: map['name'] ?? '',
      assets: map['asset'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModal.fromJson(String source) => MenuModal.fromMap(json.decode(source));

  @override
  String toString() => 'MenuModel(name: $name, asset: $assets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModal && other.name == name && other.assets == assets;
  }

  @override
  int get hashCode => name.hashCode ^ assets.hashCode;
}
