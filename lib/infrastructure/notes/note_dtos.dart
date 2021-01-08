// dto stands for Data Transfer Objects
// this file will hold both the To Do DTO and the Notes DTO
// dto are for wrapping and unwrapping value objects to and from json

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ddd_to_do/domain/core/value_objects.dart';
import 'package:ddd_to_do/domain/notes/note.dart';
import 'package:ddd_to_do/domain/notes/todo_item.dart';
import 'package:ddd_to_do/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'note_dtos.freezed.dart';

// to convert the data transfer object to and from json using the json_annotation package
part 'note_dtos.g.dart';

@freezed
abstract class NoteDto implements _$NoteDto {
  const NoteDto._();

  const factory NoteDto({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<TodoItemDto> todos,
    // instead of DateTime, use FieldValue with Firestore. FieldValue is a Placeholder --> Time-on-the-server
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _NoteDto;

  // from domain to infrastructure
  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      // wants to represent color as an int, but note.color is data type of color.
      // therefore use .value on the color to convert it into an int
      color: note.color.getOrCrash().value,
      todos: note.todos
          .getOrCrash()
          // converts the List3<TodoItem> into just a TodoItemDto
          .map(
            (todoItem) => TodoItemDto.fromDomain(todoItem),
          )
          .asList(),
      // converts the ktList into a regular list
      // Firebase will notice this FieldValue and will pass in their own server time into this
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  // from infrastracture to domain
  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(todos.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }

  factory NoteDto.fromJson(Map<String, dynamic> json) => _$NoteDtoFromJson(json);

  factory NoteDto.fromFirestore(DocumentSnapshot doc) {
    return NoteDto.fromJson(doc.data()).copyWith(id: doc.id);
  }
}

// Converter From FieldValue to Object to work with the json converter
class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

@freezed
abstract class TodoItemDto implements _$TodoItemDto {
  const TodoItemDto._();

  // converts the value objects into their core values
  // they lose their validated value objects
  const factory TodoItemDto({
    @required String id,
    @required String name,
    @required bool done,
  }) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
      id: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) => _$TodoItemDtoFromJson(json);
}
