import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeetingRecord extends FirestoreRecord {
  MeetingRecord._(
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

  // "market" field.
  DocumentReference? _market;
  DocumentReference? get market => _market;
  bool hasMarket() => _market != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _market = snapshotData['market'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Meeting');

  static Stream<MeetingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeetingRecord.fromSnapshot(s));

  static Future<MeetingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeetingRecord.fromSnapshot(s));

  static MeetingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeetingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeetingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeetingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeetingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeetingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeetingRecordData({
  DateTime? date,
  DocumentReference? userId,
  DocumentReference? market,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'user_id': userId,
      'market': market,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeetingRecordDocumentEquality implements Equality<MeetingRecord> {
  const MeetingRecordDocumentEquality();

  @override
  bool equals(MeetingRecord? e1, MeetingRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.userId == e2?.userId &&
        e1?.market == e2?.market &&
        e1?.status == e2?.status;
  }

  @override
  int hash(MeetingRecord? e) =>
      const ListEquality().hash([e?.date, e?.userId, e?.market, e?.status]);

  @override
  bool isValidKey(Object? o) => o is MeetingRecord;
}
