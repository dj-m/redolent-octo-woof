describe("Classroom", function() {
  var classroom, jalil, irene, kelvin, myra;

  beforeEach(function() {
    // Define mock student objects
    jalil = {
      firstName: "Jalil",
      scores: [100, 100],
      averageScore: function() { return 100; },
      letterGrade: function() { return "A"; },
    }

    irene = {
      firstName: "Irene",
      scores: [95, 95],
      averageScore: function() { return 95; },
      letterGrade: function() { return "A"; },
    };

    kelvin = {
      firstName: "Kelvin",
      scores: [94, 94],
      averageScore: function() { return 94; },
      letterGrade: function() { return "A"; },
    };

    myra = {
      firstName: "Myra",
      scores: [70, 70],
      averageScore: function() { return 70; },
      letterGrade: function() { return "C"; },
    };

    // Assign classroom
    classroom = new Classroom([jalil, irene, kelvin, myra]);
  });

  describe("type", function() {
    it("is a classroom object", function() {
      expect(classroom).toEqual(jasmine.any(Classroom));
    });
  });

  describe("students", function() {
    it("has students", function() {
      expect(classroom.students).toEqual([jalil, irene, kelvin, myra]);
    });
  });

  describe("finding a student by name", function() {
    it("returns a student with that first name", function() {
      expect(classroom.find("Myra")).toEqual(myra);
    });
  });

  describe("identifying honor roll students", function() {
    it("returns only students with average scores of 95 or greater", function() {
      expect(classroom.honorRollStudents()).toEqual(jasmine.arrayContaining([irene, jalil]));
      expect(classroom.honorRollStudents()).not.toEqual(jasmine.arrayContaining([kelvin, myra]));
    });
  });
});
