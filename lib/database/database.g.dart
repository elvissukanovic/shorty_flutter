// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, title, order];
  @override
  String get aliasedName => _alias ?? 'groups';
  @override
  String get actualTableName => 'groups';
  @override
  VerificationContext validateIntegrity(Insertable<Group> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Group map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Group(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final int id;
  final String title;
  final int order;
  const Group({required this.id, required this.title, required this.order});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['order'] = Variable<int>(order);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: Value(id),
      title: Value(title),
      order: Value(order),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'order': serializer.toJson<int>(order),
    };
  }

  Group copyWith({int? id, String? title, int? order}) => Group(
        id: id ?? this.id,
        title: title ?? this.title,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.title == this.title &&
          other.order == this.order);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> order;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.order = const Value.absent(),
  });
  GroupsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.order = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Group> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (order != null) 'order': order,
    });
  }

  GroupsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<int>? order}) {
    return GroupsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $ShortcutsTable extends Shortcuts
    with TableInfo<$ShortcutsTable, Shortcut> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShortcutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _shortcutMeta =
      const VerificationMeta('shortcut');
  @override
  late final GeneratedColumn<String> shortcut = GeneratedColumn<String>(
      'shortcut', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ShortcutType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ShortcutType>($ShortcutsTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, title, shortcut, groupId, type];
  @override
  String get aliasedName => _alias ?? 'shortcuts';
  @override
  String get actualTableName => 'shortcuts';
  @override
  VerificationContext validateIntegrity(Insertable<Shortcut> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('shortcut')) {
      context.handle(_shortcutMeta,
          shortcut.isAcceptableOrUnknown(data['shortcut']!, _shortcutMeta));
    } else if (isInserting) {
      context.missing(_shortcutMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shortcut map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shortcut(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      shortcut: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shortcut'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      type: $ShortcutsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $ShortcutsTable createAlias(String alias) {
    return $ShortcutsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ShortcutType, String, String> $convertertype =
      const EnumNameConverter<ShortcutType>(ShortcutType.values);
}

class Shortcut extends DataClass implements Insertable<Shortcut> {
  final int id;
  final String title;
  final String shortcut;
  final int groupId;
  final ShortcutType type;
  const Shortcut(
      {required this.id,
      required this.title,
      required this.shortcut,
      required this.groupId,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['shortcut'] = Variable<String>(shortcut);
    map['group_id'] = Variable<int>(groupId);
    {
      final converter = $ShortcutsTable.$convertertype;
      map['type'] = Variable<String>(converter.toSql(type));
    }
    return map;
  }

  ShortcutsCompanion toCompanion(bool nullToAbsent) {
    return ShortcutsCompanion(
      id: Value(id),
      title: Value(title),
      shortcut: Value(shortcut),
      groupId: Value(groupId),
      type: Value(type),
    );
  }

  factory Shortcut.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shortcut(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      shortcut: serializer.fromJson<String>(json['shortcut']),
      groupId: serializer.fromJson<int>(json['groupId']),
      type: $ShortcutsTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'shortcut': serializer.toJson<String>(shortcut),
      'groupId': serializer.toJson<int>(groupId),
      'type': serializer
          .toJson<String>($ShortcutsTable.$convertertype.toJson(type)),
    };
  }

  Shortcut copyWith(
          {int? id,
          String? title,
          String? shortcut,
          int? groupId,
          ShortcutType? type}) =>
      Shortcut(
        id: id ?? this.id,
        title: title ?? this.title,
        shortcut: shortcut ?? this.shortcut,
        groupId: groupId ?? this.groupId,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Shortcut(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('shortcut: $shortcut, ')
          ..write('groupId: $groupId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, shortcut, groupId, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shortcut &&
          other.id == this.id &&
          other.title == this.title &&
          other.shortcut == this.shortcut &&
          other.groupId == this.groupId &&
          other.type == this.type);
}

class ShortcutsCompanion extends UpdateCompanion<Shortcut> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> shortcut;
  final Value<int> groupId;
  final Value<ShortcutType> type;
  const ShortcutsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.shortcut = const Value.absent(),
    this.groupId = const Value.absent(),
    this.type = const Value.absent(),
  });
  ShortcutsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String shortcut,
    required int groupId,
    required ShortcutType type,
  })  : title = Value(title),
        shortcut = Value(shortcut),
        groupId = Value(groupId),
        type = Value(type);
  static Insertable<Shortcut> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? shortcut,
    Expression<int>? groupId,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (shortcut != null) 'shortcut': shortcut,
      if (groupId != null) 'group_id': groupId,
      if (type != null) 'type': type,
    });
  }

  ShortcutsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? shortcut,
      Value<int>? groupId,
      Value<ShortcutType>? type}) {
    return ShortcutsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      shortcut: shortcut ?? this.shortcut,
      groupId: groupId ?? this.groupId,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (shortcut.present) {
      map['shortcut'] = Variable<String>(shortcut.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (type.present) {
      final converter = $ShortcutsTable.$convertertype;
      map['type'] = Variable<String>(converter.toSql(type.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShortcutsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('shortcut: $shortcut, ')
          ..write('groupId: $groupId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyAppDatabase extends GeneratedDatabase {
  _$MyAppDatabase(QueryExecutor e) : super(e);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $ShortcutsTable shortcuts = $ShortcutsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [groups, shortcuts];
}
