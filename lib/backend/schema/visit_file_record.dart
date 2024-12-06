import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitFileRecord extends FirestoreRecord {
  VisitFileRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('VisitFile')
          : FirebaseFirestore.instance.collectionGroup('VisitFile');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('VisitFile').doc(id);

  static Stream<VisitFileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitFileRecord.fromSnapshot(s));

  static Future<VisitFileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitFileRecord.fromSnapshot(s));

  static VisitFileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitFileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitFileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitFileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitFileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitFileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitFileRecordData({
  DateTime? date,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitFileRecordDocumentEquality implements Equality<VisitFileRecord> {
  const VisitFileRecordDocumentEquality();

  @override
  bool equals(VisitFileRecord? e1, VisitFileRecord? e2) {
    return e1?.date == e2?.date && e1?.userId == e2?.userId;
  }

  @override
  int hash(VisitFileRecord? e) =>
      const ListEquality().hash([e?.date, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is VisitFileRecord;
}
