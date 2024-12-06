import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegionRecord extends FirestoreRecord {
  RegionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('region');

  static Stream<RegionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegionRecord.fromSnapshot(s));

  static Future<RegionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegionRecord.fromSnapshot(s));

  static RegionRecord fromSnapshot(DocumentSnapshot snapshot) => RegionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegionRecordData({
  String? name,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegionRecordDocumentEquality implements Equality<RegionRecord> {
  const RegionRecordDocumentEquality();

  @override
  bool equals(RegionRecord? e1, RegionRecord? e2) {
    return e1?.name == e2?.name && e1?.location == e2?.location;
  }

  @override
  int hash(RegionRecord? e) =>
      const ListEquality().hash([e?.name, e?.location]);

  @override
  bool isValidKey(Object? o) => o is RegionRecord;
}
