describe("Student", function(){
  var student;

  beforeEach(function(){
    student = new Student("Lysette", [100, 100, 100, 4, 100]);
  });

  describe("type", function() {
    it("is a student object", function() {
      expect(student).toEqual(jasmine.any(Student));
    });
  });

  describe("name", function() {
    it("has a first name", function() {
      expect(student.firstName).toEqual("Lysette");
    });
  });

  describe("scores", function() {
    it("has scores", function() {
      expect(student.scores).toEqual([100, 100, 100, 4, 100]);
    });
  });

  describe("average score", function() {
    it("has an average score rounded down to the nearest whole number", function() {
      expect(student.averageScore()).toEqual(80);
    });
  });

  describe("letter grade", function() {
    it("has an A if average score is 90 or greater", function() {
      spyOn(student, "averageScore").and.returnValue(90);
      expect(student.letterGrade()).toEqual("A");
    });

    it("has a B if average score is 80 or greater but less than 90", function() {
      spyOn(student, "averageScore").and.returnValue(80);
      expect(student.letterGrade()).toEqual("B");
    });

    it("has a C if average score is 70 or greater but less than 80", function() {
      spyOn(student, "averageScore").and.returnValue(70);
      expect(student.letterGrade()).toEqual("C");
    });

    it("has a D if average score is 60 or greater but less than 70", function() {
      spyOn(student, "averageScore").and.returnValue(60);
      expect(student.letterGrade()).toEqual("D");
    });

    it("has an F if average score is less than 60", function() {
      spyOn(student, "averageScore").and.returnValue(59);
      expect(student.letterGrade()).toEqual("F");
    });
  });
});
