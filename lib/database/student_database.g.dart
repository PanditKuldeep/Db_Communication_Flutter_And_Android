// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `students` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `grade` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'students',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'grade': item.grade
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  @override
  Future<List<Student>> findAllStudents() async {
    return _queryAdapter.queryList('SELECT * FROM students',
        mapper: (Map<String, Object?> row) => Student(
            row['id'] as int, row['name'] as String, row['grade'] as int));
  }

  @override
  Stream<Student?> findStudentById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM students WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Student(
            row['id'] as int, row['name'] as String, row['grade'] as int),
        arguments: [id],
        queryableName: 'students',
        isView: false);
  }

  @override
  Future<void> delete(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM students WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertStudent(List<Student> student) async {
    await _studentInsertionAdapter.insertList(
        student, OnConflictStrategy.abort);
  }
}
