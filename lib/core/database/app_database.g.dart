// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients
    with TableInfo<$PatientsTable, PatientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hospitalIdMeta = const VerificationMeta(
    'hospitalId',
  );
  @override
  late final GeneratedColumn<String> hospitalId = GeneratedColumn<String>(
    'hospital_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bloodGroupMeta = const VerificationMeta(
    'bloodGroup',
  );
  @override
  late final GeneratedColumn<String> bloodGroup = GeneratedColumn<String>(
    'blood_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _comorbiditiesMeta = const VerificationMeta(
    'comorbidities',
  );
  @override
  late final GeneratedColumn<String> comorbidities = GeneratedColumn<String>(
    'comorbidities',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _admissionDateMeta = const VerificationMeta(
    'admissionDate',
  );
  @override
  late final GeneratedColumn<DateTime> admissionDate =
      GeneratedColumn<DateTime>(
        'admission_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ejectionFractionMeta = const VerificationMeta(
    'ejectionFraction',
  );
  @override
  late final GeneratedColumn<double> ejectionFraction = GeneratedColumn<double>(
    'ejection_fraction',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pastOperativeHistoryMeta =
      const VerificationMeta('pastOperativeHistory');
  @override
  late final GeneratedColumn<String> pastOperativeHistory =
      GeneratedColumn<String>(
        'past_operative_history',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    name,
    hospitalId,
    dateOfBirth,
    bloodGroup,
    comorbidities,
    address,
    admissionDate,
    ejectionFraction,
    pastOperativeHistory,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(
    Insertable<PatientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('hospital_id')) {
      context.handle(
        _hospitalIdMeta,
        hospitalId.isAcceptableOrUnknown(data['hospital_id']!, _hospitalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_hospitalIdMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('blood_group')) {
      context.handle(
        _bloodGroupMeta,
        bloodGroup.isAcceptableOrUnknown(data['blood_group']!, _bloodGroupMeta),
      );
    }
    if (data.containsKey('comorbidities')) {
      context.handle(
        _comorbiditiesMeta,
        comorbidities.isAcceptableOrUnknown(
          data['comorbidities']!,
          _comorbiditiesMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('admission_date')) {
      context.handle(
        _admissionDateMeta,
        admissionDate.isAcceptableOrUnknown(
          data['admission_date']!,
          _admissionDateMeta,
        ),
      );
    }
    if (data.containsKey('ejection_fraction')) {
      context.handle(
        _ejectionFractionMeta,
        ejectionFraction.isAcceptableOrUnknown(
          data['ejection_fraction']!,
          _ejectionFractionMeta,
        ),
      );
    }
    if (data.containsKey('past_operative_history')) {
      context.handle(
        _pastOperativeHistoryMeta,
        pastOperativeHistory.isAcceptableOrUnknown(
          data['past_operative_history']!,
          _pastOperativeHistoryMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}patient_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      hospitalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hospital_id'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      )!,
      bloodGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blood_group'],
      ),
      comorbidities: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comorbidities'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      admissionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}admission_date'],
      ),
      ejectionFraction: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ejection_fraction'],
      ),
      pastOperativeHistory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}past_operative_history'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class PatientData extends DataClass implements Insertable<PatientData> {
  final int id;
  final String patientId;
  final String name;
  final String hospitalId;
  final DateTime dateOfBirth;
  final String? bloodGroup;
  final String? comorbidities;
  final String? address;
  final DateTime? admissionDate;
  final double? ejectionFraction;
  final String? pastOperativeHistory;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PatientData({
    required this.id,
    required this.patientId,
    required this.name,
    required this.hospitalId,
    required this.dateOfBirth,
    this.bloodGroup,
    this.comorbidities,
    this.address,
    this.admissionDate,
    this.ejectionFraction,
    this.pastOperativeHistory,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['name'] = Variable<String>(name);
    map['hospital_id'] = Variable<String>(hospitalId);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    if (!nullToAbsent || bloodGroup != null) {
      map['blood_group'] = Variable<String>(bloodGroup);
    }
    if (!nullToAbsent || comorbidities != null) {
      map['comorbidities'] = Variable<String>(comorbidities);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || admissionDate != null) {
      map['admission_date'] = Variable<DateTime>(admissionDate);
    }
    if (!nullToAbsent || ejectionFraction != null) {
      map['ejection_fraction'] = Variable<double>(ejectionFraction);
    }
    if (!nullToAbsent || pastOperativeHistory != null) {
      map['past_operative_history'] = Variable<String>(pastOperativeHistory);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      name: Value(name),
      hospitalId: Value(hospitalId),
      dateOfBirth: Value(dateOfBirth),
      bloodGroup: bloodGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGroup),
      comorbidities: comorbidities == null && nullToAbsent
          ? const Value.absent()
          : Value(comorbidities),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      admissionDate: admissionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionDate),
      ejectionFraction: ejectionFraction == null && nullToAbsent
          ? const Value.absent()
          : Value(ejectionFraction),
      pastOperativeHistory: pastOperativeHistory == null && nullToAbsent
          ? const Value.absent()
          : Value(pastOperativeHistory),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PatientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      name: serializer.fromJson<String>(json['name']),
      hospitalId: serializer.fromJson<String>(json['hospitalId']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      bloodGroup: serializer.fromJson<String?>(json['bloodGroup']),
      comorbidities: serializer.fromJson<String?>(json['comorbidities']),
      address: serializer.fromJson<String?>(json['address']),
      admissionDate: serializer.fromJson<DateTime?>(json['admissionDate']),
      ejectionFraction: serializer.fromJson<double?>(json['ejectionFraction']),
      pastOperativeHistory: serializer.fromJson<String?>(
        json['pastOperativeHistory'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<String>(patientId),
      'name': serializer.toJson<String>(name),
      'hospitalId': serializer.toJson<String>(hospitalId),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'bloodGroup': serializer.toJson<String?>(bloodGroup),
      'comorbidities': serializer.toJson<String?>(comorbidities),
      'address': serializer.toJson<String?>(address),
      'admissionDate': serializer.toJson<DateTime?>(admissionDate),
      'ejectionFraction': serializer.toJson<double?>(ejectionFraction),
      'pastOperativeHistory': serializer.toJson<String?>(pastOperativeHistory),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PatientData copyWith({
    int? id,
    String? patientId,
    String? name,
    String? hospitalId,
    DateTime? dateOfBirth,
    Value<String?> bloodGroup = const Value.absent(),
    Value<String?> comorbidities = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<DateTime?> admissionDate = const Value.absent(),
    Value<double?> ejectionFraction = const Value.absent(),
    Value<String?> pastOperativeHistory = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PatientData(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    name: name ?? this.name,
    hospitalId: hospitalId ?? this.hospitalId,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    bloodGroup: bloodGroup.present ? bloodGroup.value : this.bloodGroup,
    comorbidities: comorbidities.present
        ? comorbidities.value
        : this.comorbidities,
    address: address.present ? address.value : this.address,
    admissionDate: admissionDate.present
        ? admissionDate.value
        : this.admissionDate,
    ejectionFraction: ejectionFraction.present
        ? ejectionFraction.value
        : this.ejectionFraction,
    pastOperativeHistory: pastOperativeHistory.present
        ? pastOperativeHistory.value
        : this.pastOperativeHistory,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PatientData copyWithCompanion(PatientsCompanion data) {
    return PatientData(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      name: data.name.present ? data.name.value : this.name,
      hospitalId: data.hospitalId.present
          ? data.hospitalId.value
          : this.hospitalId,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      bloodGroup: data.bloodGroup.present
          ? data.bloodGroup.value
          : this.bloodGroup,
      comorbidities: data.comorbidities.present
          ? data.comorbidities.value
          : this.comorbidities,
      address: data.address.present ? data.address.value : this.address,
      admissionDate: data.admissionDate.present
          ? data.admissionDate.value
          : this.admissionDate,
      ejectionFraction: data.ejectionFraction.present
          ? data.ejectionFraction.value
          : this.ejectionFraction,
      pastOperativeHistory: data.pastOperativeHistory.present
          ? data.pastOperativeHistory.value
          : this.pastOperativeHistory,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('name: $name, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('bloodGroup: $bloodGroup, ')
          ..write('comorbidities: $comorbidities, ')
          ..write('address: $address, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('ejectionFraction: $ejectionFraction, ')
          ..write('pastOperativeHistory: $pastOperativeHistory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    patientId,
    name,
    hospitalId,
    dateOfBirth,
    bloodGroup,
    comorbidities,
    address,
    admissionDate,
    ejectionFraction,
    pastOperativeHistory,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.name == this.name &&
          other.hospitalId == this.hospitalId &&
          other.dateOfBirth == this.dateOfBirth &&
          other.bloodGroup == this.bloodGroup &&
          other.comorbidities == this.comorbidities &&
          other.address == this.address &&
          other.admissionDate == this.admissionDate &&
          other.ejectionFraction == this.ejectionFraction &&
          other.pastOperativeHistory == this.pastOperativeHistory &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PatientsCompanion extends UpdateCompanion<PatientData> {
  final Value<int> id;
  final Value<String> patientId;
  final Value<String> name;
  final Value<String> hospitalId;
  final Value<DateTime> dateOfBirth;
  final Value<String?> bloodGroup;
  final Value<String?> comorbidities;
  final Value<String?> address;
  final Value<DateTime?> admissionDate;
  final Value<double?> ejectionFraction;
  final Value<String?> pastOperativeHistory;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.name = const Value.absent(),
    this.hospitalId = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.bloodGroup = const Value.absent(),
    this.comorbidities = const Value.absent(),
    this.address = const Value.absent(),
    this.admissionDate = const Value.absent(),
    this.ejectionFraction = const Value.absent(),
    this.pastOperativeHistory = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.id = const Value.absent(),
    required String patientId,
    required String name,
    required String hospitalId,
    required DateTime dateOfBirth,
    this.bloodGroup = const Value.absent(),
    this.comorbidities = const Value.absent(),
    this.address = const Value.absent(),
    this.admissionDate = const Value.absent(),
    this.ejectionFraction = const Value.absent(),
    this.pastOperativeHistory = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : patientId = Value(patientId),
       name = Value(name),
       hospitalId = Value(hospitalId),
       dateOfBirth = Value(dateOfBirth),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PatientData> custom({
    Expression<int>? id,
    Expression<String>? patientId,
    Expression<String>? name,
    Expression<String>? hospitalId,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? bloodGroup,
    Expression<String>? comorbidities,
    Expression<String>? address,
    Expression<DateTime>? admissionDate,
    Expression<double>? ejectionFraction,
    Expression<String>? pastOperativeHistory,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (name != null) 'name': name,
      if (hospitalId != null) 'hospital_id': hospitalId,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (bloodGroup != null) 'blood_group': bloodGroup,
      if (comorbidities != null) 'comorbidities': comorbidities,
      if (address != null) 'address': address,
      if (admissionDate != null) 'admission_date': admissionDate,
      if (ejectionFraction != null) 'ejection_fraction': ejectionFraction,
      if (pastOperativeHistory != null)
        'past_operative_history': pastOperativeHistory,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PatientsCompanion copyWith({
    Value<int>? id,
    Value<String>? patientId,
    Value<String>? name,
    Value<String>? hospitalId,
    Value<DateTime>? dateOfBirth,
    Value<String?>? bloodGroup,
    Value<String?>? comorbidities,
    Value<String?>? address,
    Value<DateTime?>? admissionDate,
    Value<double?>? ejectionFraction,
    Value<String?>? pastOperativeHistory,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PatientsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      name: name ?? this.name,
      hospitalId: hospitalId ?? this.hospitalId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      comorbidities: comorbidities ?? this.comorbidities,
      address: address ?? this.address,
      admissionDate: admissionDate ?? this.admissionDate,
      ejectionFraction: ejectionFraction ?? this.ejectionFraction,
      pastOperativeHistory: pastOperativeHistory ?? this.pastOperativeHistory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hospitalId.present) {
      map['hospital_id'] = Variable<String>(hospitalId.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (bloodGroup.present) {
      map['blood_group'] = Variable<String>(bloodGroup.value);
    }
    if (comorbidities.present) {
      map['comorbidities'] = Variable<String>(comorbidities.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (admissionDate.present) {
      map['admission_date'] = Variable<DateTime>(admissionDate.value);
    }
    if (ejectionFraction.present) {
      map['ejection_fraction'] = Variable<double>(ejectionFraction.value);
    }
    if (pastOperativeHistory.present) {
      map['past_operative_history'] = Variable<String>(
        pastOperativeHistory.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('name: $name, ')
          ..write('hospitalId: $hospitalId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('bloodGroup: $bloodGroup, ')
          ..write('comorbidities: $comorbidities, ')
          ..write('address: $address, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('ejectionFraction: $ejectionFraction, ')
          ..write('pastOperativeHistory: $pastOperativeHistory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PatientAttachmentsTable extends PatientAttachments
    with TableInfo<$PatientAttachmentsTable, PatientAttachmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    displayName,
    filePath,
    fileType,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patient_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<PatientAttachmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientAttachmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientAttachmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PatientAttachmentsTable createAlias(String alias) {
    return $PatientAttachmentsTable(attachedDatabase, alias);
  }
}

class PatientAttachmentData extends DataClass
    implements Insertable<PatientAttachmentData> {
  final int id;
  final int patientId;
  final String displayName;
  final String filePath;
  final String fileType;
  final DateTime createdAt;
  const PatientAttachmentData({
    required this.id,
    required this.patientId,
    required this.displayName,
    required this.filePath,
    required this.fileType,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    map['display_name'] = Variable<String>(displayName);
    map['file_path'] = Variable<String>(filePath);
    map['file_type'] = Variable<String>(fileType);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PatientAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return PatientAttachmentsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      displayName: Value(displayName),
      filePath: Value(filePath),
      fileType: Value(fileType),
      createdAt: Value(createdAt),
    );
  }

  factory PatientAttachmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientAttachmentData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      displayName: serializer.fromJson<String>(json['displayName']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileType: serializer.fromJson<String>(json['fileType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'displayName': serializer.toJson<String>(displayName),
      'filePath': serializer.toJson<String>(filePath),
      'fileType': serializer.toJson<String>(fileType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PatientAttachmentData copyWith({
    int? id,
    int? patientId,
    String? displayName,
    String? filePath,
    String? fileType,
    DateTime? createdAt,
  }) => PatientAttachmentData(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    displayName: displayName ?? this.displayName,
    filePath: filePath ?? this.filePath,
    fileType: fileType ?? this.fileType,
    createdAt: createdAt ?? this.createdAt,
  );
  PatientAttachmentData copyWithCompanion(PatientAttachmentsCompanion data) {
    return PatientAttachmentData(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientAttachmentData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('displayName: $displayName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, patientId, displayName, filePath, fileType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientAttachmentData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.displayName == this.displayName &&
          other.filePath == this.filePath &&
          other.fileType == this.fileType &&
          other.createdAt == this.createdAt);
}

class PatientAttachmentsCompanion
    extends UpdateCompanion<PatientAttachmentData> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<String> displayName;
  final Value<String> filePath;
  final Value<String> fileType;
  final Value<DateTime> createdAt;
  const PatientAttachmentsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.displayName = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PatientAttachmentsCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    required String displayName,
    required String filePath,
    required String fileType,
    required DateTime createdAt,
  }) : patientId = Value(patientId),
       displayName = Value(displayName),
       filePath = Value(filePath),
       fileType = Value(fileType),
       createdAt = Value(createdAt);
  static Insertable<PatientAttachmentData> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<String>? displayName,
    Expression<String>? filePath,
    Expression<String>? fileType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (displayName != null) 'display_name': displayName,
      if (filePath != null) 'file_path': filePath,
      if (fileType != null) 'file_type': fileType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PatientAttachmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? patientId,
    Value<String>? displayName,
    Value<String>? filePath,
    Value<String>? fileType,
    Value<DateTime>? createdAt,
  }) {
    return PatientAttachmentsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      displayName: displayName ?? this.displayName,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientAttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('displayName: $displayName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PatientTagsTable extends PatientTags
    with TableInfo<$PatientTagsTable, PatientTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, patientId, tag, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patient_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<PatientTagData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientTagData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PatientTagsTable createAlias(String alias) {
    return $PatientTagsTable(attachedDatabase, alias);
  }
}

class PatientTagData extends DataClass implements Insertable<PatientTagData> {
  final int id;
  final int patientId;
  final String tag;
  final DateTime createdAt;
  const PatientTagData({
    required this.id,
    required this.patientId,
    required this.tag,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    map['tag'] = Variable<String>(tag);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PatientTagsCompanion toCompanion(bool nullToAbsent) {
    return PatientTagsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      tag: Value(tag),
      createdAt: Value(createdAt),
    );
  }

  factory PatientTagData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientTagData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      tag: serializer.fromJson<String>(json['tag']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'tag': serializer.toJson<String>(tag),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PatientTagData copyWith({
    int? id,
    int? patientId,
    String? tag,
    DateTime? createdAt,
  }) => PatientTagData(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    tag: tag ?? this.tag,
    createdAt: createdAt ?? this.createdAt,
  );
  PatientTagData copyWithCompanion(PatientTagsCompanion data) {
    return PatientTagData(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      tag: data.tag.present ? data.tag.value : this.tag,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientTagData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('tag: $tag, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patientId, tag, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientTagData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.tag == this.tag &&
          other.createdAt == this.createdAt);
}

class PatientTagsCompanion extends UpdateCompanion<PatientTagData> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<String> tag;
  final Value<DateTime> createdAt;
  const PatientTagsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.tag = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PatientTagsCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    required String tag,
    required DateTime createdAt,
  }) : patientId = Value(patientId),
       tag = Value(tag),
       createdAt = Value(createdAt);
  static Insertable<PatientTagData> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<String>? tag,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (tag != null) 'tag': tag,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PatientTagsCompanion copyWith({
    Value<int>? id,
    Value<int>? patientId,
    Value<String>? tag,
    Value<DateTime>? createdAt,
  }) {
    return PatientTagsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      tag: tag ?? this.tag,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientTagsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('tag: $tag, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProceduresTable extends Procedures
    with TableInfo<$ProceduresTable, ProcedureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProceduresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _procedureIdMeta = const VerificationMeta(
    'procedureId',
  );
  @override
  late final GeneratedColumn<String> procedureId = GeneratedColumn<String>(
    'procedure_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialtyMeta = const VerificationMeta(
    'specialty',
  );
  @override
  late final GeneratedColumn<String> specialty = GeneratedColumn<String>(
    'specialty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("Cardiothoracic Surgery"),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aliasesMeta = const VerificationMeta(
    'aliases',
  );
  @override
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
    'aliases',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    procedureId,
    name,
    category,
    specialty,
    parentId,
    aliases,
    description,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procedures';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProcedureData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('procedure_id')) {
      context.handle(
        _procedureIdMeta,
        procedureId.isAcceptableOrUnknown(
          data['procedure_id']!,
          _procedureIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_procedureIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('specialty')) {
      context.handle(
        _specialtyMeta,
        specialty.isAcceptableOrUnknown(data['specialty']!, _specialtyMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('aliases')) {
      context.handle(
        _aliasesMeta,
        aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProcedureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcedureData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      procedureId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}procedure_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      specialty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specialty'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
      aliases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aliases'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProceduresTable createAlias(String alias) {
    return $ProceduresTable(attachedDatabase, alias);
  }
}

class ProcedureData extends DataClass implements Insertable<ProcedureData> {
  final int id;
  final String procedureId;
  final String name;
  final String category;
  final String specialty;
  final int? parentId;
  final String? aliases;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  const ProcedureData({
    required this.id,
    required this.procedureId,
    required this.name,
    required this.category,
    required this.specialty,
    this.parentId,
    this.aliases,
    this.description,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['procedure_id'] = Variable<String>(procedureId);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['specialty'] = Variable<String>(specialty);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    if (!nullToAbsent || aliases != null) {
      map['aliases'] = Variable<String>(aliases);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProceduresCompanion toCompanion(bool nullToAbsent) {
    return ProceduresCompanion(
      id: Value(id),
      procedureId: Value(procedureId),
      name: Value(name),
      category: Value(category),
      specialty: Value(specialty),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      aliases: aliases == null && nullToAbsent
          ? const Value.absent()
          : Value(aliases),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory ProcedureData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProcedureData(
      id: serializer.fromJson<int>(json['id']),
      procedureId: serializer.fromJson<String>(json['procedureId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      specialty: serializer.fromJson<String>(json['specialty']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      aliases: serializer.fromJson<String?>(json['aliases']),
      description: serializer.fromJson<String?>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'procedureId': serializer.toJson<String>(procedureId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'specialty': serializer.toJson<String>(specialty),
      'parentId': serializer.toJson<int?>(parentId),
      'aliases': serializer.toJson<String?>(aliases),
      'description': serializer.toJson<String?>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProcedureData copyWith({
    int? id,
    String? procedureId,
    String? name,
    String? category,
    String? specialty,
    Value<int?> parentId = const Value.absent(),
    Value<String?> aliases = const Value.absent(),
    Value<String?> description = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
  }) => ProcedureData(
    id: id ?? this.id,
    procedureId: procedureId ?? this.procedureId,
    name: name ?? this.name,
    category: category ?? this.category,
    specialty: specialty ?? this.specialty,
    parentId: parentId.present ? parentId.value : this.parentId,
    aliases: aliases.present ? aliases.value : this.aliases,
    description: description.present ? description.value : this.description,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  ProcedureData copyWithCompanion(ProceduresCompanion data) {
    return ProcedureData(
      id: data.id.present ? data.id.value : this.id,
      procedureId: data.procedureId.present
          ? data.procedureId.value
          : this.procedureId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      specialty: data.specialty.present ? data.specialty.value : this.specialty,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      description: data.description.present
          ? data.description.value
          : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureData(')
          ..write('id: $id, ')
          ..write('procedureId: $procedureId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('specialty: $specialty, ')
          ..write('parentId: $parentId, ')
          ..write('aliases: $aliases, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    procedureId,
    name,
    category,
    specialty,
    parentId,
    aliases,
    description,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcedureData &&
          other.id == this.id &&
          other.procedureId == this.procedureId &&
          other.name == this.name &&
          other.category == this.category &&
          other.specialty == this.specialty &&
          other.parentId == this.parentId &&
          other.aliases == this.aliases &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class ProceduresCompanion extends UpdateCompanion<ProcedureData> {
  final Value<int> id;
  final Value<String> procedureId;
  final Value<String> name;
  final Value<String> category;
  final Value<String> specialty;
  final Value<int?> parentId;
  final Value<String?> aliases;
  final Value<String?> description;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const ProceduresCompanion({
    this.id = const Value.absent(),
    this.procedureId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.specialty = const Value.absent(),
    this.parentId = const Value.absent(),
    this.aliases = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProceduresCompanion.insert({
    this.id = const Value.absent(),
    required String procedureId,
    required String name,
    required String category,
    this.specialty = const Value.absent(),
    this.parentId = const Value.absent(),
    this.aliases = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : procedureId = Value(procedureId),
       name = Value(name),
       category = Value(category);
  static Insertable<ProcedureData> custom({
    Expression<int>? id,
    Expression<String>? procedureId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? specialty,
    Expression<int>? parentId,
    Expression<String>? aliases,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (procedureId != null) 'procedure_id': procedureId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (specialty != null) 'specialty': specialty,
      if (parentId != null) 'parent_id': parentId,
      if (aliases != null) 'aliases': aliases,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProceduresCompanion copyWith({
    Value<int>? id,
    Value<String>? procedureId,
    Value<String>? name,
    Value<String>? category,
    Value<String>? specialty,
    Value<int?>? parentId,
    Value<String?>? aliases,
    Value<String?>? description,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return ProceduresCompanion(
      id: id ?? this.id,
      procedureId: procedureId ?? this.procedureId,
      name: name ?? this.name,
      category: category ?? this.category,
      specialty: specialty ?? this.specialty,
      parentId: parentId ?? this.parentId,
      aliases: aliases ?? this.aliases,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (procedureId.present) {
      map['procedure_id'] = Variable<String>(procedureId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (specialty.present) {
      map['specialty'] = Variable<String>(specialty.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProceduresCompanion(')
          ..write('id: $id, ')
          ..write('procedureId: $procedureId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('specialty: $specialty, ')
          ..write('parentId: $parentId, ')
          ..write('aliases: $aliases, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SurgicalCasesTable extends SurgicalCases
    with TableInfo<$SurgicalCasesTable, SurgicalCase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurgicalCasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surgeryDateMeta = const VerificationMeta(
    'surgeryDate',
  );
  @override
  late final GeneratedColumn<DateTime> surgeryDate = GeneratedColumn<DateTime>(
    'surgery_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diagnosisMeta = const VerificationMeta(
    'diagnosis',
  );
  @override
  late final GeneratedColumn<String> diagnosis = GeneratedColumn<String>(
    'diagnosis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urgencyMeta = const VerificationMeta(
    'urgency',
  );
  @override
  late final GeneratedColumn<String> urgency = GeneratedColumn<String>(
    'urgency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surgeryTypeMeta = const VerificationMeta(
    'surgeryType',
  );
  @override
  late final GeneratedColumn<String> surgeryType = GeneratedColumn<String>(
    'surgery_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialtyMeta = const VerificationMeta(
    'specialty',
  );
  @override
  late final GeneratedColumn<String> specialty = GeneratedColumn<String>(
    'specialty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surgicalApproachMeta = const VerificationMeta(
    'surgicalApproach',
  );
  @override
  late final GeneratedColumn<String> surgicalApproach = GeneratedColumn<String>(
    'surgical_approach',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operativeRoleMeta = const VerificationMeta(
    'operativeRole',
  );
  @override
  late final GeneratedColumn<String> operativeRole = GeneratedColumn<String>(
    'operative_role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _technicalStepsMeta = const VerificationMeta(
    'technicalSteps',
  );
  @override
  late final GeneratedColumn<String> technicalSteps = GeneratedColumn<String>(
    'technical_steps',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cardiopulmonaryBypassUsedMeta =
      const VerificationMeta('cardiopulmonaryBypassUsed');
  @override
  late final GeneratedColumn<bool> cardiopulmonaryBypassUsed =
      GeneratedColumn<bool>(
        'cardiopulmonary_bypass_used',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("cardiopulmonary_bypass_used" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _bypassTimeMinutesMeta = const VerificationMeta(
    'bypassTimeMinutes',
  );
  @override
  late final GeneratedColumn<int> bypassTimeMinutes = GeneratedColumn<int>(
    'bypass_time_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _crossClampTimeMinutesMeta =
      const VerificationMeta('crossClampTimeMinutes');
  @override
  late final GeneratedColumn<int> crossClampTimeMinutes = GeneratedColumn<int>(
    'cross_clamp_time_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _graftConduitImplantMeta =
      const VerificationMeta('graftConduitImplant');
  @override
  late final GeneratedColumn<String> graftConduitImplant =
      GeneratedColumn<String>(
        'graft_conduit_implant',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _outcomeMeta = const VerificationMeta(
    'outcome',
  );
  @override
  late final GeneratedColumn<String> outcome = GeneratedColumn<String>(
    'outcome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _complicationsMeta = const VerificationMeta(
    'complications',
  );
  @override
  late final GeneratedColumn<String> complications = GeneratedColumn<String>(
    'complications',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    caseId,
    patientId,
    surgeryDate,
    diagnosis,
    urgency,
    surgeryType,
    specialty,
    surgicalApproach,
    operativeRole,
    technicalSteps,
    cardiopulmonaryBypassUsed,
    bypassTimeMinutes,
    crossClampTimeMinutes,
    graftConduitImplant,
    outcome,
    complications,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surgical_cases';
  @override
  VerificationContext validateIntegrity(
    Insertable<SurgicalCase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('surgery_date')) {
      context.handle(
        _surgeryDateMeta,
        surgeryDate.isAcceptableOrUnknown(
          data['surgery_date']!,
          _surgeryDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surgeryDateMeta);
    }
    if (data.containsKey('diagnosis')) {
      context.handle(
        _diagnosisMeta,
        diagnosis.isAcceptableOrUnknown(data['diagnosis']!, _diagnosisMeta),
      );
    } else if (isInserting) {
      context.missing(_diagnosisMeta);
    }
    if (data.containsKey('urgency')) {
      context.handle(
        _urgencyMeta,
        urgency.isAcceptableOrUnknown(data['urgency']!, _urgencyMeta),
      );
    } else if (isInserting) {
      context.missing(_urgencyMeta);
    }
    if (data.containsKey('surgery_type')) {
      context.handle(
        _surgeryTypeMeta,
        surgeryType.isAcceptableOrUnknown(
          data['surgery_type']!,
          _surgeryTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surgeryTypeMeta);
    }
    if (data.containsKey('specialty')) {
      context.handle(
        _specialtyMeta,
        specialty.isAcceptableOrUnknown(data['specialty']!, _specialtyMeta),
      );
    } else if (isInserting) {
      context.missing(_specialtyMeta);
    }
    if (data.containsKey('surgical_approach')) {
      context.handle(
        _surgicalApproachMeta,
        surgicalApproach.isAcceptableOrUnknown(
          data['surgical_approach']!,
          _surgicalApproachMeta,
        ),
      );
    }
    if (data.containsKey('operative_role')) {
      context.handle(
        _operativeRoleMeta,
        operativeRole.isAcceptableOrUnknown(
          data['operative_role']!,
          _operativeRoleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operativeRoleMeta);
    }
    if (data.containsKey('technical_steps')) {
      context.handle(
        _technicalStepsMeta,
        technicalSteps.isAcceptableOrUnknown(
          data['technical_steps']!,
          _technicalStepsMeta,
        ),
      );
    }
    if (data.containsKey('cardiopulmonary_bypass_used')) {
      context.handle(
        _cardiopulmonaryBypassUsedMeta,
        cardiopulmonaryBypassUsed.isAcceptableOrUnknown(
          data['cardiopulmonary_bypass_used']!,
          _cardiopulmonaryBypassUsedMeta,
        ),
      );
    }
    if (data.containsKey('bypass_time_minutes')) {
      context.handle(
        _bypassTimeMinutesMeta,
        bypassTimeMinutes.isAcceptableOrUnknown(
          data['bypass_time_minutes']!,
          _bypassTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('cross_clamp_time_minutes')) {
      context.handle(
        _crossClampTimeMinutesMeta,
        crossClampTimeMinutes.isAcceptableOrUnknown(
          data['cross_clamp_time_minutes']!,
          _crossClampTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('graft_conduit_implant')) {
      context.handle(
        _graftConduitImplantMeta,
        graftConduitImplant.isAcceptableOrUnknown(
          data['graft_conduit_implant']!,
          _graftConduitImplantMeta,
        ),
      );
    }
    if (data.containsKey('outcome')) {
      context.handle(
        _outcomeMeta,
        outcome.isAcceptableOrUnknown(data['outcome']!, _outcomeMeta),
      );
    } else if (isInserting) {
      context.missing(_outcomeMeta);
    }
    if (data.containsKey('complications')) {
      context.handle(
        _complicationsMeta,
        complications.isAcceptableOrUnknown(
          data['complications']!,
          _complicationsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SurgicalCase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurgicalCase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      surgeryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}surgery_date'],
      )!,
      diagnosis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diagnosis'],
      )!,
      urgency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}urgency'],
      )!,
      surgeryType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surgery_type'],
      )!,
      specialty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specialty'],
      )!,
      surgicalApproach: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surgical_approach'],
      ),
      operativeRole: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operative_role'],
      )!,
      technicalSteps: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}technical_steps'],
      ),
      cardiopulmonaryBypassUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}cardiopulmonary_bypass_used'],
      )!,
      bypassTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bypass_time_minutes'],
      ),
      crossClampTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cross_clamp_time_minutes'],
      ),
      graftConduitImplant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}graft_conduit_implant'],
      ),
      outcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome'],
      )!,
      complications: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}complications'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SurgicalCasesTable createAlias(String alias) {
    return $SurgicalCasesTable(attachedDatabase, alias);
  }
}

class SurgicalCase extends DataClass implements Insertable<SurgicalCase> {
  final int id;

  /// Internal SurgiTrack case identifier
  final String caseId;

  /// Link to patient
  final int patientId;
  final DateTime surgeryDate;

  /// Preoperative diagnosis
  final String diagnosis;

  /// Planned / Emergency
  final String urgency;

  /// Primary / Redo
  final String surgeryType;

  /// Cardiac / Thoracic / Vascular
  final String specialty;

  /// Surgical approach
  final String? surgicalApproach;

  /// Observer / Assistant /
  /// Supervised / Independent
  final String operativeRole;

  /// JSON encoded list of technical steps
  final String? technicalSteps;
  final bool cardiopulmonaryBypassUsed;
  final int? bypassTimeMinutes;
  final int? crossClampTimeMinutes;
  final String? graftConduitImplant;
  final String outcome;
  final String? complications;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SurgicalCase({
    required this.id,
    required this.caseId,
    required this.patientId,
    required this.surgeryDate,
    required this.diagnosis,
    required this.urgency,
    required this.surgeryType,
    required this.specialty,
    this.surgicalApproach,
    required this.operativeRole,
    this.technicalSteps,
    required this.cardiopulmonaryBypassUsed,
    this.bypassTimeMinutes,
    this.crossClampTimeMinutes,
    this.graftConduitImplant,
    required this.outcome,
    this.complications,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['case_id'] = Variable<String>(caseId);
    map['patient_id'] = Variable<int>(patientId);
    map['surgery_date'] = Variable<DateTime>(surgeryDate);
    map['diagnosis'] = Variable<String>(diagnosis);
    map['urgency'] = Variable<String>(urgency);
    map['surgery_type'] = Variable<String>(surgeryType);
    map['specialty'] = Variable<String>(specialty);
    if (!nullToAbsent || surgicalApproach != null) {
      map['surgical_approach'] = Variable<String>(surgicalApproach);
    }
    map['operative_role'] = Variable<String>(operativeRole);
    if (!nullToAbsent || technicalSteps != null) {
      map['technical_steps'] = Variable<String>(technicalSteps);
    }
    map['cardiopulmonary_bypass_used'] = Variable<bool>(
      cardiopulmonaryBypassUsed,
    );
    if (!nullToAbsent || bypassTimeMinutes != null) {
      map['bypass_time_minutes'] = Variable<int>(bypassTimeMinutes);
    }
    if (!nullToAbsent || crossClampTimeMinutes != null) {
      map['cross_clamp_time_minutes'] = Variable<int>(crossClampTimeMinutes);
    }
    if (!nullToAbsent || graftConduitImplant != null) {
      map['graft_conduit_implant'] = Variable<String>(graftConduitImplant);
    }
    map['outcome'] = Variable<String>(outcome);
    if (!nullToAbsent || complications != null) {
      map['complications'] = Variable<String>(complications);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SurgicalCasesCompanion toCompanion(bool nullToAbsent) {
    return SurgicalCasesCompanion(
      id: Value(id),
      caseId: Value(caseId),
      patientId: Value(patientId),
      surgeryDate: Value(surgeryDate),
      diagnosis: Value(diagnosis),
      urgency: Value(urgency),
      surgeryType: Value(surgeryType),
      specialty: Value(specialty),
      surgicalApproach: surgicalApproach == null && nullToAbsent
          ? const Value.absent()
          : Value(surgicalApproach),
      operativeRole: Value(operativeRole),
      technicalSteps: technicalSteps == null && nullToAbsent
          ? const Value.absent()
          : Value(technicalSteps),
      cardiopulmonaryBypassUsed: Value(cardiopulmonaryBypassUsed),
      bypassTimeMinutes: bypassTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(bypassTimeMinutes),
      crossClampTimeMinutes: crossClampTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(crossClampTimeMinutes),
      graftConduitImplant: graftConduitImplant == null && nullToAbsent
          ? const Value.absent()
          : Value(graftConduitImplant),
      outcome: Value(outcome),
      complications: complications == null && nullToAbsent
          ? const Value.absent()
          : Value(complications),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SurgicalCase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurgicalCase(
      id: serializer.fromJson<int>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      patientId: serializer.fromJson<int>(json['patientId']),
      surgeryDate: serializer.fromJson<DateTime>(json['surgeryDate']),
      diagnosis: serializer.fromJson<String>(json['diagnosis']),
      urgency: serializer.fromJson<String>(json['urgency']),
      surgeryType: serializer.fromJson<String>(json['surgeryType']),
      specialty: serializer.fromJson<String>(json['specialty']),
      surgicalApproach: serializer.fromJson<String?>(json['surgicalApproach']),
      operativeRole: serializer.fromJson<String>(json['operativeRole']),
      technicalSteps: serializer.fromJson<String?>(json['technicalSteps']),
      cardiopulmonaryBypassUsed: serializer.fromJson<bool>(
        json['cardiopulmonaryBypassUsed'],
      ),
      bypassTimeMinutes: serializer.fromJson<int?>(json['bypassTimeMinutes']),
      crossClampTimeMinutes: serializer.fromJson<int?>(
        json['crossClampTimeMinutes'],
      ),
      graftConduitImplant: serializer.fromJson<String?>(
        json['graftConduitImplant'],
      ),
      outcome: serializer.fromJson<String>(json['outcome']),
      complications: serializer.fromJson<String?>(json['complications']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'caseId': serializer.toJson<String>(caseId),
      'patientId': serializer.toJson<int>(patientId),
      'surgeryDate': serializer.toJson<DateTime>(surgeryDate),
      'diagnosis': serializer.toJson<String>(diagnosis),
      'urgency': serializer.toJson<String>(urgency),
      'surgeryType': serializer.toJson<String>(surgeryType),
      'specialty': serializer.toJson<String>(specialty),
      'surgicalApproach': serializer.toJson<String?>(surgicalApproach),
      'operativeRole': serializer.toJson<String>(operativeRole),
      'technicalSteps': serializer.toJson<String?>(technicalSteps),
      'cardiopulmonaryBypassUsed': serializer.toJson<bool>(
        cardiopulmonaryBypassUsed,
      ),
      'bypassTimeMinutes': serializer.toJson<int?>(bypassTimeMinutes),
      'crossClampTimeMinutes': serializer.toJson<int?>(crossClampTimeMinutes),
      'graftConduitImplant': serializer.toJson<String?>(graftConduitImplant),
      'outcome': serializer.toJson<String>(outcome),
      'complications': serializer.toJson<String?>(complications),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SurgicalCase copyWith({
    int? id,
    String? caseId,
    int? patientId,
    DateTime? surgeryDate,
    String? diagnosis,
    String? urgency,
    String? surgeryType,
    String? specialty,
    Value<String?> surgicalApproach = const Value.absent(),
    String? operativeRole,
    Value<String?> technicalSteps = const Value.absent(),
    bool? cardiopulmonaryBypassUsed,
    Value<int?> bypassTimeMinutes = const Value.absent(),
    Value<int?> crossClampTimeMinutes = const Value.absent(),
    Value<String?> graftConduitImplant = const Value.absent(),
    String? outcome,
    Value<String?> complications = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SurgicalCase(
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    patientId: patientId ?? this.patientId,
    surgeryDate: surgeryDate ?? this.surgeryDate,
    diagnosis: diagnosis ?? this.diagnosis,
    urgency: urgency ?? this.urgency,
    surgeryType: surgeryType ?? this.surgeryType,
    specialty: specialty ?? this.specialty,
    surgicalApproach: surgicalApproach.present
        ? surgicalApproach.value
        : this.surgicalApproach,
    operativeRole: operativeRole ?? this.operativeRole,
    technicalSteps: technicalSteps.present
        ? technicalSteps.value
        : this.technicalSteps,
    cardiopulmonaryBypassUsed:
        cardiopulmonaryBypassUsed ?? this.cardiopulmonaryBypassUsed,
    bypassTimeMinutes: bypassTimeMinutes.present
        ? bypassTimeMinutes.value
        : this.bypassTimeMinutes,
    crossClampTimeMinutes: crossClampTimeMinutes.present
        ? crossClampTimeMinutes.value
        : this.crossClampTimeMinutes,
    graftConduitImplant: graftConduitImplant.present
        ? graftConduitImplant.value
        : this.graftConduitImplant,
    outcome: outcome ?? this.outcome,
    complications: complications.present
        ? complications.value
        : this.complications,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SurgicalCase copyWithCompanion(SurgicalCasesCompanion data) {
    return SurgicalCase(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      surgeryDate: data.surgeryDate.present
          ? data.surgeryDate.value
          : this.surgeryDate,
      diagnosis: data.diagnosis.present ? data.diagnosis.value : this.diagnosis,
      urgency: data.urgency.present ? data.urgency.value : this.urgency,
      surgeryType: data.surgeryType.present
          ? data.surgeryType.value
          : this.surgeryType,
      specialty: data.specialty.present ? data.specialty.value : this.specialty,
      surgicalApproach: data.surgicalApproach.present
          ? data.surgicalApproach.value
          : this.surgicalApproach,
      operativeRole: data.operativeRole.present
          ? data.operativeRole.value
          : this.operativeRole,
      technicalSteps: data.technicalSteps.present
          ? data.technicalSteps.value
          : this.technicalSteps,
      cardiopulmonaryBypassUsed: data.cardiopulmonaryBypassUsed.present
          ? data.cardiopulmonaryBypassUsed.value
          : this.cardiopulmonaryBypassUsed,
      bypassTimeMinutes: data.bypassTimeMinutes.present
          ? data.bypassTimeMinutes.value
          : this.bypassTimeMinutes,
      crossClampTimeMinutes: data.crossClampTimeMinutes.present
          ? data.crossClampTimeMinutes.value
          : this.crossClampTimeMinutes,
      graftConduitImplant: data.graftConduitImplant.present
          ? data.graftConduitImplant.value
          : this.graftConduitImplant,
      outcome: data.outcome.present ? data.outcome.value : this.outcome,
      complications: data.complications.present
          ? data.complications.value
          : this.complications,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SurgicalCase(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('patientId: $patientId, ')
          ..write('surgeryDate: $surgeryDate, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('urgency: $urgency, ')
          ..write('surgeryType: $surgeryType, ')
          ..write('specialty: $specialty, ')
          ..write('surgicalApproach: $surgicalApproach, ')
          ..write('operativeRole: $operativeRole, ')
          ..write('technicalSteps: $technicalSteps, ')
          ..write('cardiopulmonaryBypassUsed: $cardiopulmonaryBypassUsed, ')
          ..write('bypassTimeMinutes: $bypassTimeMinutes, ')
          ..write('crossClampTimeMinutes: $crossClampTimeMinutes, ')
          ..write('graftConduitImplant: $graftConduitImplant, ')
          ..write('outcome: $outcome, ')
          ..write('complications: $complications, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    caseId,
    patientId,
    surgeryDate,
    diagnosis,
    urgency,
    surgeryType,
    specialty,
    surgicalApproach,
    operativeRole,
    technicalSteps,
    cardiopulmonaryBypassUsed,
    bypassTimeMinutes,
    crossClampTimeMinutes,
    graftConduitImplant,
    outcome,
    complications,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurgicalCase &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.patientId == this.patientId &&
          other.surgeryDate == this.surgeryDate &&
          other.diagnosis == this.diagnosis &&
          other.urgency == this.urgency &&
          other.surgeryType == this.surgeryType &&
          other.specialty == this.specialty &&
          other.surgicalApproach == this.surgicalApproach &&
          other.operativeRole == this.operativeRole &&
          other.technicalSteps == this.technicalSteps &&
          other.cardiopulmonaryBypassUsed == this.cardiopulmonaryBypassUsed &&
          other.bypassTimeMinutes == this.bypassTimeMinutes &&
          other.crossClampTimeMinutes == this.crossClampTimeMinutes &&
          other.graftConduitImplant == this.graftConduitImplant &&
          other.outcome == this.outcome &&
          other.complications == this.complications &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SurgicalCasesCompanion extends UpdateCompanion<SurgicalCase> {
  final Value<int> id;
  final Value<String> caseId;
  final Value<int> patientId;
  final Value<DateTime> surgeryDate;
  final Value<String> diagnosis;
  final Value<String> urgency;
  final Value<String> surgeryType;
  final Value<String> specialty;
  final Value<String?> surgicalApproach;
  final Value<String> operativeRole;
  final Value<String?> technicalSteps;
  final Value<bool> cardiopulmonaryBypassUsed;
  final Value<int?> bypassTimeMinutes;
  final Value<int?> crossClampTimeMinutes;
  final Value<String?> graftConduitImplant;
  final Value<String> outcome;
  final Value<String?> complications;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SurgicalCasesCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.patientId = const Value.absent(),
    this.surgeryDate = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.urgency = const Value.absent(),
    this.surgeryType = const Value.absent(),
    this.specialty = const Value.absent(),
    this.surgicalApproach = const Value.absent(),
    this.operativeRole = const Value.absent(),
    this.technicalSteps = const Value.absent(),
    this.cardiopulmonaryBypassUsed = const Value.absent(),
    this.bypassTimeMinutes = const Value.absent(),
    this.crossClampTimeMinutes = const Value.absent(),
    this.graftConduitImplant = const Value.absent(),
    this.outcome = const Value.absent(),
    this.complications = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SurgicalCasesCompanion.insert({
    this.id = const Value.absent(),
    required String caseId,
    required int patientId,
    required DateTime surgeryDate,
    required String diagnosis,
    required String urgency,
    required String surgeryType,
    required String specialty,
    this.surgicalApproach = const Value.absent(),
    required String operativeRole,
    this.technicalSteps = const Value.absent(),
    this.cardiopulmonaryBypassUsed = const Value.absent(),
    this.bypassTimeMinutes = const Value.absent(),
    this.crossClampTimeMinutes = const Value.absent(),
    this.graftConduitImplant = const Value.absent(),
    required String outcome,
    this.complications = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : caseId = Value(caseId),
       patientId = Value(patientId),
       surgeryDate = Value(surgeryDate),
       diagnosis = Value(diagnosis),
       urgency = Value(urgency),
       surgeryType = Value(surgeryType),
       specialty = Value(specialty),
       operativeRole = Value(operativeRole),
       outcome = Value(outcome);
  static Insertable<SurgicalCase> custom({
    Expression<int>? id,
    Expression<String>? caseId,
    Expression<int>? patientId,
    Expression<DateTime>? surgeryDate,
    Expression<String>? diagnosis,
    Expression<String>? urgency,
    Expression<String>? surgeryType,
    Expression<String>? specialty,
    Expression<String>? surgicalApproach,
    Expression<String>? operativeRole,
    Expression<String>? technicalSteps,
    Expression<bool>? cardiopulmonaryBypassUsed,
    Expression<int>? bypassTimeMinutes,
    Expression<int>? crossClampTimeMinutes,
    Expression<String>? graftConduitImplant,
    Expression<String>? outcome,
    Expression<String>? complications,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (patientId != null) 'patient_id': patientId,
      if (surgeryDate != null) 'surgery_date': surgeryDate,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (urgency != null) 'urgency': urgency,
      if (surgeryType != null) 'surgery_type': surgeryType,
      if (specialty != null) 'specialty': specialty,
      if (surgicalApproach != null) 'surgical_approach': surgicalApproach,
      if (operativeRole != null) 'operative_role': operativeRole,
      if (technicalSteps != null) 'technical_steps': technicalSteps,
      if (cardiopulmonaryBypassUsed != null)
        'cardiopulmonary_bypass_used': cardiopulmonaryBypassUsed,
      if (bypassTimeMinutes != null) 'bypass_time_minutes': bypassTimeMinutes,
      if (crossClampTimeMinutes != null)
        'cross_clamp_time_minutes': crossClampTimeMinutes,
      if (graftConduitImplant != null)
        'graft_conduit_implant': graftConduitImplant,
      if (outcome != null) 'outcome': outcome,
      if (complications != null) 'complications': complications,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SurgicalCasesCompanion copyWith({
    Value<int>? id,
    Value<String>? caseId,
    Value<int>? patientId,
    Value<DateTime>? surgeryDate,
    Value<String>? diagnosis,
    Value<String>? urgency,
    Value<String>? surgeryType,
    Value<String>? specialty,
    Value<String?>? surgicalApproach,
    Value<String>? operativeRole,
    Value<String?>? technicalSteps,
    Value<bool>? cardiopulmonaryBypassUsed,
    Value<int?>? bypassTimeMinutes,
    Value<int?>? crossClampTimeMinutes,
    Value<String?>? graftConduitImplant,
    Value<String>? outcome,
    Value<String?>? complications,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SurgicalCasesCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      patientId: patientId ?? this.patientId,
      surgeryDate: surgeryDate ?? this.surgeryDate,
      diagnosis: diagnosis ?? this.diagnosis,
      urgency: urgency ?? this.urgency,
      surgeryType: surgeryType ?? this.surgeryType,
      specialty: specialty ?? this.specialty,
      surgicalApproach: surgicalApproach ?? this.surgicalApproach,
      operativeRole: operativeRole ?? this.operativeRole,
      technicalSteps: technicalSteps ?? this.technicalSteps,
      cardiopulmonaryBypassUsed:
          cardiopulmonaryBypassUsed ?? this.cardiopulmonaryBypassUsed,
      bypassTimeMinutes: bypassTimeMinutes ?? this.bypassTimeMinutes,
      crossClampTimeMinutes:
          crossClampTimeMinutes ?? this.crossClampTimeMinutes,
      graftConduitImplant: graftConduitImplant ?? this.graftConduitImplant,
      outcome: outcome ?? this.outcome,
      complications: complications ?? this.complications,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (surgeryDate.present) {
      map['surgery_date'] = Variable<DateTime>(surgeryDate.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String>(diagnosis.value);
    }
    if (urgency.present) {
      map['urgency'] = Variable<String>(urgency.value);
    }
    if (surgeryType.present) {
      map['surgery_type'] = Variable<String>(surgeryType.value);
    }
    if (specialty.present) {
      map['specialty'] = Variable<String>(specialty.value);
    }
    if (surgicalApproach.present) {
      map['surgical_approach'] = Variable<String>(surgicalApproach.value);
    }
    if (operativeRole.present) {
      map['operative_role'] = Variable<String>(operativeRole.value);
    }
    if (technicalSteps.present) {
      map['technical_steps'] = Variable<String>(technicalSteps.value);
    }
    if (cardiopulmonaryBypassUsed.present) {
      map['cardiopulmonary_bypass_used'] = Variable<bool>(
        cardiopulmonaryBypassUsed.value,
      );
    }
    if (bypassTimeMinutes.present) {
      map['bypass_time_minutes'] = Variable<int>(bypassTimeMinutes.value);
    }
    if (crossClampTimeMinutes.present) {
      map['cross_clamp_time_minutes'] = Variable<int>(
        crossClampTimeMinutes.value,
      );
    }
    if (graftConduitImplant.present) {
      map['graft_conduit_implant'] = Variable<String>(
        graftConduitImplant.value,
      );
    }
    if (outcome.present) {
      map['outcome'] = Variable<String>(outcome.value);
    }
    if (complications.present) {
      map['complications'] = Variable<String>(complications.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurgicalCasesCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('patientId: $patientId, ')
          ..write('surgeryDate: $surgeryDate, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('urgency: $urgency, ')
          ..write('surgeryType: $surgeryType, ')
          ..write('specialty: $specialty, ')
          ..write('surgicalApproach: $surgicalApproach, ')
          ..write('operativeRole: $operativeRole, ')
          ..write('technicalSteps: $technicalSteps, ')
          ..write('cardiopulmonaryBypassUsed: $cardiopulmonaryBypassUsed, ')
          ..write('bypassTimeMinutes: $bypassTimeMinutes, ')
          ..write('crossClampTimeMinutes: $crossClampTimeMinutes, ')
          ..write('graftConduitImplant: $graftConduitImplant, ')
          ..write('outcome: $outcome, ')
          ..write('complications: $complications, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CaseProceduresTable extends CaseProcedures
    with TableInfo<$CaseProceduresTable, CaseProcedure> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseProceduresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<int> caseId = GeneratedColumn<int>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _procedureIdMeta = const VerificationMeta(
    'procedureId',
  );
  @override
  late final GeneratedColumn<int> procedureId = GeneratedColumn<int>(
    'procedure_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("PRIMARY"),
  );
  @override
  List<GeneratedColumn> get $columns => [id, caseId, procedureId, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_procedures';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseProcedure> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('procedure_id')) {
      context.handle(
        _procedureIdMeta,
        procedureId.isAcceptableOrUnknown(
          data['procedure_id']!,
          _procedureIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_procedureIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseProcedure map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseProcedure(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}case_id'],
      )!,
      procedureId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}procedure_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $CaseProceduresTable createAlias(String alias) {
    return $CaseProceduresTable(attachedDatabase, alias);
  }
}

class CaseProcedure extends DataClass implements Insertable<CaseProcedure> {
  final int id;
  final int caseId;
  final int procedureId;
  final String type;
  const CaseProcedure({
    required this.id,
    required this.caseId,
    required this.procedureId,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['case_id'] = Variable<int>(caseId);
    map['procedure_id'] = Variable<int>(procedureId);
    map['type'] = Variable<String>(type);
    return map;
  }

  CaseProceduresCompanion toCompanion(bool nullToAbsent) {
    return CaseProceduresCompanion(
      id: Value(id),
      caseId: Value(caseId),
      procedureId: Value(procedureId),
      type: Value(type),
    );
  }

  factory CaseProcedure.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseProcedure(
      id: serializer.fromJson<int>(json['id']),
      caseId: serializer.fromJson<int>(json['caseId']),
      procedureId: serializer.fromJson<int>(json['procedureId']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'caseId': serializer.toJson<int>(caseId),
      'procedureId': serializer.toJson<int>(procedureId),
      'type': serializer.toJson<String>(type),
    };
  }

  CaseProcedure copyWith({
    int? id,
    int? caseId,
    int? procedureId,
    String? type,
  }) => CaseProcedure(
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    procedureId: procedureId ?? this.procedureId,
    type: type ?? this.type,
  );
  CaseProcedure copyWithCompanion(CaseProceduresCompanion data) {
    return CaseProcedure(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      procedureId: data.procedureId.present
          ? data.procedureId.value
          : this.procedureId,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseProcedure(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('procedureId: $procedureId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, caseId, procedureId, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseProcedure &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.procedureId == this.procedureId &&
          other.type == this.type);
}

class CaseProceduresCompanion extends UpdateCompanion<CaseProcedure> {
  final Value<int> id;
  final Value<int> caseId;
  final Value<int> procedureId;
  final Value<String> type;
  const CaseProceduresCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.procedureId = const Value.absent(),
    this.type = const Value.absent(),
  });
  CaseProceduresCompanion.insert({
    this.id = const Value.absent(),
    required int caseId,
    required int procedureId,
    this.type = const Value.absent(),
  }) : caseId = Value(caseId),
       procedureId = Value(procedureId);
  static Insertable<CaseProcedure> custom({
    Expression<int>? id,
    Expression<int>? caseId,
    Expression<int>? procedureId,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (procedureId != null) 'procedure_id': procedureId,
      if (type != null) 'type': type,
    });
  }

  CaseProceduresCompanion copyWith({
    Value<int>? id,
    Value<int>? caseId,
    Value<int>? procedureId,
    Value<String>? type,
  }) {
    return CaseProceduresCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      procedureId: procedureId ?? this.procedureId,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<int>(caseId.value);
    }
    if (procedureId.present) {
      map['procedure_id'] = Variable<int>(procedureId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseProceduresCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('procedureId: $procedureId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $CaseAttachmentsTable extends CaseAttachments
    with TableInfo<$CaseAttachmentsTable, CaseAttachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<int> caseId = GeneratedColumn<int>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    caseId,
    displayName,
    filePath,
    fileType,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseAttachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseAttachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseAttachment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}case_id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CaseAttachmentsTable createAlias(String alias) {
    return $CaseAttachmentsTable(attachedDatabase, alias);
  }
}

class CaseAttachment extends DataClass implements Insertable<CaseAttachment> {
  final int id;
  final int caseId;
  final String displayName;
  final String filePath;
  final String fileType;
  final DateTime createdAt;
  const CaseAttachment({
    required this.id,
    required this.caseId,
    required this.displayName,
    required this.filePath,
    required this.fileType,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['case_id'] = Variable<int>(caseId);
    map['display_name'] = Variable<String>(displayName);
    map['file_path'] = Variable<String>(filePath);
    map['file_type'] = Variable<String>(fileType);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CaseAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return CaseAttachmentsCompanion(
      id: Value(id),
      caseId: Value(caseId),
      displayName: Value(displayName),
      filePath: Value(filePath),
      fileType: Value(fileType),
      createdAt: Value(createdAt),
    );
  }

  factory CaseAttachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseAttachment(
      id: serializer.fromJson<int>(json['id']),
      caseId: serializer.fromJson<int>(json['caseId']),
      displayName: serializer.fromJson<String>(json['displayName']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileType: serializer.fromJson<String>(json['fileType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'caseId': serializer.toJson<int>(caseId),
      'displayName': serializer.toJson<String>(displayName),
      'filePath': serializer.toJson<String>(filePath),
      'fileType': serializer.toJson<String>(fileType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CaseAttachment copyWith({
    int? id,
    int? caseId,
    String? displayName,
    String? filePath,
    String? fileType,
    DateTime? createdAt,
  }) => CaseAttachment(
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    displayName: displayName ?? this.displayName,
    filePath: filePath ?? this.filePath,
    fileType: fileType ?? this.fileType,
    createdAt: createdAt ?? this.createdAt,
  );
  CaseAttachment copyWithCompanion(CaseAttachmentsCompanion data) {
    return CaseAttachment(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseAttachment(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('displayName: $displayName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, caseId, displayName, filePath, fileType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseAttachment &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.displayName == this.displayName &&
          other.filePath == this.filePath &&
          other.fileType == this.fileType &&
          other.createdAt == this.createdAt);
}

class CaseAttachmentsCompanion extends UpdateCompanion<CaseAttachment> {
  final Value<int> id;
  final Value<int> caseId;
  final Value<String> displayName;
  final Value<String> filePath;
  final Value<String> fileType;
  final Value<DateTime> createdAt;
  const CaseAttachmentsCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.displayName = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CaseAttachmentsCompanion.insert({
    this.id = const Value.absent(),
    required int caseId,
    required String displayName,
    required String filePath,
    required String fileType,
    required DateTime createdAt,
  }) : caseId = Value(caseId),
       displayName = Value(displayName),
       filePath = Value(filePath),
       fileType = Value(fileType),
       createdAt = Value(createdAt);
  static Insertable<CaseAttachment> custom({
    Expression<int>? id,
    Expression<int>? caseId,
    Expression<String>? displayName,
    Expression<String>? filePath,
    Expression<String>? fileType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (displayName != null) 'display_name': displayName,
      if (filePath != null) 'file_path': filePath,
      if (fileType != null) 'file_type': fileType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CaseAttachmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? caseId,
    Value<String>? displayName,
    Value<String>? filePath,
    Value<String>? fileType,
    Value<DateTime>? createdAt,
  }) {
    return CaseAttachmentsCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      displayName: displayName ?? this.displayName,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<int>(caseId.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseAttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('displayName: $displayName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $PatientAttachmentsTable patientAttachments =
      $PatientAttachmentsTable(this);
  late final $PatientTagsTable patientTags = $PatientTagsTable(this);
  late final $ProceduresTable procedures = $ProceduresTable(this);
  late final $SurgicalCasesTable surgicalCases = $SurgicalCasesTable(this);
  late final $CaseProceduresTable caseProcedures = $CaseProceduresTable(this);
  late final $CaseAttachmentsTable caseAttachments = $CaseAttachmentsTable(
    this,
  );
  late final PatientDao patientDao = PatientDao(this as AppDatabase);
  late final PatientAttachmentDao patientAttachmentDao = PatientAttachmentDao(
    this as AppDatabase,
  );
  late final ProcedureDao procedureDao = ProcedureDao(this as AppDatabase);
  late final SurgicalCaseDao surgicalCaseDao = SurgicalCaseDao(
    this as AppDatabase,
  );
  late final CaseProcedureDao caseProcedureDao = CaseProcedureDao(
    this as AppDatabase,
  );
  late final CaseAttachmentDao caseAttachmentDao = CaseAttachmentDao(
    this as AppDatabase,
  );
  late final DashboardDao dashboardDao = DashboardDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    patients,
    patientAttachments,
    patientTags,
    procedures,
    surgicalCases,
    caseProcedures,
    caseAttachments,
  ];
}

typedef $$PatientsTableCreateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      required String patientId,
      required String name,
      required String hospitalId,
      required DateTime dateOfBirth,
      Value<String?> bloodGroup,
      Value<String?> comorbidities,
      Value<String?> address,
      Value<DateTime?> admissionDate,
      Value<double?> ejectionFraction,
      Value<String?> pastOperativeHistory,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$PatientsTableUpdateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      Value<String> patientId,
      Value<String> name,
      Value<String> hospitalId,
      Value<DateTime> dateOfBirth,
      Value<String?> bloodGroup,
      Value<String?> comorbidities,
      Value<String?> address,
      Value<DateTime?> admissionDate,
      Value<double?> ejectionFraction,
      Value<String?> pastOperativeHistory,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$PatientsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hospitalId => $composableBuilder(
    column: $table.hospitalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bloodGroup => $composableBuilder(
    column: $table.bloodGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comorbidities => $composableBuilder(
    column: $table.comorbidities,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get admissionDate => $composableBuilder(
    column: $table.admissionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ejectionFraction => $composableBuilder(
    column: $table.ejectionFraction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pastOperativeHistory => $composableBuilder(
    column: $table.pastOperativeHistory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PatientsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hospitalId => $composableBuilder(
    column: $table.hospitalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bloodGroup => $composableBuilder(
    column: $table.bloodGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comorbidities => $composableBuilder(
    column: $table.comorbidities,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get admissionDate => $composableBuilder(
    column: $table.admissionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ejectionFraction => $composableBuilder(
    column: $table.ejectionFraction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pastOperativeHistory => $composableBuilder(
    column: $table.pastOperativeHistory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get hospitalId => $composableBuilder(
    column: $table.hospitalId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bloodGroup => $composableBuilder(
    column: $table.bloodGroup,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comorbidities => $composableBuilder(
    column: $table.comorbidities,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get admissionDate => $composableBuilder(
    column: $table.admissionDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ejectionFraction => $composableBuilder(
    column: $table.ejectionFraction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pastOperativeHistory => $composableBuilder(
    column: $table.pastOperativeHistory,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PatientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientsTable,
          PatientData,
          $$PatientsTableFilterComposer,
          $$PatientsTableOrderingComposer,
          $$PatientsTableAnnotationComposer,
          $$PatientsTableCreateCompanionBuilder,
          $$PatientsTableUpdateCompanionBuilder,
          (
            PatientData,
            BaseReferences<_$AppDatabase, $PatientsTable, PatientData>,
          ),
          PatientData,
          PrefetchHooks Function()
        > {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> patientId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> hospitalId = const Value.absent(),
                Value<DateTime> dateOfBirth = const Value.absent(),
                Value<String?> bloodGroup = const Value.absent(),
                Value<String?> comorbidities = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<DateTime?> admissionDate = const Value.absent(),
                Value<double?> ejectionFraction = const Value.absent(),
                Value<String?> pastOperativeHistory = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PatientsCompanion(
                id: id,
                patientId: patientId,
                name: name,
                hospitalId: hospitalId,
                dateOfBirth: dateOfBirth,
                bloodGroup: bloodGroup,
                comorbidities: comorbidities,
                address: address,
                admissionDate: admissionDate,
                ejectionFraction: ejectionFraction,
                pastOperativeHistory: pastOperativeHistory,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String patientId,
                required String name,
                required String hospitalId,
                required DateTime dateOfBirth,
                Value<String?> bloodGroup = const Value.absent(),
                Value<String?> comorbidities = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<DateTime?> admissionDate = const Value.absent(),
                Value<double?> ejectionFraction = const Value.absent(),
                Value<String?> pastOperativeHistory = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => PatientsCompanion.insert(
                id: id,
                patientId: patientId,
                name: name,
                hospitalId: hospitalId,
                dateOfBirth: dateOfBirth,
                bloodGroup: bloodGroup,
                comorbidities: comorbidities,
                address: address,
                admissionDate: admissionDate,
                ejectionFraction: ejectionFraction,
                pastOperativeHistory: pastOperativeHistory,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PatientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientsTable,
      PatientData,
      $$PatientsTableFilterComposer,
      $$PatientsTableOrderingComposer,
      $$PatientsTableAnnotationComposer,
      $$PatientsTableCreateCompanionBuilder,
      $$PatientsTableUpdateCompanionBuilder,
      (PatientData, BaseReferences<_$AppDatabase, $PatientsTable, PatientData>),
      PatientData,
      PrefetchHooks Function()
    >;
typedef $$PatientAttachmentsTableCreateCompanionBuilder =
    PatientAttachmentsCompanion Function({
      Value<int> id,
      required int patientId,
      required String displayName,
      required String filePath,
      required String fileType,
      required DateTime createdAt,
    });
typedef $$PatientAttachmentsTableUpdateCompanionBuilder =
    PatientAttachmentsCompanion Function({
      Value<int> id,
      Value<int> patientId,
      Value<String> displayName,
      Value<String> filePath,
      Value<String> fileType,
      Value<DateTime> createdAt,
    });

class $$PatientAttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientAttachmentsTable> {
  $$PatientAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PatientAttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientAttachmentsTable> {
  $$PatientAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PatientAttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientAttachmentsTable> {
  $$PatientAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PatientAttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientAttachmentsTable,
          PatientAttachmentData,
          $$PatientAttachmentsTableFilterComposer,
          $$PatientAttachmentsTableOrderingComposer,
          $$PatientAttachmentsTableAnnotationComposer,
          $$PatientAttachmentsTableCreateCompanionBuilder,
          $$PatientAttachmentsTableUpdateCompanionBuilder,
          (
            PatientAttachmentData,
            BaseReferences<
              _$AppDatabase,
              $PatientAttachmentsTable,
              PatientAttachmentData
            >,
          ),
          PatientAttachmentData,
          PrefetchHooks Function()
        > {
  $$PatientAttachmentsTableTableManager(
    _$AppDatabase db,
    $PatientAttachmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientAttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientAttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientAttachmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PatientAttachmentsCompanion(
                id: id,
                patientId: patientId,
                displayName: displayName,
                filePath: filePath,
                fileType: fileType,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientId,
                required String displayName,
                required String filePath,
                required String fileType,
                required DateTime createdAt,
              }) => PatientAttachmentsCompanion.insert(
                id: id,
                patientId: patientId,
                displayName: displayName,
                filePath: filePath,
                fileType: fileType,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PatientAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientAttachmentsTable,
      PatientAttachmentData,
      $$PatientAttachmentsTableFilterComposer,
      $$PatientAttachmentsTableOrderingComposer,
      $$PatientAttachmentsTableAnnotationComposer,
      $$PatientAttachmentsTableCreateCompanionBuilder,
      $$PatientAttachmentsTableUpdateCompanionBuilder,
      (
        PatientAttachmentData,
        BaseReferences<
          _$AppDatabase,
          $PatientAttachmentsTable,
          PatientAttachmentData
        >,
      ),
      PatientAttachmentData,
      PrefetchHooks Function()
    >;
typedef $$PatientTagsTableCreateCompanionBuilder =
    PatientTagsCompanion Function({
      Value<int> id,
      required int patientId,
      required String tag,
      required DateTime createdAt,
    });
typedef $$PatientTagsTableUpdateCompanionBuilder =
    PatientTagsCompanion Function({
      Value<int> id,
      Value<int> patientId,
      Value<String> tag,
      Value<DateTime> createdAt,
    });

class $$PatientTagsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientTagsTable> {
  $$PatientTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PatientTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientTagsTable> {
  $$PatientTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PatientTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientTagsTable> {
  $$PatientTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PatientTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientTagsTable,
          PatientTagData,
          $$PatientTagsTableFilterComposer,
          $$PatientTagsTableOrderingComposer,
          $$PatientTagsTableAnnotationComposer,
          $$PatientTagsTableCreateCompanionBuilder,
          $$PatientTagsTableUpdateCompanionBuilder,
          (
            PatientTagData,
            BaseReferences<_$AppDatabase, $PatientTagsTable, PatientTagData>,
          ),
          PatientTagData,
          PrefetchHooks Function()
        > {
  $$PatientTagsTableTableManager(_$AppDatabase db, $PatientTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PatientTagsCompanion(
                id: id,
                patientId: patientId,
                tag: tag,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientId,
                required String tag,
                required DateTime createdAt,
              }) => PatientTagsCompanion.insert(
                id: id,
                patientId: patientId,
                tag: tag,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PatientTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientTagsTable,
      PatientTagData,
      $$PatientTagsTableFilterComposer,
      $$PatientTagsTableOrderingComposer,
      $$PatientTagsTableAnnotationComposer,
      $$PatientTagsTableCreateCompanionBuilder,
      $$PatientTagsTableUpdateCompanionBuilder,
      (
        PatientTagData,
        BaseReferences<_$AppDatabase, $PatientTagsTable, PatientTagData>,
      ),
      PatientTagData,
      PrefetchHooks Function()
    >;
typedef $$ProceduresTableCreateCompanionBuilder =
    ProceduresCompanion Function({
      Value<int> id,
      required String procedureId,
      required String name,
      required String category,
      Value<String> specialty,
      Value<int?> parentId,
      Value<String?> aliases,
      Value<String?> description,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$ProceduresTableUpdateCompanionBuilder =
    ProceduresCompanion Function({
      Value<int> id,
      Value<String> procedureId,
      Value<String> name,
      Value<String> category,
      Value<String> specialty,
      Value<int?> parentId,
      Value<String?> aliases,
      Value<String?> description,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

class $$ProceduresTableFilterComposer
    extends Composer<_$AppDatabase, $ProceduresTable> {
  $$ProceduresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProceduresTableOrderingComposer
    extends Composer<_$AppDatabase, $ProceduresTable> {
  $$ProceduresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProceduresTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProceduresTable> {
  $$ProceduresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get specialty =>
      $composableBuilder(column: $table.specialty, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProceduresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProceduresTable,
          ProcedureData,
          $$ProceduresTableFilterComposer,
          $$ProceduresTableOrderingComposer,
          $$ProceduresTableAnnotationComposer,
          $$ProceduresTableCreateCompanionBuilder,
          $$ProceduresTableUpdateCompanionBuilder,
          (
            ProcedureData,
            BaseReferences<_$AppDatabase, $ProceduresTable, ProcedureData>,
          ),
          ProcedureData,
          PrefetchHooks Function()
        > {
  $$ProceduresTableTableManager(_$AppDatabase db, $ProceduresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProceduresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProceduresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProceduresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> procedureId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> specialty = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProceduresCompanion(
                id: id,
                procedureId: procedureId,
                name: name,
                category: category,
                specialty: specialty,
                parentId: parentId,
                aliases: aliases,
                description: description,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String procedureId,
                required String name,
                required String category,
                Value<String> specialty = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProceduresCompanion.insert(
                id: id,
                procedureId: procedureId,
                name: name,
                category: category,
                specialty: specialty,
                parentId: parentId,
                aliases: aliases,
                description: description,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProceduresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProceduresTable,
      ProcedureData,
      $$ProceduresTableFilterComposer,
      $$ProceduresTableOrderingComposer,
      $$ProceduresTableAnnotationComposer,
      $$ProceduresTableCreateCompanionBuilder,
      $$ProceduresTableUpdateCompanionBuilder,
      (
        ProcedureData,
        BaseReferences<_$AppDatabase, $ProceduresTable, ProcedureData>,
      ),
      ProcedureData,
      PrefetchHooks Function()
    >;
typedef $$SurgicalCasesTableCreateCompanionBuilder =
    SurgicalCasesCompanion Function({
      Value<int> id,
      required String caseId,
      required int patientId,
      required DateTime surgeryDate,
      required String diagnosis,
      required String urgency,
      required String surgeryType,
      required String specialty,
      Value<String?> surgicalApproach,
      required String operativeRole,
      Value<String?> technicalSteps,
      Value<bool> cardiopulmonaryBypassUsed,
      Value<int?> bypassTimeMinutes,
      Value<int?> crossClampTimeMinutes,
      Value<String?> graftConduitImplant,
      required String outcome,
      Value<String?> complications,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$SurgicalCasesTableUpdateCompanionBuilder =
    SurgicalCasesCompanion Function({
      Value<int> id,
      Value<String> caseId,
      Value<int> patientId,
      Value<DateTime> surgeryDate,
      Value<String> diagnosis,
      Value<String> urgency,
      Value<String> surgeryType,
      Value<String> specialty,
      Value<String?> surgicalApproach,
      Value<String> operativeRole,
      Value<String?> technicalSteps,
      Value<bool> cardiopulmonaryBypassUsed,
      Value<int?> bypassTimeMinutes,
      Value<int?> crossClampTimeMinutes,
      Value<String?> graftConduitImplant,
      Value<String> outcome,
      Value<String?> complications,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$SurgicalCasesTableFilterComposer
    extends Composer<_$AppDatabase, $SurgicalCasesTable> {
  $$SurgicalCasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get surgeryDate => $composableBuilder(
    column: $table.surgeryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urgency => $composableBuilder(
    column: $table.urgency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surgeryType => $composableBuilder(
    column: $table.surgeryType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surgicalApproach => $composableBuilder(
    column: $table.surgicalApproach,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operativeRole => $composableBuilder(
    column: $table.operativeRole,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get technicalSteps => $composableBuilder(
    column: $table.technicalSteps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get cardiopulmonaryBypassUsed => $composableBuilder(
    column: $table.cardiopulmonaryBypassUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bypassTimeMinutes => $composableBuilder(
    column: $table.bypassTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get crossClampTimeMinutes => $composableBuilder(
    column: $table.crossClampTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get graftConduitImplant => $composableBuilder(
    column: $table.graftConduitImplant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get complications => $composableBuilder(
    column: $table.complications,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SurgicalCasesTableOrderingComposer
    extends Composer<_$AppDatabase, $SurgicalCasesTable> {
  $$SurgicalCasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get patientId => $composableBuilder(
    column: $table.patientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get surgeryDate => $composableBuilder(
    column: $table.surgeryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urgency => $composableBuilder(
    column: $table.urgency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surgeryType => $composableBuilder(
    column: $table.surgeryType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surgicalApproach => $composableBuilder(
    column: $table.surgicalApproach,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operativeRole => $composableBuilder(
    column: $table.operativeRole,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get technicalSteps => $composableBuilder(
    column: $table.technicalSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get cardiopulmonaryBypassUsed => $composableBuilder(
    column: $table.cardiopulmonaryBypassUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bypassTimeMinutes => $composableBuilder(
    column: $table.bypassTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get crossClampTimeMinutes => $composableBuilder(
    column: $table.crossClampTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get graftConduitImplant => $composableBuilder(
    column: $table.graftConduitImplant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get complications => $composableBuilder(
    column: $table.complications,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SurgicalCasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SurgicalCasesTable> {
  $$SurgicalCasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<int> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<DateTime> get surgeryDate => $composableBuilder(
    column: $table.surgeryDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get diagnosis =>
      $composableBuilder(column: $table.diagnosis, builder: (column) => column);

  GeneratedColumn<String> get urgency =>
      $composableBuilder(column: $table.urgency, builder: (column) => column);

  GeneratedColumn<String> get surgeryType => $composableBuilder(
    column: $table.surgeryType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specialty =>
      $composableBuilder(column: $table.specialty, builder: (column) => column);

  GeneratedColumn<String> get surgicalApproach => $composableBuilder(
    column: $table.surgicalApproach,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operativeRole => $composableBuilder(
    column: $table.operativeRole,
    builder: (column) => column,
  );

  GeneratedColumn<String> get technicalSteps => $composableBuilder(
    column: $table.technicalSteps,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get cardiopulmonaryBypassUsed => $composableBuilder(
    column: $table.cardiopulmonaryBypassUsed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bypassTimeMinutes => $composableBuilder(
    column: $table.bypassTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get crossClampTimeMinutes => $composableBuilder(
    column: $table.crossClampTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get graftConduitImplant => $composableBuilder(
    column: $table.graftConduitImplant,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outcome =>
      $composableBuilder(column: $table.outcome, builder: (column) => column);

  GeneratedColumn<String> get complications => $composableBuilder(
    column: $table.complications,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SurgicalCasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SurgicalCasesTable,
          SurgicalCase,
          $$SurgicalCasesTableFilterComposer,
          $$SurgicalCasesTableOrderingComposer,
          $$SurgicalCasesTableAnnotationComposer,
          $$SurgicalCasesTableCreateCompanionBuilder,
          $$SurgicalCasesTableUpdateCompanionBuilder,
          (
            SurgicalCase,
            BaseReferences<_$AppDatabase, $SurgicalCasesTable, SurgicalCase>,
          ),
          SurgicalCase,
          PrefetchHooks Function()
        > {
  $$SurgicalCasesTableTableManager(_$AppDatabase db, $SurgicalCasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SurgicalCasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SurgicalCasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SurgicalCasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> caseId = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<DateTime> surgeryDate = const Value.absent(),
                Value<String> diagnosis = const Value.absent(),
                Value<String> urgency = const Value.absent(),
                Value<String> surgeryType = const Value.absent(),
                Value<String> specialty = const Value.absent(),
                Value<String?> surgicalApproach = const Value.absent(),
                Value<String> operativeRole = const Value.absent(),
                Value<String?> technicalSteps = const Value.absent(),
                Value<bool> cardiopulmonaryBypassUsed = const Value.absent(),
                Value<int?> bypassTimeMinutes = const Value.absent(),
                Value<int?> crossClampTimeMinutes = const Value.absent(),
                Value<String?> graftConduitImplant = const Value.absent(),
                Value<String> outcome = const Value.absent(),
                Value<String?> complications = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SurgicalCasesCompanion(
                id: id,
                caseId: caseId,
                patientId: patientId,
                surgeryDate: surgeryDate,
                diagnosis: diagnosis,
                urgency: urgency,
                surgeryType: surgeryType,
                specialty: specialty,
                surgicalApproach: surgicalApproach,
                operativeRole: operativeRole,
                technicalSteps: technicalSteps,
                cardiopulmonaryBypassUsed: cardiopulmonaryBypassUsed,
                bypassTimeMinutes: bypassTimeMinutes,
                crossClampTimeMinutes: crossClampTimeMinutes,
                graftConduitImplant: graftConduitImplant,
                outcome: outcome,
                complications: complications,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String caseId,
                required int patientId,
                required DateTime surgeryDate,
                required String diagnosis,
                required String urgency,
                required String surgeryType,
                required String specialty,
                Value<String?> surgicalApproach = const Value.absent(),
                required String operativeRole,
                Value<String?> technicalSteps = const Value.absent(),
                Value<bool> cardiopulmonaryBypassUsed = const Value.absent(),
                Value<int?> bypassTimeMinutes = const Value.absent(),
                Value<int?> crossClampTimeMinutes = const Value.absent(),
                Value<String?> graftConduitImplant = const Value.absent(),
                required String outcome,
                Value<String?> complications = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SurgicalCasesCompanion.insert(
                id: id,
                caseId: caseId,
                patientId: patientId,
                surgeryDate: surgeryDate,
                diagnosis: diagnosis,
                urgency: urgency,
                surgeryType: surgeryType,
                specialty: specialty,
                surgicalApproach: surgicalApproach,
                operativeRole: operativeRole,
                technicalSteps: technicalSteps,
                cardiopulmonaryBypassUsed: cardiopulmonaryBypassUsed,
                bypassTimeMinutes: bypassTimeMinutes,
                crossClampTimeMinutes: crossClampTimeMinutes,
                graftConduitImplant: graftConduitImplant,
                outcome: outcome,
                complications: complications,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SurgicalCasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SurgicalCasesTable,
      SurgicalCase,
      $$SurgicalCasesTableFilterComposer,
      $$SurgicalCasesTableOrderingComposer,
      $$SurgicalCasesTableAnnotationComposer,
      $$SurgicalCasesTableCreateCompanionBuilder,
      $$SurgicalCasesTableUpdateCompanionBuilder,
      (
        SurgicalCase,
        BaseReferences<_$AppDatabase, $SurgicalCasesTable, SurgicalCase>,
      ),
      SurgicalCase,
      PrefetchHooks Function()
    >;
typedef $$CaseProceduresTableCreateCompanionBuilder =
    CaseProceduresCompanion Function({
      Value<int> id,
      required int caseId,
      required int procedureId,
      Value<String> type,
    });
typedef $$CaseProceduresTableUpdateCompanionBuilder =
    CaseProceduresCompanion Function({
      Value<int> id,
      Value<int> caseId,
      Value<int> procedureId,
      Value<String> type,
    });

class $$CaseProceduresTableFilterComposer
    extends Composer<_$AppDatabase, $CaseProceduresTable> {
  $$CaseProceduresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CaseProceduresTableOrderingComposer
    extends Composer<_$AppDatabase, $CaseProceduresTable> {
  $$CaseProceduresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CaseProceduresTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaseProceduresTable> {
  $$CaseProceduresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<int> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$CaseProceduresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaseProceduresTable,
          CaseProcedure,
          $$CaseProceduresTableFilterComposer,
          $$CaseProceduresTableOrderingComposer,
          $$CaseProceduresTableAnnotationComposer,
          $$CaseProceduresTableCreateCompanionBuilder,
          $$CaseProceduresTableUpdateCompanionBuilder,
          (
            CaseProcedure,
            BaseReferences<_$AppDatabase, $CaseProceduresTable, CaseProcedure>,
          ),
          CaseProcedure,
          PrefetchHooks Function()
        > {
  $$CaseProceduresTableTableManager(
    _$AppDatabase db,
    $CaseProceduresTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseProceduresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseProceduresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseProceduresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> caseId = const Value.absent(),
                Value<int> procedureId = const Value.absent(),
                Value<String> type = const Value.absent(),
              }) => CaseProceduresCompanion(
                id: id,
                caseId: caseId,
                procedureId: procedureId,
                type: type,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int caseId,
                required int procedureId,
                Value<String> type = const Value.absent(),
              }) => CaseProceduresCompanion.insert(
                id: id,
                caseId: caseId,
                procedureId: procedureId,
                type: type,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CaseProceduresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaseProceduresTable,
      CaseProcedure,
      $$CaseProceduresTableFilterComposer,
      $$CaseProceduresTableOrderingComposer,
      $$CaseProceduresTableAnnotationComposer,
      $$CaseProceduresTableCreateCompanionBuilder,
      $$CaseProceduresTableUpdateCompanionBuilder,
      (
        CaseProcedure,
        BaseReferences<_$AppDatabase, $CaseProceduresTable, CaseProcedure>,
      ),
      CaseProcedure,
      PrefetchHooks Function()
    >;
typedef $$CaseAttachmentsTableCreateCompanionBuilder =
    CaseAttachmentsCompanion Function({
      Value<int> id,
      required int caseId,
      required String displayName,
      required String filePath,
      required String fileType,
      required DateTime createdAt,
    });
typedef $$CaseAttachmentsTableUpdateCompanionBuilder =
    CaseAttachmentsCompanion Function({
      Value<int> id,
      Value<int> caseId,
      Value<String> displayName,
      Value<String> filePath,
      Value<String> fileType,
      Value<DateTime> createdAt,
    });

class $$CaseAttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $CaseAttachmentsTable> {
  $$CaseAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CaseAttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CaseAttachmentsTable> {
  $$CaseAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CaseAttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaseAttachmentsTable> {
  $$CaseAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CaseAttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaseAttachmentsTable,
          CaseAttachment,
          $$CaseAttachmentsTableFilterComposer,
          $$CaseAttachmentsTableOrderingComposer,
          $$CaseAttachmentsTableAnnotationComposer,
          $$CaseAttachmentsTableCreateCompanionBuilder,
          $$CaseAttachmentsTableUpdateCompanionBuilder,
          (
            CaseAttachment,
            BaseReferences<
              _$AppDatabase,
              $CaseAttachmentsTable,
              CaseAttachment
            >,
          ),
          CaseAttachment,
          PrefetchHooks Function()
        > {
  $$CaseAttachmentsTableTableManager(
    _$AppDatabase db,
    $CaseAttachmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseAttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseAttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseAttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> caseId = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CaseAttachmentsCompanion(
                id: id,
                caseId: caseId,
                displayName: displayName,
                filePath: filePath,
                fileType: fileType,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int caseId,
                required String displayName,
                required String filePath,
                required String fileType,
                required DateTime createdAt,
              }) => CaseAttachmentsCompanion.insert(
                id: id,
                caseId: caseId,
                displayName: displayName,
                filePath: filePath,
                fileType: fileType,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CaseAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaseAttachmentsTable,
      CaseAttachment,
      $$CaseAttachmentsTableFilterComposer,
      $$CaseAttachmentsTableOrderingComposer,
      $$CaseAttachmentsTableAnnotationComposer,
      $$CaseAttachmentsTableCreateCompanionBuilder,
      $$CaseAttachmentsTableUpdateCompanionBuilder,
      (
        CaseAttachment,
        BaseReferences<_$AppDatabase, $CaseAttachmentsTable, CaseAttachment>,
      ),
      CaseAttachment,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$PatientAttachmentsTableTableManager get patientAttachments =>
      $$PatientAttachmentsTableTableManager(_db, _db.patientAttachments);
  $$PatientTagsTableTableManager get patientTags =>
      $$PatientTagsTableTableManager(_db, _db.patientTags);
  $$ProceduresTableTableManager get procedures =>
      $$ProceduresTableTableManager(_db, _db.procedures);
  $$SurgicalCasesTableTableManager get surgicalCases =>
      $$SurgicalCasesTableTableManager(_db, _db.surgicalCases);
  $$CaseProceduresTableTableManager get caseProcedures =>
      $$CaseProceduresTableTableManager(_db, _db.caseProcedures);
  $$CaseAttachmentsTableTableManager get caseAttachments =>
      $$CaseAttachmentsTableTableManager(_db, _db.caseAttachments);
}
