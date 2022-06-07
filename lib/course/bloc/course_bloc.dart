import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../course.dart';
import 'course_event.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository})
      : assert(courseRepository != null),
        super(CourseLoading());

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    if (event is CourseLoad) {
      yield CourseLoading();
      try {
        final List<Course> courses = await courseRepository.getCourses() as List<Course>;
        yield CoursesLoadSuccess(courses);
      } catch (_) {
        yield CourseOperationFailure();
      }
    }

    if (event is CourseCreate) {
      try {
        await courseRepository.createCourse(event.course);
        final List<Course> courses = await courseRepository.getCourses() as List<Course>;
        yield CoursesLoadSuccess(courses);
      } catch (_) {
        yield CourseOperationFailure();
      }
    }

    if (event is CourseUpdate) {
      try {
        await courseRepository.updateCourse(event.course);
        final List<Course> courses = await courseRepository.getCourses() as List<Course>;
        yield CoursesLoadSuccess(courses);
      } catch (_) {
        yield CourseOperationFailure();
      }
    }

    if (event is CourseDelete) {
      try {
        await courseRepository.deleteCourse(event.course.id);
        final List<Course> courses = await courseRepository.getCourses() as List<Course>;
        yield CoursesLoadSuccess(courses);
      } catch (_) {
        yield CourseOperationFailure();
      }
    }
  }
}
