import 'dart:convert';

class Cliente {
  Cliente({
    required this.nombre,
    required this.correo,
    required this.direccion,
    required this.telefono,
  });

  String nombre;
  String correo;
  String direccion;
  String telefono;

  factory Cliente.fromJson(String str) => Cliente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
        nombre: json['nombre'],
        correo: json['correo'],
        direccion: json['direccion'],
        telefono: json['telefono'],
      );

  Map<String, dynamic> toMap() => {
        'nombre': nombre,
        'correo': correo,
        'direccion': direccion,
        'telefono': telefono,
      };

  Cliente copyWith({
    String? id,
    String? nombre,
    String? correo,
    String? direccion,
    String? telefono,
  }) {
    return Cliente(
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
      direccion: direccion ?? this.direccion,
      telefono: telefono ?? this.telefono,
    );
  }
}
