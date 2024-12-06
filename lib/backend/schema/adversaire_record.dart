import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdversaireRecord extends FirestoreRecord {
  AdversaireRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "produit" field.
  List<DocumentReference>? _produit;
  List<DocumentReference> get produit => _produit ?? const [];
  bool hasProduit() => _produit != null;

  // "regions" field.
  List<DocumentReference>? _regions;
  List<DocumentReference> get regions => _regions ?? const [];
  bool hasRegions() => _regions != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _produit = getDataList(snapshotData['produit']);
    _regions = getDataList(snapshotData['regions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adversaire');

  static Stream<AdversaireRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdversaireRecord.fromSnapshot(s));

  static Future<AdversaireRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdversaireRecord.fromSnapshot(s));

  static AdversaireRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdversaireRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdversaireRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdversaireRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdversaireRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdversaireRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdversaireRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdversaireRecordDocumentEquality implements Equality<AdversaireRecord> {
  const AdversaireRecordDocumentEquality();

  @override
  bool equals(AdversaireRecord? e1, AdversaireRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.produit, e2?.produit) &&
        listEquality.equals(e1?.regions, e2?.regions);
  }

  @override
  int hash(AdversaireRecord? e) =>
      const ListEquality().hash([e?.name, e?.produit, e?.regions]);

  @override
  bool isValidKey(Object? o) => o is AdversaireRecord;
}
