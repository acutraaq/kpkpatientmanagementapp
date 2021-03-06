import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: 'home_address')
  String get homeAddress;

  @nullable
  String get icNumber;

  @nullable
  String get age;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..password = ''
    ..uid = ''
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..firstName = ''
    ..lastName = ''
    ..homeAddress = ''
    ..icNumber = ''
    ..age = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String password,
  String uid,
  DateTime createdTime,
  String displayName,
  String photoUrl,
  String phoneNumber,
  String firstName,
  String lastName,
  String homeAddress,
  String icNumber,
  String age,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..password = password
          ..uid = uid
          ..createdTime = createdTime
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..phoneNumber = phoneNumber
          ..firstName = firstName
          ..lastName = lastName
          ..homeAddress = homeAddress
          ..icNumber = icNumber
          ..age = age));
