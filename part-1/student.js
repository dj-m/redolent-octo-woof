var Student = function (name, scores) {
  this.firstName = name;
  this.scores = scores;
};

Student.prototype.averageScore = function () {
  var score_sum = this.scores.reduce(function (sum, score) {
    return sum + score;
  }, 0);
  return Math.floor(score_sum / this.scores.length);
};

Student.prototype.letterGrade = function () {
  average = this.averageScore();
  if (average >= 90) {
    return "A";
  } else if (average >= 80) {
    return "B";
  } else if (average >= 70) {
    return "C";
  } else if (average >= 60) {
    return "D";
  } else {
    return "F";
  }
};