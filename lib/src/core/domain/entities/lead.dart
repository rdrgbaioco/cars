import 'package:isar/isar.dart';

part 'lead.g.dart';

@collection
class Lead {
  const Lead({
    required this.modeloId,
    required this.userEmail,
    required this.timestamp,
    this.id
  });

  final Id? id;
  final int modeloId;
  final String userEmail;
  final DateTime timestamp;

  Map<String, dynamic> toMap() {
    return {
      'modelo_id': modeloId,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }
}