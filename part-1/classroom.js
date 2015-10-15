var Classroom = function (students) {
  this.students = students;
};

Classroom.prototype.find = function (name) {
  for (var idx = 0; idx < this.students.length; idx++) {
    student = this.students[idx];
    if (student.firstName == name) {
      return student;
    }
  }
};

Classroom.prototype.honorRollStudents = function () {
  return this.students.filter(function (student) {
    return (student.averageScore() >= 95);
  });
};