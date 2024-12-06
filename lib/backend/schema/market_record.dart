import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketRecord extends FirestoreRecord {
  MarketRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  bool hasAdresse() => _adresse != null;

  // "region" field.
  DocumentReference? _region;
  DocumentReference? get region => _region;
  bool hasRegion() => _region != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "products" field.
  List<DocumentReference>? _products;
  List<DocumentReference> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _adresse = snapshotData['adresse'] as String?;
    _region = snapshotData['region'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
    _products = getDataList(snapshotData['products']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('market');

  static Stream<MarketRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarketRecord.fromSnapshot(s));

  static Future<MarketRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarketRecord.fromSnapshot(s));

  static MarketRecord fromSnapshot(DocumentSnapshot snapshot) => MarketRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarketRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarketRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarketRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarketRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarketRecordData({
  String? name,
  String? adresse,
  DocumentReference? region,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'adresse': adresse,
      'region': region,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarketRecordDocumentEquality implements Equality<MarketRecord> {
  const MarketRecordDocumentEquality();

  @override
  bool equals(MarketRecord? e1, MarketRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.adresse == e2?.adresse &&
        e1?.region == e2?.region &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.products, e2?.products);
  }

  @override
  int hash(MarketRecord? e) => const ListEquality()
      .hash([e?.name, e?.adresse, e?.region, e?.location, e?.products]);

  @override
  bool isValidKey(Object? o) => o is MarketRecord;
}
