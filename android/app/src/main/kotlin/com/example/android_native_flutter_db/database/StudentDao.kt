package com.example.android_native_flutter_db.database

import androidx.room.*
import kotlinx.coroutines.flow.Flow

@Dao
interface StudentDao {

    @Query("SELECT * FROM students")
    fun findAllStudents(): List<Student>

    @Query("SELECT * FROM students WHERE id = :id")
    fun findStudentById(id : Int): Flow<List<Student>>

    @Insert
    suspend fun insertStudent(student: Student)

    @Delete
    suspend fun deleteStudent(subscriber: Student): Int

}