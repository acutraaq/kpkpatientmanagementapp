import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'doctors_record.g.dart';

abstract class DoctorsRecord
    implements Built<DoctorsRecord, DoctorsRecordBuilder> {
  static Serializer<DoctorsRecord> get serializer => _$doctorsRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'phone_num')
  String get phoneNum;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DoctorsRecordBuilder builder) => builder
    ..email = ''
    ..password = ''
    ..uid = ''
    ..phoneNum = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DoctorsRecord._();
  factory DoctorsRecord([void Function(DoctorsRecordBuilder) updates]) =
      _$DoctorsRecord;

  static DoctorsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDoctorsRecordData({
  String email,
  String password,
  String uid,
  String phoneNum,
}) =>
    serializers.toFirestore(
        DoctorsRecord.serializer,
        DoctorsRecord((d) => d
          ..email = email
          ..password = password
          ..uid = uid
          ..phoneNum = phoneNum));
