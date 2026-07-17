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
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Male'),
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
    sex,
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
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
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
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
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
  final String sex;
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
    required this.sex,
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
    map['sex'] = Variable<String>(sex);
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
      sex: Value(sex),
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
      sex: serializer.fromJson<String>(json['sex']),
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
      'sex': serializer.toJson<String>(sex),
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
    String? sex,
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
    sex: sex ?? this.sex,
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
      sex: data.sex.present ? data.sex.value : this.sex,
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
          ..write('sex: $sex, ')
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
    sex,
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
          other.sex == this.sex &&
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
  final Value<String> sex;
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
    this.sex = const Value.absent(),
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
    this.sex = const Value.absent(),
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
    Expression<String>? sex,
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
      if (sex != null) 'sex': sex,
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
    Value<String>? sex,
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
      sex: sex ?? this.sex,
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
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
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
          ..write('sex: $sex, ')
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
  static const VerificationMeta _shortNameMeta = const VerificationMeta(
    'shortName',
  );
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
    'short_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    defaultValue: const Constant('Cardiac'),
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
  static const VerificationMeta _nodeTypeMeta = const VerificationMeta(
    'nodeType',
  );
  @override
  late final GeneratedColumn<String> nodeType = GeneratedColumn<String>(
    'node_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('procedure'),
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
  static const VerificationMeta _templateMeta = const VerificationMeta(
    'template',
  );
  @override
  late final GeneratedColumn<String> template = GeneratedColumn<String>(
    'template',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supportsCPBMeta = const VerificationMeta(
    'supportsCPB',
  );
  @override
  late final GeneratedColumn<bool> supportsCPB = GeneratedColumn<bool>(
    'supports_c_p_b',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supports_c_p_b" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _supportsRedoMeta = const VerificationMeta(
    'supportsRedo',
  );
  @override
  late final GeneratedColumn<bool> supportsRedo = GeneratedColumn<bool>(
    'supports_redo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supports_redo" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _supportsEmergencyMeta = const VerificationMeta(
    'supportsEmergency',
  );
  @override
  late final GeneratedColumn<bool> supportsEmergency = GeneratedColumn<bool>(
    'supports_emergency',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supports_emergency" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _supportsTechnicalStepsMeta =
      const VerificationMeta('supportsTechnicalSteps');
  @override
  late final GeneratedColumn<bool> supportsTechnicalSteps =
      GeneratedColumn<bool>(
        'supports_technical_steps',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("supports_technical_steps" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _supportsAssociatedProceduresMeta =
      const VerificationMeta('supportsAssociatedProcedures');
  @override
  late final GeneratedColumn<bool> supportsAssociatedProcedures =
      GeneratedColumn<bool>(
        'supports_associated_procedures',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("supports_associated_procedures" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _dynamicFieldsMeta = const VerificationMeta(
    'dynamicFields',
  );
  @override
  late final GeneratedColumn<String> dynamicFields = GeneratedColumn<String>(
    'dynamic_fields',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _technicalStepsMeta = const VerificationMeta(
    'technicalSteps',
  );
  @override
  late final GeneratedColumn<String> technicalSteps = GeneratedColumn<String>(
    'technical_steps',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _associatedProceduresMeta =
      const VerificationMeta('associatedProcedures');
  @override
  late final GeneratedColumn<String> associatedProcedures =
      GeneratedColumn<String>(
        'associated_procedures',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
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
    shortName,
    category,
    specialty,
    parentId,
    nodeType,
    aliases,
    description,
    template,
    supportsCPB,
    supportsRedo,
    supportsEmergency,
    supportsTechnicalSteps,
    supportsAssociatedProcedures,
    dynamicFields,
    technicalSteps,
    associatedProcedures,
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
    if (data.containsKey('short_name')) {
      context.handle(
        _shortNameMeta,
        shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta),
      );
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
    if (data.containsKey('node_type')) {
      context.handle(
        _nodeTypeMeta,
        nodeType.isAcceptableOrUnknown(data['node_type']!, _nodeTypeMeta),
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
    if (data.containsKey('template')) {
      context.handle(
        _templateMeta,
        template.isAcceptableOrUnknown(data['template']!, _templateMeta),
      );
    }
    if (data.containsKey('supports_c_p_b')) {
      context.handle(
        _supportsCPBMeta,
        supportsCPB.isAcceptableOrUnknown(
          data['supports_c_p_b']!,
          _supportsCPBMeta,
        ),
      );
    }
    if (data.containsKey('supports_redo')) {
      context.handle(
        _supportsRedoMeta,
        supportsRedo.isAcceptableOrUnknown(
          data['supports_redo']!,
          _supportsRedoMeta,
        ),
      );
    }
    if (data.containsKey('supports_emergency')) {
      context.handle(
        _supportsEmergencyMeta,
        supportsEmergency.isAcceptableOrUnknown(
          data['supports_emergency']!,
          _supportsEmergencyMeta,
        ),
      );
    }
    if (data.containsKey('supports_technical_steps')) {
      context.handle(
        _supportsTechnicalStepsMeta,
        supportsTechnicalSteps.isAcceptableOrUnknown(
          data['supports_technical_steps']!,
          _supportsTechnicalStepsMeta,
        ),
      );
    }
    if (data.containsKey('supports_associated_procedures')) {
      context.handle(
        _supportsAssociatedProceduresMeta,
        supportsAssociatedProcedures.isAcceptableOrUnknown(
          data['supports_associated_procedures']!,
          _supportsAssociatedProceduresMeta,
        ),
      );
    }
    if (data.containsKey('dynamic_fields')) {
      context.handle(
        _dynamicFieldsMeta,
        dynamicFields.isAcceptableOrUnknown(
          data['dynamic_fields']!,
          _dynamicFieldsMeta,
        ),
      );
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
    if (data.containsKey('associated_procedures')) {
      context.handle(
        _associatedProceduresMeta,
        associatedProcedures.isAcceptableOrUnknown(
          data['associated_procedures']!,
          _associatedProceduresMeta,
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
      shortName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_name'],
      ),
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
      nodeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}node_type'],
      )!,
      aliases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aliases'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      template: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template'],
      ),
      supportsCPB: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_c_p_b'],
      )!,
      supportsRedo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_redo'],
      )!,
      supportsEmergency: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_emergency'],
      )!,
      supportsTechnicalSteps: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_technical_steps'],
      )!,
      supportsAssociatedProcedures: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_associated_procedures'],
      )!,
      dynamicFields: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dynamic_fields'],
      )!,
      technicalSteps: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}technical_steps'],
      )!,
      associatedProcedures: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}associated_procedures'],
      )!,
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
  final String? shortName;
  final String category;
  final String specialty;
  final int? parentId;
  final String nodeType;
  final String? aliases;
  final String? description;

  /// JSON template id
  final String? template;
  final bool supportsCPB;
  final bool supportsRedo;
  final bool supportsEmergency;
  final bool supportsTechnicalSteps;
  final bool supportsAssociatedProcedures;

  /// Stored as JSON arrays
  final String dynamicFields;
  final String technicalSteps;
  final String associatedProcedures;
  final bool isActive;
  final DateTime createdAt;
  const ProcedureData({
    required this.id,
    required this.procedureId,
    required this.name,
    this.shortName,
    required this.category,
    required this.specialty,
    this.parentId,
    required this.nodeType,
    this.aliases,
    this.description,
    this.template,
    required this.supportsCPB,
    required this.supportsRedo,
    required this.supportsEmergency,
    required this.supportsTechnicalSteps,
    required this.supportsAssociatedProcedures,
    required this.dynamicFields,
    required this.technicalSteps,
    required this.associatedProcedures,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['procedure_id'] = Variable<String>(procedureId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || shortName != null) {
      map['short_name'] = Variable<String>(shortName);
    }
    map['category'] = Variable<String>(category);
    map['specialty'] = Variable<String>(specialty);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['node_type'] = Variable<String>(nodeType);
    if (!nullToAbsent || aliases != null) {
      map['aliases'] = Variable<String>(aliases);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || template != null) {
      map['template'] = Variable<String>(template);
    }
    map['supports_c_p_b'] = Variable<bool>(supportsCPB);
    map['supports_redo'] = Variable<bool>(supportsRedo);
    map['supports_emergency'] = Variable<bool>(supportsEmergency);
    map['supports_technical_steps'] = Variable<bool>(supportsTechnicalSteps);
    map['supports_associated_procedures'] = Variable<bool>(
      supportsAssociatedProcedures,
    );
    map['dynamic_fields'] = Variable<String>(dynamicFields);
    map['technical_steps'] = Variable<String>(technicalSteps);
    map['associated_procedures'] = Variable<String>(associatedProcedures);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProceduresCompanion toCompanion(bool nullToAbsent) {
    return ProceduresCompanion(
      id: Value(id),
      procedureId: Value(procedureId),
      name: Value(name),
      shortName: shortName == null && nullToAbsent
          ? const Value.absent()
          : Value(shortName),
      category: Value(category),
      specialty: Value(specialty),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      nodeType: Value(nodeType),
      aliases: aliases == null && nullToAbsent
          ? const Value.absent()
          : Value(aliases),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      template: template == null && nullToAbsent
          ? const Value.absent()
          : Value(template),
      supportsCPB: Value(supportsCPB),
      supportsRedo: Value(supportsRedo),
      supportsEmergency: Value(supportsEmergency),
      supportsTechnicalSteps: Value(supportsTechnicalSteps),
      supportsAssociatedProcedures: Value(supportsAssociatedProcedures),
      dynamicFields: Value(dynamicFields),
      technicalSteps: Value(technicalSteps),
      associatedProcedures: Value(associatedProcedures),
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
      shortName: serializer.fromJson<String?>(json['shortName']),
      category: serializer.fromJson<String>(json['category']),
      specialty: serializer.fromJson<String>(json['specialty']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      nodeType: serializer.fromJson<String>(json['nodeType']),
      aliases: serializer.fromJson<String?>(json['aliases']),
      description: serializer.fromJson<String?>(json['description']),
      template: serializer.fromJson<String?>(json['template']),
      supportsCPB: serializer.fromJson<bool>(json['supportsCPB']),
      supportsRedo: serializer.fromJson<bool>(json['supportsRedo']),
      supportsEmergency: serializer.fromJson<bool>(json['supportsEmergency']),
      supportsTechnicalSteps: serializer.fromJson<bool>(
        json['supportsTechnicalSteps'],
      ),
      supportsAssociatedProcedures: serializer.fromJson<bool>(
        json['supportsAssociatedProcedures'],
      ),
      dynamicFields: serializer.fromJson<String>(json['dynamicFields']),
      technicalSteps: serializer.fromJson<String>(json['technicalSteps']),
      associatedProcedures: serializer.fromJson<String>(
        json['associatedProcedures'],
      ),
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
      'shortName': serializer.toJson<String?>(shortName),
      'category': serializer.toJson<String>(category),
      'specialty': serializer.toJson<String>(specialty),
      'parentId': serializer.toJson<int?>(parentId),
      'nodeType': serializer.toJson<String>(nodeType),
      'aliases': serializer.toJson<String?>(aliases),
      'description': serializer.toJson<String?>(description),
      'template': serializer.toJson<String?>(template),
      'supportsCPB': serializer.toJson<bool>(supportsCPB),
      'supportsRedo': serializer.toJson<bool>(supportsRedo),
      'supportsEmergency': serializer.toJson<bool>(supportsEmergency),
      'supportsTechnicalSteps': serializer.toJson<bool>(supportsTechnicalSteps),
      'supportsAssociatedProcedures': serializer.toJson<bool>(
        supportsAssociatedProcedures,
      ),
      'dynamicFields': serializer.toJson<String>(dynamicFields),
      'technicalSteps': serializer.toJson<String>(technicalSteps),
      'associatedProcedures': serializer.toJson<String>(associatedProcedures),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProcedureData copyWith({
    int? id,
    String? procedureId,
    String? name,
    Value<String?> shortName = const Value.absent(),
    String? category,
    String? specialty,
    Value<int?> parentId = const Value.absent(),
    String? nodeType,
    Value<String?> aliases = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> template = const Value.absent(),
    bool? supportsCPB,
    bool? supportsRedo,
    bool? supportsEmergency,
    bool? supportsTechnicalSteps,
    bool? supportsAssociatedProcedures,
    String? dynamicFields,
    String? technicalSteps,
    String? associatedProcedures,
    bool? isActive,
    DateTime? createdAt,
  }) => ProcedureData(
    id: id ?? this.id,
    procedureId: procedureId ?? this.procedureId,
    name: name ?? this.name,
    shortName: shortName.present ? shortName.value : this.shortName,
    category: category ?? this.category,
    specialty: specialty ?? this.specialty,
    parentId: parentId.present ? parentId.value : this.parentId,
    nodeType: nodeType ?? this.nodeType,
    aliases: aliases.present ? aliases.value : this.aliases,
    description: description.present ? description.value : this.description,
    template: template.present ? template.value : this.template,
    supportsCPB: supportsCPB ?? this.supportsCPB,
    supportsRedo: supportsRedo ?? this.supportsRedo,
    supportsEmergency: supportsEmergency ?? this.supportsEmergency,
    supportsTechnicalSteps:
        supportsTechnicalSteps ?? this.supportsTechnicalSteps,
    supportsAssociatedProcedures:
        supportsAssociatedProcedures ?? this.supportsAssociatedProcedures,
    dynamicFields: dynamicFields ?? this.dynamicFields,
    technicalSteps: technicalSteps ?? this.technicalSteps,
    associatedProcedures: associatedProcedures ?? this.associatedProcedures,
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
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
      category: data.category.present ? data.category.value : this.category,
      specialty: data.specialty.present ? data.specialty.value : this.specialty,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      nodeType: data.nodeType.present ? data.nodeType.value : this.nodeType,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      description: data.description.present
          ? data.description.value
          : this.description,
      template: data.template.present ? data.template.value : this.template,
      supportsCPB: data.supportsCPB.present
          ? data.supportsCPB.value
          : this.supportsCPB,
      supportsRedo: data.supportsRedo.present
          ? data.supportsRedo.value
          : this.supportsRedo,
      supportsEmergency: data.supportsEmergency.present
          ? data.supportsEmergency.value
          : this.supportsEmergency,
      supportsTechnicalSteps: data.supportsTechnicalSteps.present
          ? data.supportsTechnicalSteps.value
          : this.supportsTechnicalSteps,
      supportsAssociatedProcedures: data.supportsAssociatedProcedures.present
          ? data.supportsAssociatedProcedures.value
          : this.supportsAssociatedProcedures,
      dynamicFields: data.dynamicFields.present
          ? data.dynamicFields.value
          : this.dynamicFields,
      technicalSteps: data.technicalSteps.present
          ? data.technicalSteps.value
          : this.technicalSteps,
      associatedProcedures: data.associatedProcedures.present
          ? data.associatedProcedures.value
          : this.associatedProcedures,
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
          ..write('shortName: $shortName, ')
          ..write('category: $category, ')
          ..write('specialty: $specialty, ')
          ..write('parentId: $parentId, ')
          ..write('nodeType: $nodeType, ')
          ..write('aliases: $aliases, ')
          ..write('description: $description, ')
          ..write('template: $template, ')
          ..write('supportsCPB: $supportsCPB, ')
          ..write('supportsRedo: $supportsRedo, ')
          ..write('supportsEmergency: $supportsEmergency, ')
          ..write('supportsTechnicalSteps: $supportsTechnicalSteps, ')
          ..write(
            'supportsAssociatedProcedures: $supportsAssociatedProcedures, ',
          )
          ..write('dynamicFields: $dynamicFields, ')
          ..write('technicalSteps: $technicalSteps, ')
          ..write('associatedProcedures: $associatedProcedures, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    procedureId,
    name,
    shortName,
    category,
    specialty,
    parentId,
    nodeType,
    aliases,
    description,
    template,
    supportsCPB,
    supportsRedo,
    supportsEmergency,
    supportsTechnicalSteps,
    supportsAssociatedProcedures,
    dynamicFields,
    technicalSteps,
    associatedProcedures,
    isActive,
    createdAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcedureData &&
          other.id == this.id &&
          other.procedureId == this.procedureId &&
          other.name == this.name &&
          other.shortName == this.shortName &&
          other.category == this.category &&
          other.specialty == this.specialty &&
          other.parentId == this.parentId &&
          other.nodeType == this.nodeType &&
          other.aliases == this.aliases &&
          other.description == this.description &&
          other.template == this.template &&
          other.supportsCPB == this.supportsCPB &&
          other.supportsRedo == this.supportsRedo &&
          other.supportsEmergency == this.supportsEmergency &&
          other.supportsTechnicalSteps == this.supportsTechnicalSteps &&
          other.supportsAssociatedProcedures ==
              this.supportsAssociatedProcedures &&
          other.dynamicFields == this.dynamicFields &&
          other.technicalSteps == this.technicalSteps &&
          other.associatedProcedures == this.associatedProcedures &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class ProceduresCompanion extends UpdateCompanion<ProcedureData> {
  final Value<int> id;
  final Value<String> procedureId;
  final Value<String> name;
  final Value<String?> shortName;
  final Value<String> category;
  final Value<String> specialty;
  final Value<int?> parentId;
  final Value<String> nodeType;
  final Value<String?> aliases;
  final Value<String?> description;
  final Value<String?> template;
  final Value<bool> supportsCPB;
  final Value<bool> supportsRedo;
  final Value<bool> supportsEmergency;
  final Value<bool> supportsTechnicalSteps;
  final Value<bool> supportsAssociatedProcedures;
  final Value<String> dynamicFields;
  final Value<String> technicalSteps;
  final Value<String> associatedProcedures;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const ProceduresCompanion({
    this.id = const Value.absent(),
    this.procedureId = const Value.absent(),
    this.name = const Value.absent(),
    this.shortName = const Value.absent(),
    this.category = const Value.absent(),
    this.specialty = const Value.absent(),
    this.parentId = const Value.absent(),
    this.nodeType = const Value.absent(),
    this.aliases = const Value.absent(),
    this.description = const Value.absent(),
    this.template = const Value.absent(),
    this.supportsCPB = const Value.absent(),
    this.supportsRedo = const Value.absent(),
    this.supportsEmergency = const Value.absent(),
    this.supportsTechnicalSteps = const Value.absent(),
    this.supportsAssociatedProcedures = const Value.absent(),
    this.dynamicFields = const Value.absent(),
    this.technicalSteps = const Value.absent(),
    this.associatedProcedures = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProceduresCompanion.insert({
    this.id = const Value.absent(),
    required String procedureId,
    required String name,
    this.shortName = const Value.absent(),
    required String category,
    this.specialty = const Value.absent(),
    this.parentId = const Value.absent(),
    this.nodeType = const Value.absent(),
    this.aliases = const Value.absent(),
    this.description = const Value.absent(),
    this.template = const Value.absent(),
    this.supportsCPB = const Value.absent(),
    this.supportsRedo = const Value.absent(),
    this.supportsEmergency = const Value.absent(),
    this.supportsTechnicalSteps = const Value.absent(),
    this.supportsAssociatedProcedures = const Value.absent(),
    this.dynamicFields = const Value.absent(),
    this.technicalSteps = const Value.absent(),
    this.associatedProcedures = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : procedureId = Value(procedureId),
       name = Value(name),
       category = Value(category);
  static Insertable<ProcedureData> custom({
    Expression<int>? id,
    Expression<String>? procedureId,
    Expression<String>? name,
    Expression<String>? shortName,
    Expression<String>? category,
    Expression<String>? specialty,
    Expression<int>? parentId,
    Expression<String>? nodeType,
    Expression<String>? aliases,
    Expression<String>? description,
    Expression<String>? template,
    Expression<bool>? supportsCPB,
    Expression<bool>? supportsRedo,
    Expression<bool>? supportsEmergency,
    Expression<bool>? supportsTechnicalSteps,
    Expression<bool>? supportsAssociatedProcedures,
    Expression<String>? dynamicFields,
    Expression<String>? technicalSteps,
    Expression<String>? associatedProcedures,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (procedureId != null) 'procedure_id': procedureId,
      if (name != null) 'name': name,
      if (shortName != null) 'short_name': shortName,
      if (category != null) 'category': category,
      if (specialty != null) 'specialty': specialty,
      if (parentId != null) 'parent_id': parentId,
      if (nodeType != null) 'node_type': nodeType,
      if (aliases != null) 'aliases': aliases,
      if (description != null) 'description': description,
      if (template != null) 'template': template,
      if (supportsCPB != null) 'supports_c_p_b': supportsCPB,
      if (supportsRedo != null) 'supports_redo': supportsRedo,
      if (supportsEmergency != null) 'supports_emergency': supportsEmergency,
      if (supportsTechnicalSteps != null)
        'supports_technical_steps': supportsTechnicalSteps,
      if (supportsAssociatedProcedures != null)
        'supports_associated_procedures': supportsAssociatedProcedures,
      if (dynamicFields != null) 'dynamic_fields': dynamicFields,
      if (technicalSteps != null) 'technical_steps': technicalSteps,
      if (associatedProcedures != null)
        'associated_procedures': associatedProcedures,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProceduresCompanion copyWith({
    Value<int>? id,
    Value<String>? procedureId,
    Value<String>? name,
    Value<String?>? shortName,
    Value<String>? category,
    Value<String>? specialty,
    Value<int?>? parentId,
    Value<String>? nodeType,
    Value<String?>? aliases,
    Value<String?>? description,
    Value<String?>? template,
    Value<bool>? supportsCPB,
    Value<bool>? supportsRedo,
    Value<bool>? supportsEmergency,
    Value<bool>? supportsTechnicalSteps,
    Value<bool>? supportsAssociatedProcedures,
    Value<String>? dynamicFields,
    Value<String>? technicalSteps,
    Value<String>? associatedProcedures,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return ProceduresCompanion(
      id: id ?? this.id,
      procedureId: procedureId ?? this.procedureId,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      category: category ?? this.category,
      specialty: specialty ?? this.specialty,
      parentId: parentId ?? this.parentId,
      nodeType: nodeType ?? this.nodeType,
      aliases: aliases ?? this.aliases,
      description: description ?? this.description,
      template: template ?? this.template,
      supportsCPB: supportsCPB ?? this.supportsCPB,
      supportsRedo: supportsRedo ?? this.supportsRedo,
      supportsEmergency: supportsEmergency ?? this.supportsEmergency,
      supportsTechnicalSteps:
          supportsTechnicalSteps ?? this.supportsTechnicalSteps,
      supportsAssociatedProcedures:
          supportsAssociatedProcedures ?? this.supportsAssociatedProcedures,
      dynamicFields: dynamicFields ?? this.dynamicFields,
      technicalSteps: technicalSteps ?? this.technicalSteps,
      associatedProcedures: associatedProcedures ?? this.associatedProcedures,
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
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
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
    if (nodeType.present) {
      map['node_type'] = Variable<String>(nodeType.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (template.present) {
      map['template'] = Variable<String>(template.value);
    }
    if (supportsCPB.present) {
      map['supports_c_p_b'] = Variable<bool>(supportsCPB.value);
    }
    if (supportsRedo.present) {
      map['supports_redo'] = Variable<bool>(supportsRedo.value);
    }
    if (supportsEmergency.present) {
      map['supports_emergency'] = Variable<bool>(supportsEmergency.value);
    }
    if (supportsTechnicalSteps.present) {
      map['supports_technical_steps'] = Variable<bool>(
        supportsTechnicalSteps.value,
      );
    }
    if (supportsAssociatedProcedures.present) {
      map['supports_associated_procedures'] = Variable<bool>(
        supportsAssociatedProcedures.value,
      );
    }
    if (dynamicFields.present) {
      map['dynamic_fields'] = Variable<String>(dynamicFields.value);
    }
    if (technicalSteps.present) {
      map['technical_steps'] = Variable<String>(technicalSteps.value);
    }
    if (associatedProcedures.present) {
      map['associated_procedures'] = Variable<String>(
        associatedProcedures.value,
      );
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
          ..write('shortName: $shortName, ')
          ..write('category: $category, ')
          ..write('specialty: $specialty, ')
          ..write('parentId: $parentId, ')
          ..write('nodeType: $nodeType, ')
          ..write('aliases: $aliases, ')
          ..write('description: $description, ')
          ..write('template: $template, ')
          ..write('supportsCPB: $supportsCPB, ')
          ..write('supportsRedo: $supportsRedo, ')
          ..write('supportsEmergency: $supportsEmergency, ')
          ..write('supportsTechnicalSteps: $supportsTechnicalSteps, ')
          ..write(
            'supportsAssociatedProcedures: $supportsAssociatedProcedures, ',
          )
          ..write('dynamicFields: $dynamicFields, ')
          ..write('technicalSteps: $technicalSteps, ')
          ..write('associatedProcedures: $associatedProcedures, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SurgicalCasesTable extends SurgicalCases
    with TableInfo<$SurgicalCasesTable, SurgicalCaseData> {
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
  static const VerificationMeta _approachMeta = const VerificationMeta(
    'approach',
  );
  @override
  late final GeneratedColumn<String> approach = GeneratedColumn<String>(
    'approach',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caseTypeMeta = const VerificationMeta(
    'caseType',
  );
  @override
  late final GeneratedColumn<String> caseType = GeneratedColumn<String>(
    'case_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _complexityMeta = const VerificationMeta(
    'complexity',
  );
  @override
  late final GeneratedColumn<String> complexity = GeneratedColumn<String>(
    'complexity',
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
    approach,
    caseType,
    complexity,
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
    Insertable<SurgicalCaseData> instance, {
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
    if (data.containsKey('approach')) {
      context.handle(
        _approachMeta,
        approach.isAcceptableOrUnknown(data['approach']!, _approachMeta),
      );
    }
    if (data.containsKey('case_type')) {
      context.handle(
        _caseTypeMeta,
        caseType.isAcceptableOrUnknown(data['case_type']!, _caseTypeMeta),
      );
    }
    if (data.containsKey('complexity')) {
      context.handle(
        _complexityMeta,
        complexity.isAcceptableOrUnknown(data['complexity']!, _complexityMeta),
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
  SurgicalCaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurgicalCaseData(
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
      approach: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}approach'],
      ),
      caseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_type'],
      ),
      complexity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}complexity'],
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

class SurgicalCaseData extends DataClass
    implements Insertable<SurgicalCaseData> {
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
  final String? approach;
  final String? caseType;
  final String? complexity;

  /// Personal operative role
  ///
  /// Allowed values:
  /// observed
  /// assisted
  /// performed_under_supervision
  /// performed_independently
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
  const SurgicalCaseData({
    required this.id,
    required this.caseId,
    required this.patientId,
    required this.surgeryDate,
    required this.diagnosis,
    required this.urgency,
    required this.surgeryType,
    required this.specialty,
    this.surgicalApproach,
    this.approach,
    this.caseType,
    this.complexity,
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
    if (!nullToAbsent || approach != null) {
      map['approach'] = Variable<String>(approach);
    }
    if (!nullToAbsent || caseType != null) {
      map['case_type'] = Variable<String>(caseType);
    }
    if (!nullToAbsent || complexity != null) {
      map['complexity'] = Variable<String>(complexity);
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
      approach: approach == null && nullToAbsent
          ? const Value.absent()
          : Value(approach),
      caseType: caseType == null && nullToAbsent
          ? const Value.absent()
          : Value(caseType),
      complexity: complexity == null && nullToAbsent
          ? const Value.absent()
          : Value(complexity),
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

  factory SurgicalCaseData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurgicalCaseData(
      id: serializer.fromJson<int>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      patientId: serializer.fromJson<int>(json['patientId']),
      surgeryDate: serializer.fromJson<DateTime>(json['surgeryDate']),
      diagnosis: serializer.fromJson<String>(json['diagnosis']),
      urgency: serializer.fromJson<String>(json['urgency']),
      surgeryType: serializer.fromJson<String>(json['surgeryType']),
      specialty: serializer.fromJson<String>(json['specialty']),
      surgicalApproach: serializer.fromJson<String?>(json['surgicalApproach']),
      approach: serializer.fromJson<String?>(json['approach']),
      caseType: serializer.fromJson<String?>(json['caseType']),
      complexity: serializer.fromJson<String?>(json['complexity']),
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
      'approach': serializer.toJson<String?>(approach),
      'caseType': serializer.toJson<String?>(caseType),
      'complexity': serializer.toJson<String?>(complexity),
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

  SurgicalCaseData copyWith({
    int? id,
    String? caseId,
    int? patientId,
    DateTime? surgeryDate,
    String? diagnosis,
    String? urgency,
    String? surgeryType,
    String? specialty,
    Value<String?> surgicalApproach = const Value.absent(),
    Value<String?> approach = const Value.absent(),
    Value<String?> caseType = const Value.absent(),
    Value<String?> complexity = const Value.absent(),
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
  }) => SurgicalCaseData(
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
    approach: approach.present ? approach.value : this.approach,
    caseType: caseType.present ? caseType.value : this.caseType,
    complexity: complexity.present ? complexity.value : this.complexity,
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
  SurgicalCaseData copyWithCompanion(SurgicalCasesCompanion data) {
    return SurgicalCaseData(
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
      approach: data.approach.present ? data.approach.value : this.approach,
      caseType: data.caseType.present ? data.caseType.value : this.caseType,
      complexity: data.complexity.present
          ? data.complexity.value
          : this.complexity,
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
    return (StringBuffer('SurgicalCaseData(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('patientId: $patientId, ')
          ..write('surgeryDate: $surgeryDate, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('urgency: $urgency, ')
          ..write('surgeryType: $surgeryType, ')
          ..write('specialty: $specialty, ')
          ..write('surgicalApproach: $surgicalApproach, ')
          ..write('approach: $approach, ')
          ..write('caseType: $caseType, ')
          ..write('complexity: $complexity, ')
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
  int get hashCode => Object.hashAll([
    id,
    caseId,
    patientId,
    surgeryDate,
    diagnosis,
    urgency,
    surgeryType,
    specialty,
    surgicalApproach,
    approach,
    caseType,
    complexity,
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
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurgicalCaseData &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.patientId == this.patientId &&
          other.surgeryDate == this.surgeryDate &&
          other.diagnosis == this.diagnosis &&
          other.urgency == this.urgency &&
          other.surgeryType == this.surgeryType &&
          other.specialty == this.specialty &&
          other.surgicalApproach == this.surgicalApproach &&
          other.approach == this.approach &&
          other.caseType == this.caseType &&
          other.complexity == this.complexity &&
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

class SurgicalCasesCompanion extends UpdateCompanion<SurgicalCaseData> {
  final Value<int> id;
  final Value<String> caseId;
  final Value<int> patientId;
  final Value<DateTime> surgeryDate;
  final Value<String> diagnosis;
  final Value<String> urgency;
  final Value<String> surgeryType;
  final Value<String> specialty;
  final Value<String?> surgicalApproach;
  final Value<String?> approach;
  final Value<String?> caseType;
  final Value<String?> complexity;
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
    this.approach = const Value.absent(),
    this.caseType = const Value.absent(),
    this.complexity = const Value.absent(),
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
    this.approach = const Value.absent(),
    this.caseType = const Value.absent(),
    this.complexity = const Value.absent(),
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
  static Insertable<SurgicalCaseData> custom({
    Expression<int>? id,
    Expression<String>? caseId,
    Expression<int>? patientId,
    Expression<DateTime>? surgeryDate,
    Expression<String>? diagnosis,
    Expression<String>? urgency,
    Expression<String>? surgeryType,
    Expression<String>? specialty,
    Expression<String>? surgicalApproach,
    Expression<String>? approach,
    Expression<String>? caseType,
    Expression<String>? complexity,
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
      if (approach != null) 'approach': approach,
      if (caseType != null) 'case_type': caseType,
      if (complexity != null) 'complexity': complexity,
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
    Value<String?>? approach,
    Value<String?>? caseType,
    Value<String?>? complexity,
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
      approach: approach ?? this.approach,
      caseType: caseType ?? this.caseType,
      complexity: complexity ?? this.complexity,
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
    if (approach.present) {
      map['approach'] = Variable<String>(approach.value);
    }
    if (caseType.present) {
      map['case_type'] = Variable<String>(caseType.value);
    }
    if (complexity.present) {
      map['complexity'] = Variable<String>(complexity.value);
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
          ..write('approach: $approach, ')
          ..write('caseType: $caseType, ')
          ..write('complexity: $complexity, ')
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
    with TableInfo<$CaseProceduresTable, CaseProcedureData> {
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
    caseId,
    procedureId,
    type,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_procedures';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseProcedureData> instance, {
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
  CaseProcedureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseProcedureData(
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CaseProceduresTable createAlias(String alias) {
    return $CaseProceduresTable(attachedDatabase, alias);
  }
}

class CaseProcedureData extends DataClass
    implements Insertable<CaseProcedureData> {
  final int id;
  final int caseId;
  final int procedureId;
  final String type;
  final DateTime createdAt;
  const CaseProcedureData({
    required this.id,
    required this.caseId,
    required this.procedureId,
    required this.type,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['case_id'] = Variable<int>(caseId);
    map['procedure_id'] = Variable<int>(procedureId);
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CaseProceduresCompanion toCompanion(bool nullToAbsent) {
    return CaseProceduresCompanion(
      id: Value(id),
      caseId: Value(caseId),
      procedureId: Value(procedureId),
      type: Value(type),
      createdAt: Value(createdAt),
    );
  }

  factory CaseProcedureData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseProcedureData(
      id: serializer.fromJson<int>(json['id']),
      caseId: serializer.fromJson<int>(json['caseId']),
      procedureId: serializer.fromJson<int>(json['procedureId']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
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
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CaseProcedureData copyWith({
    int? id,
    int? caseId,
    int? procedureId,
    String? type,
    DateTime? createdAt,
  }) => CaseProcedureData(
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    procedureId: procedureId ?? this.procedureId,
    type: type ?? this.type,
    createdAt: createdAt ?? this.createdAt,
  );
  CaseProcedureData copyWithCompanion(CaseProceduresCompanion data) {
    return CaseProcedureData(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      procedureId: data.procedureId.present
          ? data.procedureId.value
          : this.procedureId,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseProcedureData(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('procedureId: $procedureId, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, caseId, procedureId, type, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseProcedureData &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.procedureId == this.procedureId &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class CaseProceduresCompanion extends UpdateCompanion<CaseProcedureData> {
  final Value<int> id;
  final Value<int> caseId;
  final Value<int> procedureId;
  final Value<String> type;
  final Value<DateTime> createdAt;
  const CaseProceduresCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.procedureId = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CaseProceduresCompanion.insert({
    this.id = const Value.absent(),
    required int caseId,
    required int procedureId,
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : caseId = Value(caseId),
       procedureId = Value(procedureId);
  static Insertable<CaseProcedureData> custom({
    Expression<int>? id,
    Expression<int>? caseId,
    Expression<int>? procedureId,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (procedureId != null) 'procedure_id': procedureId,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CaseProceduresCompanion copyWith({
    Value<int>? id,
    Value<int>? caseId,
    Value<int>? procedureId,
    Value<String>? type,
    Value<DateTime>? createdAt,
  }) {
    return CaseProceduresCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      procedureId: procedureId ?? this.procedureId,
      type: type ?? this.type,
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
    if (procedureId.present) {
      map['procedure_id'] = Variable<int>(procedureId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseProceduresCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('procedureId: $procedureId, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
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

class $ProcedureStepsTable extends ProcedureSteps
    with TableInfo<$ProcedureStepsTable, ProcedureStepData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcedureStepsTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> procedureId = GeneratedColumn<int>(
    'procedure_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepIdMeta = const VerificationMeta('stepId');
  @override
  late final GeneratedColumn<String> stepId = GeneratedColumn<String>(
    'step_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepNameMeta = const VerificationMeta(
    'stepName',
  );
  @override
  late final GeneratedColumn<String> stepName = GeneratedColumn<String>(
    'step_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    procedureId,
    stepId,
    stepName,
    orderIndex,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procedure_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProcedureStepData> instance, {
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
    if (data.containsKey('step_id')) {
      context.handle(
        _stepIdMeta,
        stepId.isAcceptableOrUnknown(data['step_id']!, _stepIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stepIdMeta);
    }
    if (data.containsKey('step_name')) {
      context.handle(
        _stepNameMeta,
        stepName.isAcceptableOrUnknown(data['step_name']!, _stepNameMeta),
      );
    } else if (isInserting) {
      context.missing(_stepNameMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
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
  ProcedureStepData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcedureStepData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      procedureId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}procedure_id'],
      )!,
      stepId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_id'],
      )!,
      stepName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_name'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProcedureStepsTable createAlias(String alias) {
    return $ProcedureStepsTable(attachedDatabase, alias);
  }
}

class ProcedureStepData extends DataClass
    implements Insertable<ProcedureStepData> {
  final int id;
  final int procedureId;

  /// Stable identifier from JSON library
  /// Example:
  /// DISTAL_ANASTOMOSIS
  final String stepId;
  final String stepName;
  final int orderIndex;
  final DateTime createdAt;
  const ProcedureStepData({
    required this.id,
    required this.procedureId,
    required this.stepId,
    required this.stepName,
    required this.orderIndex,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['procedure_id'] = Variable<int>(procedureId);
    map['step_id'] = Variable<String>(stepId);
    map['step_name'] = Variable<String>(stepName);
    map['order_index'] = Variable<int>(orderIndex);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProcedureStepsCompanion toCompanion(bool nullToAbsent) {
    return ProcedureStepsCompanion(
      id: Value(id),
      procedureId: Value(procedureId),
      stepId: Value(stepId),
      stepName: Value(stepName),
      orderIndex: Value(orderIndex),
      createdAt: Value(createdAt),
    );
  }

  factory ProcedureStepData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProcedureStepData(
      id: serializer.fromJson<int>(json['id']),
      procedureId: serializer.fromJson<int>(json['procedureId']),
      stepId: serializer.fromJson<String>(json['stepId']),
      stepName: serializer.fromJson<String>(json['stepName']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'procedureId': serializer.toJson<int>(procedureId),
      'stepId': serializer.toJson<String>(stepId),
      'stepName': serializer.toJson<String>(stepName),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProcedureStepData copyWith({
    int? id,
    int? procedureId,
    String? stepId,
    String? stepName,
    int? orderIndex,
    DateTime? createdAt,
  }) => ProcedureStepData(
    id: id ?? this.id,
    procedureId: procedureId ?? this.procedureId,
    stepId: stepId ?? this.stepId,
    stepName: stepName ?? this.stepName,
    orderIndex: orderIndex ?? this.orderIndex,
    createdAt: createdAt ?? this.createdAt,
  );
  ProcedureStepData copyWithCompanion(ProcedureStepsCompanion data) {
    return ProcedureStepData(
      id: data.id.present ? data.id.value : this.id,
      procedureId: data.procedureId.present
          ? data.procedureId.value
          : this.procedureId,
      stepId: data.stepId.present ? data.stepId.value : this.stepId,
      stepName: data.stepName.present ? data.stepName.value : this.stepName,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureStepData(')
          ..write('id: $id, ')
          ..write('procedureId: $procedureId, ')
          ..write('stepId: $stepId, ')
          ..write('stepName: $stepName, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, procedureId, stepId, stepName, orderIndex, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcedureStepData &&
          other.id == this.id &&
          other.procedureId == this.procedureId &&
          other.stepId == this.stepId &&
          other.stepName == this.stepName &&
          other.orderIndex == this.orderIndex &&
          other.createdAt == this.createdAt);
}

class ProcedureStepsCompanion extends UpdateCompanion<ProcedureStepData> {
  final Value<int> id;
  final Value<int> procedureId;
  final Value<String> stepId;
  final Value<String> stepName;
  final Value<int> orderIndex;
  final Value<DateTime> createdAt;
  const ProcedureStepsCompanion({
    this.id = const Value.absent(),
    this.procedureId = const Value.absent(),
    this.stepId = const Value.absent(),
    this.stepName = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProcedureStepsCompanion.insert({
    this.id = const Value.absent(),
    required int procedureId,
    required String stepId,
    required String stepName,
    required int orderIndex,
    this.createdAt = const Value.absent(),
  }) : procedureId = Value(procedureId),
       stepId = Value(stepId),
       stepName = Value(stepName),
       orderIndex = Value(orderIndex);
  static Insertable<ProcedureStepData> custom({
    Expression<int>? id,
    Expression<int>? procedureId,
    Expression<String>? stepId,
    Expression<String>? stepName,
    Expression<int>? orderIndex,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (procedureId != null) 'procedure_id': procedureId,
      if (stepId != null) 'step_id': stepId,
      if (stepName != null) 'step_name': stepName,
      if (orderIndex != null) 'order_index': orderIndex,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProcedureStepsCompanion copyWith({
    Value<int>? id,
    Value<int>? procedureId,
    Value<String>? stepId,
    Value<String>? stepName,
    Value<int>? orderIndex,
    Value<DateTime>? createdAt,
  }) {
    return ProcedureStepsCompanion(
      id: id ?? this.id,
      procedureId: procedureId ?? this.procedureId,
      stepId: stepId ?? this.stepId,
      stepName: stepName ?? this.stepName,
      orderIndex: orderIndex ?? this.orderIndex,
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
      map['procedure_id'] = Variable<int>(procedureId.value);
    }
    if (stepId.present) {
      map['step_id'] = Variable<String>(stepId.value);
    }
    if (stepName.present) {
      map['step_name'] = Variable<String>(stepName.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureStepsCompanion(')
          ..write('id: $id, ')
          ..write('procedureId: $procedureId, ')
          ..write('stepId: $stepId, ')
          ..write('stepName: $stepName, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CaseProcedureStepsTable extends CaseProcedureSteps
    with TableInfo<$CaseProcedureStepsTable, CaseProcedureStepData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseProcedureStepsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _caseProcedureIdMeta = const VerificationMeta(
    'caseProcedureId',
  );
  @override
  late final GeneratedColumn<int> caseProcedureId = GeneratedColumn<int>(
    'case_procedure_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _procedureStepIdMeta = const VerificationMeta(
    'procedureStepId',
  );
  @override
  late final GeneratedColumn<int> procedureStepId = GeneratedColumn<int>(
    'procedure_step_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    caseProcedureId,
    procedureStepId,
    role,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_procedure_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseProcedureStepData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('case_procedure_id')) {
      context.handle(
        _caseProcedureIdMeta,
        caseProcedureId.isAcceptableOrUnknown(
          data['case_procedure_id']!,
          _caseProcedureIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_caseProcedureIdMeta);
    }
    if (data.containsKey('procedure_step_id')) {
      context.handle(
        _procedureStepIdMeta,
        procedureStepId.isAcceptableOrUnknown(
          data['procedure_step_id']!,
          _procedureStepIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_procedureStepIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseProcedureStepData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseProcedureStepData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      caseProcedureId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}case_procedure_id'],
      )!,
      procedureStepId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}procedure_step_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CaseProcedureStepsTable createAlias(String alias) {
    return $CaseProcedureStepsTable(attachedDatabase, alias);
  }
}

class CaseProcedureStepData extends DataClass
    implements Insertable<CaseProcedureStepData> {
  final int id;
  final int caseProcedureId;
  final int procedureStepId;

  /// Personal technical step exposure role
  ///
  /// Allowed values:
  /// observed
  /// assisted
  /// performed_under_supervision
  /// performed_independently
  final String role;
  final String? notes;
  final DateTime createdAt;
  const CaseProcedureStepData({
    required this.id,
    required this.caseProcedureId,
    required this.procedureStepId,
    required this.role,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['case_procedure_id'] = Variable<int>(caseProcedureId);
    map['procedure_step_id'] = Variable<int>(procedureStepId);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CaseProcedureStepsCompanion toCompanion(bool nullToAbsent) {
    return CaseProcedureStepsCompanion(
      id: Value(id),
      caseProcedureId: Value(caseProcedureId),
      procedureStepId: Value(procedureStepId),
      role: Value(role),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory CaseProcedureStepData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseProcedureStepData(
      id: serializer.fromJson<int>(json['id']),
      caseProcedureId: serializer.fromJson<int>(json['caseProcedureId']),
      procedureStepId: serializer.fromJson<int>(json['procedureStepId']),
      role: serializer.fromJson<String>(json['role']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'caseProcedureId': serializer.toJson<int>(caseProcedureId),
      'procedureStepId': serializer.toJson<int>(procedureStepId),
      'role': serializer.toJson<String>(role),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CaseProcedureStepData copyWith({
    int? id,
    int? caseProcedureId,
    int? procedureStepId,
    String? role,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => CaseProcedureStepData(
    id: id ?? this.id,
    caseProcedureId: caseProcedureId ?? this.caseProcedureId,
    procedureStepId: procedureStepId ?? this.procedureStepId,
    role: role ?? this.role,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  CaseProcedureStepData copyWithCompanion(CaseProcedureStepsCompanion data) {
    return CaseProcedureStepData(
      id: data.id.present ? data.id.value : this.id,
      caseProcedureId: data.caseProcedureId.present
          ? data.caseProcedureId.value
          : this.caseProcedureId,
      procedureStepId: data.procedureStepId.present
          ? data.procedureStepId.value
          : this.procedureStepId,
      role: data.role.present ? data.role.value : this.role,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseProcedureStepData(')
          ..write('id: $id, ')
          ..write('caseProcedureId: $caseProcedureId, ')
          ..write('procedureStepId: $procedureStepId, ')
          ..write('role: $role, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, caseProcedureId, procedureStepId, role, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseProcedureStepData &&
          other.id == this.id &&
          other.caseProcedureId == this.caseProcedureId &&
          other.procedureStepId == this.procedureStepId &&
          other.role == this.role &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class CaseProcedureStepsCompanion
    extends UpdateCompanion<CaseProcedureStepData> {
  final Value<int> id;
  final Value<int> caseProcedureId;
  final Value<int> procedureStepId;
  final Value<String> role;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const CaseProcedureStepsCompanion({
    this.id = const Value.absent(),
    this.caseProcedureId = const Value.absent(),
    this.procedureStepId = const Value.absent(),
    this.role = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CaseProcedureStepsCompanion.insert({
    this.id = const Value.absent(),
    required int caseProcedureId,
    required int procedureStepId,
    required String role,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : caseProcedureId = Value(caseProcedureId),
       procedureStepId = Value(procedureStepId),
       role = Value(role);
  static Insertable<CaseProcedureStepData> custom({
    Expression<int>? id,
    Expression<int>? caseProcedureId,
    Expression<int>? procedureStepId,
    Expression<String>? role,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseProcedureId != null) 'case_procedure_id': caseProcedureId,
      if (procedureStepId != null) 'procedure_step_id': procedureStepId,
      if (role != null) 'role': role,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CaseProcedureStepsCompanion copyWith({
    Value<int>? id,
    Value<int>? caseProcedureId,
    Value<int>? procedureStepId,
    Value<String>? role,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return CaseProcedureStepsCompanion(
      id: id ?? this.id,
      caseProcedureId: caseProcedureId ?? this.caseProcedureId,
      procedureStepId: procedureStepId ?? this.procedureStepId,
      role: role ?? this.role,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (caseProcedureId.present) {
      map['case_procedure_id'] = Variable<int>(caseProcedureId.value);
    }
    if (procedureStepId.present) {
      map['procedure_step_id'] = Variable<int>(procedureStepId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseProcedureStepsCompanion(')
          ..write('id: $id, ')
          ..write('caseProcedureId: $caseProcedureId, ')
          ..write('procedureStepId: $procedureStepId, ')
          ..write('role: $role, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SurgeonProfileTable extends SurgeonProfile
    with TableInfo<$SurgeonProfileTable, SurgeonProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurgeonProfileTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profilePhotoPathMeta = const VerificationMeta(
    'profilePhotoPath',
  );
  @override
  late final GeneratedColumn<String> profilePhotoPath = GeneratedColumn<String>(
    'profile_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qualificationMeta = const VerificationMeta(
    'qualification',
  );
  @override
  late final GeneratedColumn<String> qualification = GeneratedColumn<String>(
    'qualification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specialtyMeta = const VerificationMeta(
    'specialty',
  );
  @override
  late final GeneratedColumn<String> specialty = GeneratedColumn<String>(
    'specialty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _institutionMeta = const VerificationMeta(
    'institution',
  );
  @override
  late final GeneratedColumn<String> institution = GeneratedColumn<String>(
    'institution',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainingYearMeta = const VerificationMeta(
    'trainingYear',
  );
  @override
  late final GeneratedColumn<String> trainingYear = GeneratedColumn<String>(
    'training_year',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _residencyStartDateMeta =
      const VerificationMeta('residencyStartDate');
  @override
  late final GeneratedColumn<DateTime> residencyStartDate =
      GeneratedColumn<DateTime>(
        'residency_start_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _residencyEndDateMeta = const VerificationMeta(
    'residencyEndDate',
  );
  @override
  late final GeneratedColumn<DateTime> residencyEndDate =
      GeneratedColumn<DateTime>(
        'residency_end_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _registrationNumberMeta =
      const VerificationMeta('registrationNumber');
  @override
  late final GeneratedColumn<String> registrationNumber =
      GeneratedColumn<String>(
        'registration_number',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _membershipsMeta = const VerificationMeta(
    'memberships',
  );
  @override
  late final GeneratedColumn<String> memberships = GeneratedColumn<String>(
    'memberships',
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
    name,
    email,
    phone,
    profilePhotoPath,
    qualification,
    specialty,
    department,
    institution,
    trainingYear,
    residencyStartDate,
    residencyEndDate,
    registrationNumber,
    memberships,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surgeon_profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<SurgeonProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('profile_photo_path')) {
      context.handle(
        _profilePhotoPathMeta,
        profilePhotoPath.isAcceptableOrUnknown(
          data['profile_photo_path']!,
          _profilePhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('qualification')) {
      context.handle(
        _qualificationMeta,
        qualification.isAcceptableOrUnknown(
          data['qualification']!,
          _qualificationMeta,
        ),
      );
    }
    if (data.containsKey('specialty')) {
      context.handle(
        _specialtyMeta,
        specialty.isAcceptableOrUnknown(data['specialty']!, _specialtyMeta),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('institution')) {
      context.handle(
        _institutionMeta,
        institution.isAcceptableOrUnknown(
          data['institution']!,
          _institutionMeta,
        ),
      );
    }
    if (data.containsKey('training_year')) {
      context.handle(
        _trainingYearMeta,
        trainingYear.isAcceptableOrUnknown(
          data['training_year']!,
          _trainingYearMeta,
        ),
      );
    }
    if (data.containsKey('residency_start_date')) {
      context.handle(
        _residencyStartDateMeta,
        residencyStartDate.isAcceptableOrUnknown(
          data['residency_start_date']!,
          _residencyStartDateMeta,
        ),
      );
    }
    if (data.containsKey('residency_end_date')) {
      context.handle(
        _residencyEndDateMeta,
        residencyEndDate.isAcceptableOrUnknown(
          data['residency_end_date']!,
          _residencyEndDateMeta,
        ),
      );
    }
    if (data.containsKey('registration_number')) {
      context.handle(
        _registrationNumberMeta,
        registrationNumber.isAcceptableOrUnknown(
          data['registration_number']!,
          _registrationNumberMeta,
        ),
      );
    }
    if (data.containsKey('memberships')) {
      context.handle(
        _membershipsMeta,
        memberships.isAcceptableOrUnknown(
          data['memberships']!,
          _membershipsMeta,
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
  SurgeonProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurgeonProfileData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      profilePhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_photo_path'],
      ),
      qualification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}qualification'],
      ),
      specialty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specialty'],
      ),
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      institution: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution'],
      ),
      trainingYear: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}training_year'],
      ),
      residencyStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}residency_start_date'],
      ),
      residencyEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}residency_end_date'],
      ),
      registrationNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registration_number'],
      ),
      memberships: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memberships'],
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
  $SurgeonProfileTable createAlias(String alias) {
    return $SurgeonProfileTable(attachedDatabase, alias);
  }
}

class SurgeonProfileData extends DataClass
    implements Insertable<SurgeonProfileData> {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? profilePhotoPath;
  final String? qualification;
  final String? specialty;
  final String? department;
  final String? institution;
  final String? trainingYear;
  final DateTime? residencyStartDate;
  final DateTime? residencyEndDate;
  final String? registrationNumber;
  final String? memberships;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SurgeonProfileData({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.profilePhotoPath,
    this.qualification,
    this.specialty,
    this.department,
    this.institution,
    this.trainingYear,
    this.residencyStartDate,
    this.residencyEndDate,
    this.registrationNumber,
    this.memberships,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || profilePhotoPath != null) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath);
    }
    if (!nullToAbsent || qualification != null) {
      map['qualification'] = Variable<String>(qualification);
    }
    if (!nullToAbsent || specialty != null) {
      map['specialty'] = Variable<String>(specialty);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    if (!nullToAbsent || institution != null) {
      map['institution'] = Variable<String>(institution);
    }
    if (!nullToAbsent || trainingYear != null) {
      map['training_year'] = Variable<String>(trainingYear);
    }
    if (!nullToAbsent || residencyStartDate != null) {
      map['residency_start_date'] = Variable<DateTime>(residencyStartDate);
    }
    if (!nullToAbsent || residencyEndDate != null) {
      map['residency_end_date'] = Variable<DateTime>(residencyEndDate);
    }
    if (!nullToAbsent || registrationNumber != null) {
      map['registration_number'] = Variable<String>(registrationNumber);
    }
    if (!nullToAbsent || memberships != null) {
      map['memberships'] = Variable<String>(memberships);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SurgeonProfileCompanion toCompanion(bool nullToAbsent) {
    return SurgeonProfileCompanion(
      id: Value(id),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      profilePhotoPath: profilePhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePhotoPath),
      qualification: qualification == null && nullToAbsent
          ? const Value.absent()
          : Value(qualification),
      specialty: specialty == null && nullToAbsent
          ? const Value.absent()
          : Value(specialty),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      institution: institution == null && nullToAbsent
          ? const Value.absent()
          : Value(institution),
      trainingYear: trainingYear == null && nullToAbsent
          ? const Value.absent()
          : Value(trainingYear),
      residencyStartDate: residencyStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(residencyStartDate),
      residencyEndDate: residencyEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(residencyEndDate),
      registrationNumber: registrationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationNumber),
      memberships: memberships == null && nullToAbsent
          ? const Value.absent()
          : Value(memberships),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SurgeonProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurgeonProfileData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      profilePhotoPath: serializer.fromJson<String?>(json['profilePhotoPath']),
      qualification: serializer.fromJson<String?>(json['qualification']),
      specialty: serializer.fromJson<String?>(json['specialty']),
      department: serializer.fromJson<String?>(json['department']),
      institution: serializer.fromJson<String?>(json['institution']),
      trainingYear: serializer.fromJson<String?>(json['trainingYear']),
      residencyStartDate: serializer.fromJson<DateTime?>(
        json['residencyStartDate'],
      ),
      residencyEndDate: serializer.fromJson<DateTime?>(
        json['residencyEndDate'],
      ),
      registrationNumber: serializer.fromJson<String?>(
        json['registrationNumber'],
      ),
      memberships: serializer.fromJson<String?>(json['memberships']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'profilePhotoPath': serializer.toJson<String?>(profilePhotoPath),
      'qualification': serializer.toJson<String?>(qualification),
      'specialty': serializer.toJson<String?>(specialty),
      'department': serializer.toJson<String?>(department),
      'institution': serializer.toJson<String?>(institution),
      'trainingYear': serializer.toJson<String?>(trainingYear),
      'residencyStartDate': serializer.toJson<DateTime?>(residencyStartDate),
      'residencyEndDate': serializer.toJson<DateTime?>(residencyEndDate),
      'registrationNumber': serializer.toJson<String?>(registrationNumber),
      'memberships': serializer.toJson<String?>(memberships),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SurgeonProfileData copyWith({
    int? id,
    String? name,
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> profilePhotoPath = const Value.absent(),
    Value<String?> qualification = const Value.absent(),
    Value<String?> specialty = const Value.absent(),
    Value<String?> department = const Value.absent(),
    Value<String?> institution = const Value.absent(),
    Value<String?> trainingYear = const Value.absent(),
    Value<DateTime?> residencyStartDate = const Value.absent(),
    Value<DateTime?> residencyEndDate = const Value.absent(),
    Value<String?> registrationNumber = const Value.absent(),
    Value<String?> memberships = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SurgeonProfileData(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    profilePhotoPath: profilePhotoPath.present
        ? profilePhotoPath.value
        : this.profilePhotoPath,
    qualification: qualification.present
        ? qualification.value
        : this.qualification,
    specialty: specialty.present ? specialty.value : this.specialty,
    department: department.present ? department.value : this.department,
    institution: institution.present ? institution.value : this.institution,
    trainingYear: trainingYear.present ? trainingYear.value : this.trainingYear,
    residencyStartDate: residencyStartDate.present
        ? residencyStartDate.value
        : this.residencyStartDate,
    residencyEndDate: residencyEndDate.present
        ? residencyEndDate.value
        : this.residencyEndDate,
    registrationNumber: registrationNumber.present
        ? registrationNumber.value
        : this.registrationNumber,
    memberships: memberships.present ? memberships.value : this.memberships,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SurgeonProfileData copyWithCompanion(SurgeonProfileCompanion data) {
    return SurgeonProfileData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      profilePhotoPath: data.profilePhotoPath.present
          ? data.profilePhotoPath.value
          : this.profilePhotoPath,
      qualification: data.qualification.present
          ? data.qualification.value
          : this.qualification,
      specialty: data.specialty.present ? data.specialty.value : this.specialty,
      department: data.department.present
          ? data.department.value
          : this.department,
      institution: data.institution.present
          ? data.institution.value
          : this.institution,
      trainingYear: data.trainingYear.present
          ? data.trainingYear.value
          : this.trainingYear,
      residencyStartDate: data.residencyStartDate.present
          ? data.residencyStartDate.value
          : this.residencyStartDate,
      residencyEndDate: data.residencyEndDate.present
          ? data.residencyEndDate.value
          : this.residencyEndDate,
      registrationNumber: data.registrationNumber.present
          ? data.registrationNumber.value
          : this.registrationNumber,
      memberships: data.memberships.present
          ? data.memberships.value
          : this.memberships,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SurgeonProfileData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('qualification: $qualification, ')
          ..write('specialty: $specialty, ')
          ..write('department: $department, ')
          ..write('institution: $institution, ')
          ..write('trainingYear: $trainingYear, ')
          ..write('residencyStartDate: $residencyStartDate, ')
          ..write('residencyEndDate: $residencyEndDate, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('memberships: $memberships, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    email,
    phone,
    profilePhotoPath,
    qualification,
    specialty,
    department,
    institution,
    trainingYear,
    residencyStartDate,
    residencyEndDate,
    registrationNumber,
    memberships,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurgeonProfileData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.profilePhotoPath == this.profilePhotoPath &&
          other.qualification == this.qualification &&
          other.specialty == this.specialty &&
          other.department == this.department &&
          other.institution == this.institution &&
          other.trainingYear == this.trainingYear &&
          other.residencyStartDate == this.residencyStartDate &&
          other.residencyEndDate == this.residencyEndDate &&
          other.registrationNumber == this.registrationNumber &&
          other.memberships == this.memberships &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SurgeonProfileCompanion extends UpdateCompanion<SurgeonProfileData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> profilePhotoPath;
  final Value<String?> qualification;
  final Value<String?> specialty;
  final Value<String?> department;
  final Value<String?> institution;
  final Value<String?> trainingYear;
  final Value<DateTime?> residencyStartDate;
  final Value<DateTime?> residencyEndDate;
  final Value<String?> registrationNumber;
  final Value<String?> memberships;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SurgeonProfileCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.qualification = const Value.absent(),
    this.specialty = const Value.absent(),
    this.department = const Value.absent(),
    this.institution = const Value.absent(),
    this.trainingYear = const Value.absent(),
    this.residencyStartDate = const Value.absent(),
    this.residencyEndDate = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.memberships = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SurgeonProfileCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.qualification = const Value.absent(),
    this.specialty = const Value.absent(),
    this.department = const Value.absent(),
    this.institution = const Value.absent(),
    this.trainingYear = const Value.absent(),
    this.residencyStartDate = const Value.absent(),
    this.residencyEndDate = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.memberships = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SurgeonProfileData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? profilePhotoPath,
    Expression<String>? qualification,
    Expression<String>? specialty,
    Expression<String>? department,
    Expression<String>? institution,
    Expression<String>? trainingYear,
    Expression<DateTime>? residencyStartDate,
    Expression<DateTime>? residencyEndDate,
    Expression<String>? registrationNumber,
    Expression<String>? memberships,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (profilePhotoPath != null) 'profile_photo_path': profilePhotoPath,
      if (qualification != null) 'qualification': qualification,
      if (specialty != null) 'specialty': specialty,
      if (department != null) 'department': department,
      if (institution != null) 'institution': institution,
      if (trainingYear != null) 'training_year': trainingYear,
      if (residencyStartDate != null)
        'residency_start_date': residencyStartDate,
      if (residencyEndDate != null) 'residency_end_date': residencyEndDate,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (memberships != null) 'memberships': memberships,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SurgeonProfileCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? profilePhotoPath,
    Value<String?>? qualification,
    Value<String?>? specialty,
    Value<String?>? department,
    Value<String?>? institution,
    Value<String?>? trainingYear,
    Value<DateTime?>? residencyStartDate,
    Value<DateTime?>? residencyEndDate,
    Value<String?>? registrationNumber,
    Value<String?>? memberships,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SurgeonProfileCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
      qualification: qualification ?? this.qualification,
      specialty: specialty ?? this.specialty,
      department: department ?? this.department,
      institution: institution ?? this.institution,
      trainingYear: trainingYear ?? this.trainingYear,
      residencyStartDate: residencyStartDate ?? this.residencyStartDate,
      residencyEndDate: residencyEndDate ?? this.residencyEndDate,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      memberships: memberships ?? this.memberships,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (profilePhotoPath.present) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath.value);
    }
    if (qualification.present) {
      map['qualification'] = Variable<String>(qualification.value);
    }
    if (specialty.present) {
      map['specialty'] = Variable<String>(specialty.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (institution.present) {
      map['institution'] = Variable<String>(institution.value);
    }
    if (trainingYear.present) {
      map['training_year'] = Variable<String>(trainingYear.value);
    }
    if (residencyStartDate.present) {
      map['residency_start_date'] = Variable<DateTime>(
        residencyStartDate.value,
      );
    }
    if (residencyEndDate.present) {
      map['residency_end_date'] = Variable<DateTime>(residencyEndDate.value);
    }
    if (registrationNumber.present) {
      map['registration_number'] = Variable<String>(registrationNumber.value);
    }
    if (memberships.present) {
      map['memberships'] = Variable<String>(memberships.value);
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
    return (StringBuffer('SurgeonProfileCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('qualification: $qualification, ')
          ..write('specialty: $specialty, ')
          ..write('department: $department, ')
          ..write('institution: $institution, ')
          ..write('trainingYear: $trainingYear, ')
          ..write('residencyStartDate: $residencyStartDate, ')
          ..write('residencyEndDate: $residencyEndDate, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('memberships: $memberships, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
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
  late final $ProcedureStepsTable procedureSteps = $ProcedureStepsTable(this);
  late final $CaseProcedureStepsTable caseProcedureSteps =
      $CaseProcedureStepsTable(this);
  late final $SurgeonProfileTable surgeonProfile = $SurgeonProfileTable(this);
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
  late final ProcedureStepsDao procedureStepsDao = ProcedureStepsDao(
    this as AppDatabase,
  );
  late final CaseProcedureStepsDao caseProcedureStepsDao =
      CaseProcedureStepsDao(this as AppDatabase);
  late final SurgeonProfileDao surgeonProfileDao = SurgeonProfileDao(
    this as AppDatabase,
  );
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
    procedureSteps,
    caseProcedureSteps,
    surgeonProfile,
  ];
}

typedef $$PatientsTableCreateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      required String patientId,
      required String name,
      required String hospitalId,
      required DateTime dateOfBirth,
      Value<String> sex,
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
      Value<String> sex,
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

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
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

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
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

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

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
                Value<String> sex = const Value.absent(),
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
                sex: sex,
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
                Value<String> sex = const Value.absent(),
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
                sex: sex,
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
      Value<String?> shortName,
      required String category,
      Value<String> specialty,
      Value<int?> parentId,
      Value<String> nodeType,
      Value<String?> aliases,
      Value<String?> description,
      Value<String?> template,
      Value<bool> supportsCPB,
      Value<bool> supportsRedo,
      Value<bool> supportsEmergency,
      Value<bool> supportsTechnicalSteps,
      Value<bool> supportsAssociatedProcedures,
      Value<String> dynamicFields,
      Value<String> technicalSteps,
      Value<String> associatedProcedures,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$ProceduresTableUpdateCompanionBuilder =
    ProceduresCompanion Function({
      Value<int> id,
      Value<String> procedureId,
      Value<String> name,
      Value<String?> shortName,
      Value<String> category,
      Value<String> specialty,
      Value<int?> parentId,
      Value<String> nodeType,
      Value<String?> aliases,
      Value<String?> description,
      Value<String?> template,
      Value<bool> supportsCPB,
      Value<bool> supportsRedo,
      Value<bool> supportsEmergency,
      Value<bool> supportsTechnicalSteps,
      Value<bool> supportsAssociatedProcedures,
      Value<String> dynamicFields,
      Value<String> technicalSteps,
      Value<String> associatedProcedures,
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

  ColumnFilters<String> get shortName => $composableBuilder(
    column: $table.shortName,
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

  ColumnFilters<String> get nodeType => $composableBuilder(
    column: $table.nodeType,
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

  ColumnFilters<String> get template => $composableBuilder(
    column: $table.template,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsCPB => $composableBuilder(
    column: $table.supportsCPB,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsRedo => $composableBuilder(
    column: $table.supportsRedo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsEmergency => $composableBuilder(
    column: $table.supportsEmergency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsTechnicalSteps => $composableBuilder(
    column: $table.supportsTechnicalSteps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsAssociatedProcedures => $composableBuilder(
    column: $table.supportsAssociatedProcedures,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dynamicFields => $composableBuilder(
    column: $table.dynamicFields,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get technicalSteps => $composableBuilder(
    column: $table.technicalSteps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get associatedProcedures => $composableBuilder(
    column: $table.associatedProcedures,
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

  ColumnOrderings<String> get shortName => $composableBuilder(
    column: $table.shortName,
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

  ColumnOrderings<String> get nodeType => $composableBuilder(
    column: $table.nodeType,
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

  ColumnOrderings<String> get template => $composableBuilder(
    column: $table.template,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsCPB => $composableBuilder(
    column: $table.supportsCPB,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsRedo => $composableBuilder(
    column: $table.supportsRedo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsEmergency => $composableBuilder(
    column: $table.supportsEmergency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsTechnicalSteps => $composableBuilder(
    column: $table.supportsTechnicalSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsAssociatedProcedures => $composableBuilder(
    column: $table.supportsAssociatedProcedures,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dynamicFields => $composableBuilder(
    column: $table.dynamicFields,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get technicalSteps => $composableBuilder(
    column: $table.technicalSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get associatedProcedures => $composableBuilder(
    column: $table.associatedProcedures,
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

  GeneratedColumn<String> get shortName =>
      $composableBuilder(column: $table.shortName, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get specialty =>
      $composableBuilder(column: $table.specialty, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get nodeType =>
      $composableBuilder(column: $table.nodeType, builder: (column) => column);

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get template =>
      $composableBuilder(column: $table.template, builder: (column) => column);

  GeneratedColumn<bool> get supportsCPB => $composableBuilder(
    column: $table.supportsCPB,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsRedo => $composableBuilder(
    column: $table.supportsRedo,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsEmergency => $composableBuilder(
    column: $table.supportsEmergency,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsTechnicalSteps => $composableBuilder(
    column: $table.supportsTechnicalSteps,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsAssociatedProcedures => $composableBuilder(
    column: $table.supportsAssociatedProcedures,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dynamicFields => $composableBuilder(
    column: $table.dynamicFields,
    builder: (column) => column,
  );

  GeneratedColumn<String> get technicalSteps => $composableBuilder(
    column: $table.technicalSteps,
    builder: (column) => column,
  );

  GeneratedColumn<String> get associatedProcedures => $composableBuilder(
    column: $table.associatedProcedures,
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
                Value<String?> shortName = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> specialty = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<String> nodeType = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> template = const Value.absent(),
                Value<bool> supportsCPB = const Value.absent(),
                Value<bool> supportsRedo = const Value.absent(),
                Value<bool> supportsEmergency = const Value.absent(),
                Value<bool> supportsTechnicalSteps = const Value.absent(),
                Value<bool> supportsAssociatedProcedures = const Value.absent(),
                Value<String> dynamicFields = const Value.absent(),
                Value<String> technicalSteps = const Value.absent(),
                Value<String> associatedProcedures = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProceduresCompanion(
                id: id,
                procedureId: procedureId,
                name: name,
                shortName: shortName,
                category: category,
                specialty: specialty,
                parentId: parentId,
                nodeType: nodeType,
                aliases: aliases,
                description: description,
                template: template,
                supportsCPB: supportsCPB,
                supportsRedo: supportsRedo,
                supportsEmergency: supportsEmergency,
                supportsTechnicalSteps: supportsTechnicalSteps,
                supportsAssociatedProcedures: supportsAssociatedProcedures,
                dynamicFields: dynamicFields,
                technicalSteps: technicalSteps,
                associatedProcedures: associatedProcedures,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String procedureId,
                required String name,
                Value<String?> shortName = const Value.absent(),
                required String category,
                Value<String> specialty = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<String> nodeType = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> template = const Value.absent(),
                Value<bool> supportsCPB = const Value.absent(),
                Value<bool> supportsRedo = const Value.absent(),
                Value<bool> supportsEmergency = const Value.absent(),
                Value<bool> supportsTechnicalSteps = const Value.absent(),
                Value<bool> supportsAssociatedProcedures = const Value.absent(),
                Value<String> dynamicFields = const Value.absent(),
                Value<String> technicalSteps = const Value.absent(),
                Value<String> associatedProcedures = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProceduresCompanion.insert(
                id: id,
                procedureId: procedureId,
                name: name,
                shortName: shortName,
                category: category,
                specialty: specialty,
                parentId: parentId,
                nodeType: nodeType,
                aliases: aliases,
                description: description,
                template: template,
                supportsCPB: supportsCPB,
                supportsRedo: supportsRedo,
                supportsEmergency: supportsEmergency,
                supportsTechnicalSteps: supportsTechnicalSteps,
                supportsAssociatedProcedures: supportsAssociatedProcedures,
                dynamicFields: dynamicFields,
                technicalSteps: technicalSteps,
                associatedProcedures: associatedProcedures,
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
      Value<String?> approach,
      Value<String?> caseType,
      Value<String?> complexity,
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
      Value<String?> approach,
      Value<String?> caseType,
      Value<String?> complexity,
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

  ColumnFilters<String> get approach => $composableBuilder(
    column: $table.approach,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseType => $composableBuilder(
    column: $table.caseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get complexity => $composableBuilder(
    column: $table.complexity,
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

  ColumnOrderings<String> get approach => $composableBuilder(
    column: $table.approach,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseType => $composableBuilder(
    column: $table.caseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get complexity => $composableBuilder(
    column: $table.complexity,
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

  GeneratedColumn<String> get approach =>
      $composableBuilder(column: $table.approach, builder: (column) => column);

  GeneratedColumn<String> get caseType =>
      $composableBuilder(column: $table.caseType, builder: (column) => column);

  GeneratedColumn<String> get complexity => $composableBuilder(
    column: $table.complexity,
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
          SurgicalCaseData,
          $$SurgicalCasesTableFilterComposer,
          $$SurgicalCasesTableOrderingComposer,
          $$SurgicalCasesTableAnnotationComposer,
          $$SurgicalCasesTableCreateCompanionBuilder,
          $$SurgicalCasesTableUpdateCompanionBuilder,
          (
            SurgicalCaseData,
            BaseReferences<
              _$AppDatabase,
              $SurgicalCasesTable,
              SurgicalCaseData
            >,
          ),
          SurgicalCaseData,
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
                Value<String?> approach = const Value.absent(),
                Value<String?> caseType = const Value.absent(),
                Value<String?> complexity = const Value.absent(),
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
                approach: approach,
                caseType: caseType,
                complexity: complexity,
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
                Value<String?> approach = const Value.absent(),
                Value<String?> caseType = const Value.absent(),
                Value<String?> complexity = const Value.absent(),
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
                approach: approach,
                caseType: caseType,
                complexity: complexity,
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
      SurgicalCaseData,
      $$SurgicalCasesTableFilterComposer,
      $$SurgicalCasesTableOrderingComposer,
      $$SurgicalCasesTableAnnotationComposer,
      $$SurgicalCasesTableCreateCompanionBuilder,
      $$SurgicalCasesTableUpdateCompanionBuilder,
      (
        SurgicalCaseData,
        BaseReferences<_$AppDatabase, $SurgicalCasesTable, SurgicalCaseData>,
      ),
      SurgicalCaseData,
      PrefetchHooks Function()
    >;
typedef $$CaseProceduresTableCreateCompanionBuilder =
    CaseProceduresCompanion Function({
      Value<int> id,
      required int caseId,
      required int procedureId,
      Value<String> type,
      Value<DateTime> createdAt,
    });
typedef $$CaseProceduresTableUpdateCompanionBuilder =
    CaseProceduresCompanion Function({
      Value<int> id,
      Value<int> caseId,
      Value<int> procedureId,
      Value<String> type,
      Value<DateTime> createdAt,
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CaseProceduresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaseProceduresTable,
          CaseProcedureData,
          $$CaseProceduresTableFilterComposer,
          $$CaseProceduresTableOrderingComposer,
          $$CaseProceduresTableAnnotationComposer,
          $$CaseProceduresTableCreateCompanionBuilder,
          $$CaseProceduresTableUpdateCompanionBuilder,
          (
            CaseProcedureData,
            BaseReferences<
              _$AppDatabase,
              $CaseProceduresTable,
              CaseProcedureData
            >,
          ),
          CaseProcedureData,
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
                Value<DateTime> createdAt = const Value.absent(),
              }) => CaseProceduresCompanion(
                id: id,
                caseId: caseId,
                procedureId: procedureId,
                type: type,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int caseId,
                required int procedureId,
                Value<String> type = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CaseProceduresCompanion.insert(
                id: id,
                caseId: caseId,
                procedureId: procedureId,
                type: type,
                createdAt: createdAt,
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
      CaseProcedureData,
      $$CaseProceduresTableFilterComposer,
      $$CaseProceduresTableOrderingComposer,
      $$CaseProceduresTableAnnotationComposer,
      $$CaseProceduresTableCreateCompanionBuilder,
      $$CaseProceduresTableUpdateCompanionBuilder,
      (
        CaseProcedureData,
        BaseReferences<_$AppDatabase, $CaseProceduresTable, CaseProcedureData>,
      ),
      CaseProcedureData,
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
typedef $$ProcedureStepsTableCreateCompanionBuilder =
    ProcedureStepsCompanion Function({
      Value<int> id,
      required int procedureId,
      required String stepId,
      required String stepName,
      required int orderIndex,
      Value<DateTime> createdAt,
    });
typedef $$ProcedureStepsTableUpdateCompanionBuilder =
    ProcedureStepsCompanion Function({
      Value<int> id,
      Value<int> procedureId,
      Value<String> stepId,
      Value<String> stepName,
      Value<int> orderIndex,
      Value<DateTime> createdAt,
    });

class $$ProcedureStepsTableFilterComposer
    extends Composer<_$AppDatabase, $ProcedureStepsTable> {
  $$ProcedureStepsTableFilterComposer({
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

  ColumnFilters<int> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepId => $composableBuilder(
    column: $table.stepId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepName => $composableBuilder(
    column: $table.stepName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProcedureStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProcedureStepsTable> {
  $$ProcedureStepsTableOrderingComposer({
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

  ColumnOrderings<int> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepId => $composableBuilder(
    column: $table.stepId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepName => $composableBuilder(
    column: $table.stepName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProcedureStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProcedureStepsTable> {
  $$ProcedureStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get procedureId => $composableBuilder(
    column: $table.procedureId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stepId =>
      $composableBuilder(column: $table.stepId, builder: (column) => column);

  GeneratedColumn<String> get stepName =>
      $composableBuilder(column: $table.stepName, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProcedureStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProcedureStepsTable,
          ProcedureStepData,
          $$ProcedureStepsTableFilterComposer,
          $$ProcedureStepsTableOrderingComposer,
          $$ProcedureStepsTableAnnotationComposer,
          $$ProcedureStepsTableCreateCompanionBuilder,
          $$ProcedureStepsTableUpdateCompanionBuilder,
          (
            ProcedureStepData,
            BaseReferences<
              _$AppDatabase,
              $ProcedureStepsTable,
              ProcedureStepData
            >,
          ),
          ProcedureStepData,
          PrefetchHooks Function()
        > {
  $$ProcedureStepsTableTableManager(
    _$AppDatabase db,
    $ProcedureStepsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcedureStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcedureStepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcedureStepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> procedureId = const Value.absent(),
                Value<String> stepId = const Value.absent(),
                Value<String> stepName = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProcedureStepsCompanion(
                id: id,
                procedureId: procedureId,
                stepId: stepId,
                stepName: stepName,
                orderIndex: orderIndex,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int procedureId,
                required String stepId,
                required String stepName,
                required int orderIndex,
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProcedureStepsCompanion.insert(
                id: id,
                procedureId: procedureId,
                stepId: stepId,
                stepName: stepName,
                orderIndex: orderIndex,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProcedureStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProcedureStepsTable,
      ProcedureStepData,
      $$ProcedureStepsTableFilterComposer,
      $$ProcedureStepsTableOrderingComposer,
      $$ProcedureStepsTableAnnotationComposer,
      $$ProcedureStepsTableCreateCompanionBuilder,
      $$ProcedureStepsTableUpdateCompanionBuilder,
      (
        ProcedureStepData,
        BaseReferences<_$AppDatabase, $ProcedureStepsTable, ProcedureStepData>,
      ),
      ProcedureStepData,
      PrefetchHooks Function()
    >;
typedef $$CaseProcedureStepsTableCreateCompanionBuilder =
    CaseProcedureStepsCompanion Function({
      Value<int> id,
      required int caseProcedureId,
      required int procedureStepId,
      required String role,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$CaseProcedureStepsTableUpdateCompanionBuilder =
    CaseProcedureStepsCompanion Function({
      Value<int> id,
      Value<int> caseProcedureId,
      Value<int> procedureStepId,
      Value<String> role,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

class $$CaseProcedureStepsTableFilterComposer
    extends Composer<_$AppDatabase, $CaseProcedureStepsTable> {
  $$CaseProcedureStepsTableFilterComposer({
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

  ColumnFilters<int> get caseProcedureId => $composableBuilder(
    column: $table.caseProcedureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get procedureStepId => $composableBuilder(
    column: $table.procedureStepId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
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
}

class $$CaseProcedureStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $CaseProcedureStepsTable> {
  $$CaseProcedureStepsTableOrderingComposer({
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

  ColumnOrderings<int> get caseProcedureId => $composableBuilder(
    column: $table.caseProcedureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get procedureStepId => $composableBuilder(
    column: $table.procedureStepId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
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
}

class $$CaseProcedureStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaseProcedureStepsTable> {
  $$CaseProcedureStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get caseProcedureId => $composableBuilder(
    column: $table.caseProcedureId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get procedureStepId => $composableBuilder(
    column: $table.procedureStepId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CaseProcedureStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaseProcedureStepsTable,
          CaseProcedureStepData,
          $$CaseProcedureStepsTableFilterComposer,
          $$CaseProcedureStepsTableOrderingComposer,
          $$CaseProcedureStepsTableAnnotationComposer,
          $$CaseProcedureStepsTableCreateCompanionBuilder,
          $$CaseProcedureStepsTableUpdateCompanionBuilder,
          (
            CaseProcedureStepData,
            BaseReferences<
              _$AppDatabase,
              $CaseProcedureStepsTable,
              CaseProcedureStepData
            >,
          ),
          CaseProcedureStepData,
          PrefetchHooks Function()
        > {
  $$CaseProcedureStepsTableTableManager(
    _$AppDatabase db,
    $CaseProcedureStepsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseProcedureStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseProcedureStepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseProcedureStepsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> caseProcedureId = const Value.absent(),
                Value<int> procedureStepId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CaseProcedureStepsCompanion(
                id: id,
                caseProcedureId: caseProcedureId,
                procedureStepId: procedureStepId,
                role: role,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int caseProcedureId,
                required int procedureStepId,
                required String role,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CaseProcedureStepsCompanion.insert(
                id: id,
                caseProcedureId: caseProcedureId,
                procedureStepId: procedureStepId,
                role: role,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CaseProcedureStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaseProcedureStepsTable,
      CaseProcedureStepData,
      $$CaseProcedureStepsTableFilterComposer,
      $$CaseProcedureStepsTableOrderingComposer,
      $$CaseProcedureStepsTableAnnotationComposer,
      $$CaseProcedureStepsTableCreateCompanionBuilder,
      $$CaseProcedureStepsTableUpdateCompanionBuilder,
      (
        CaseProcedureStepData,
        BaseReferences<
          _$AppDatabase,
          $CaseProcedureStepsTable,
          CaseProcedureStepData
        >,
      ),
      CaseProcedureStepData,
      PrefetchHooks Function()
    >;
typedef $$SurgeonProfileTableCreateCompanionBuilder =
    SurgeonProfileCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> profilePhotoPath,
      Value<String?> qualification,
      Value<String?> specialty,
      Value<String?> department,
      Value<String?> institution,
      Value<String?> trainingYear,
      Value<DateTime?> residencyStartDate,
      Value<DateTime?> residencyEndDate,
      Value<String?> registrationNumber,
      Value<String?> memberships,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$SurgeonProfileTableUpdateCompanionBuilder =
    SurgeonProfileCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> profilePhotoPath,
      Value<String?> qualification,
      Value<String?> specialty,
      Value<String?> department,
      Value<String?> institution,
      Value<String?> trainingYear,
      Value<DateTime?> residencyStartDate,
      Value<DateTime?> residencyEndDate,
      Value<String?> registrationNumber,
      Value<String?> memberships,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$SurgeonProfileTableFilterComposer
    extends Composer<_$AppDatabase, $SurgeonProfileTable> {
  $$SurgeonProfileTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qualification => $composableBuilder(
    column: $table.qualification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get institution => $composableBuilder(
    column: $table.institution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainingYear => $composableBuilder(
    column: $table.trainingYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get residencyStartDate => $composableBuilder(
    column: $table.residencyStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get residencyEndDate => $composableBuilder(
    column: $table.residencyEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registrationNumber => $composableBuilder(
    column: $table.registrationNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memberships => $composableBuilder(
    column: $table.memberships,
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

class $$SurgeonProfileTableOrderingComposer
    extends Composer<_$AppDatabase, $SurgeonProfileTable> {
  $$SurgeonProfileTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qualification => $composableBuilder(
    column: $table.qualification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get institution => $composableBuilder(
    column: $table.institution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainingYear => $composableBuilder(
    column: $table.trainingYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get residencyStartDate => $composableBuilder(
    column: $table.residencyStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get residencyEndDate => $composableBuilder(
    column: $table.residencyEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registrationNumber => $composableBuilder(
    column: $table.registrationNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memberships => $composableBuilder(
    column: $table.memberships,
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

class $$SurgeonProfileTableAnnotationComposer
    extends Composer<_$AppDatabase, $SurgeonProfileTable> {
  $$SurgeonProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get qualification => $composableBuilder(
    column: $table.qualification,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specialty =>
      $composableBuilder(column: $table.specialty, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<String> get institution => $composableBuilder(
    column: $table.institution,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trainingYear => $composableBuilder(
    column: $table.trainingYear,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get residencyStartDate => $composableBuilder(
    column: $table.residencyStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get residencyEndDate => $composableBuilder(
    column: $table.residencyEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registrationNumber => $composableBuilder(
    column: $table.registrationNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get memberships => $composableBuilder(
    column: $table.memberships,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SurgeonProfileTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SurgeonProfileTable,
          SurgeonProfileData,
          $$SurgeonProfileTableFilterComposer,
          $$SurgeonProfileTableOrderingComposer,
          $$SurgeonProfileTableAnnotationComposer,
          $$SurgeonProfileTableCreateCompanionBuilder,
          $$SurgeonProfileTableUpdateCompanionBuilder,
          (
            SurgeonProfileData,
            BaseReferences<
              _$AppDatabase,
              $SurgeonProfileTable,
              SurgeonProfileData
            >,
          ),
          SurgeonProfileData,
          PrefetchHooks Function()
        > {
  $$SurgeonProfileTableTableManager(
    _$AppDatabase db,
    $SurgeonProfileTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SurgeonProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SurgeonProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SurgeonProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<String?> qualification = const Value.absent(),
                Value<String?> specialty = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> institution = const Value.absent(),
                Value<String?> trainingYear = const Value.absent(),
                Value<DateTime?> residencyStartDate = const Value.absent(),
                Value<DateTime?> residencyEndDate = const Value.absent(),
                Value<String?> registrationNumber = const Value.absent(),
                Value<String?> memberships = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SurgeonProfileCompanion(
                id: id,
                name: name,
                email: email,
                phone: phone,
                profilePhotoPath: profilePhotoPath,
                qualification: qualification,
                specialty: specialty,
                department: department,
                institution: institution,
                trainingYear: trainingYear,
                residencyStartDate: residencyStartDate,
                residencyEndDate: residencyEndDate,
                registrationNumber: registrationNumber,
                memberships: memberships,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<String?> qualification = const Value.absent(),
                Value<String?> specialty = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> institution = const Value.absent(),
                Value<String?> trainingYear = const Value.absent(),
                Value<DateTime?> residencyStartDate = const Value.absent(),
                Value<DateTime?> residencyEndDate = const Value.absent(),
                Value<String?> registrationNumber = const Value.absent(),
                Value<String?> memberships = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => SurgeonProfileCompanion.insert(
                id: id,
                name: name,
                email: email,
                phone: phone,
                profilePhotoPath: profilePhotoPath,
                qualification: qualification,
                specialty: specialty,
                department: department,
                institution: institution,
                trainingYear: trainingYear,
                residencyStartDate: residencyStartDate,
                residencyEndDate: residencyEndDate,
                registrationNumber: registrationNumber,
                memberships: memberships,
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

typedef $$SurgeonProfileTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SurgeonProfileTable,
      SurgeonProfileData,
      $$SurgeonProfileTableFilterComposer,
      $$SurgeonProfileTableOrderingComposer,
      $$SurgeonProfileTableAnnotationComposer,
      $$SurgeonProfileTableCreateCompanionBuilder,
      $$SurgeonProfileTableUpdateCompanionBuilder,
      (
        SurgeonProfileData,
        BaseReferences<_$AppDatabase, $SurgeonProfileTable, SurgeonProfileData>,
      ),
      SurgeonProfileData,
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
  $$ProcedureStepsTableTableManager get procedureSteps =>
      $$ProcedureStepsTableTableManager(_db, _db.procedureSteps);
  $$CaseProcedureStepsTableTableManager get caseProcedureSteps =>
      $$CaseProcedureStepsTableTableManager(_db, _db.caseProcedureSteps);
  $$SurgeonProfileTableTableManager get surgeonProfile =>
      $$SurgeonProfileTableTableManager(_db, _db.surgeonProfile);
}
