# Part 1: JavaScript Objects
## Summary
In Part 1 of the assessment, we're going to write JavaScript.  Specifically, we're going to define a pair of custom objects:  `Student` and `Classroom`.  Each of these custom objects will have properties and behaviors specific to itself.  Tests have been written to guide you through the development of each object.

### Reading Jasmine Tests
The tests describing the behaviors of our custom objects have been written using Jasmine, which might be unfamiliar to you.  That's perfectly fine.  We won't be writing any Jasmine tests today—just reading them.  Jasmine's syntax is very similar to RSpec's; we'll see `describe()` and `it()`—only in JavaScript, not Ruby.  When we call either of these functions, instead of passing a block as we would in Ruby, we'll pass a function.

The files containing the tests are located within the `spec/` directory; the files are named `student-spec.js` and `classroom-spec.js`.  Read through them as you need to.

### Running Jasmine Tests
We won't run the tests from the command line.  Instead we'll run them in the browser, by opening the file `SpecRunner.html`.  This HTML file loads the Jasmine JavaScript library, the application code that we'll write, and the files containing the tests.  It runs the tests and then displays the outcome of the tests in the browser.

## Releases
### Release 0: Student
We'll start by focusing on the tests describing our student (see `spec/student_spec.js`).  To run the tests, open the file `SpecRunner.html` in a browser. On the command line navigate to the `part-1` directory and then run ...

```
$ open SpecRunner.html
```
... this should open the HTML file in the default browser.

When the page loads, the tests will run—to begin, all of them will be failing.  Writing code in the file `student.js`, work through the tests until all of the tests for the student pass.

### Release 1: Classroom
Once the tests for the custom student object pass, move on to the classroom object type.  Write the code for the custom classroom object in the file `classroom.js`.  Work through the tests until all of the tests pass.

## Conclusion
Once all the tests have passed, you have completed Part 1 of the assessment. If you haven't done so already, commit your changes and move on to Part 2.
