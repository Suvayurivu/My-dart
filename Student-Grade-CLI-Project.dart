
import 'dart:io';

void main(){

   var isrunning = true; // (1) var used for mutable variable

 const String title = "[=== Student Grader v1.0 ===]"; // (3) const used for fixed value

  final Set<String> availableSubject= { // (2) final + (20) Set used for immutable collection
    "Microprocessor",
    "Data Structure",
    "Object oriented",
    "Internet Programming",
    "Competitive Programming"
  };

   var students = []; // (19) List used to store students

  do { // (18) do-while loop for main menu

    print("""$title
1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:
  """); // (12) multi-line string + (11) string interpolation


    var choice = stdin.readLineSync()!; // (1) var input

    switch(choice){ // (14) switch used for menu routing

      case "1":

      print("Enter the student name : ");
      var name = stdin.readLineSync()!;

      Map <String, dynamic> student = { // (21) Map used for student record

 "name" : name,

 "Scores" : [], // (19) List for scores

 "Subjects" : {...availableSubject}, // (24) spread operator to copy set

 "bonus" : null, // (4) nullable int

 "comment" : null // (4) nullable String

 };

 students.add(student);
      break;


      case "2":

        if (students.isEmpty) { // (13) if condition
          print("Add student");
        } else { // (13) else condition

          print("--- Student List ---");

          for (int i = 0; i < students.length; i++) { // (15) indexed for loop
            print("${i + 1}. ${students[i]['name']}"); // (11) string interpolation
          }

          stdout.write("Select student number ");
          int index = int.parse(stdin.readLineSync()!) - 1;

          var selectedStudent = students[index];

          print("Available Subjects: ${selectedStudent['Subjects']}");

          stdout.write("Enter the subject name: ");
          String sub = stdin.readLineSync()!;

          double score = -1;

          while (score < 0 || score > 100) { // (17) while loop with validation

            stdout.write("$sub score (0-100): ");
            score = double.parse(stdin.readLineSync()!);

            if (score < 0 || score > 100) { // (9) relational operator check
              print("Invalid score! try again...");
            }
          }

          selectedStudent["Scores"].add(score);
          print("Score added successfully!");
        }
        break;


        case "3":

         if (students.isEmpty) {
          print("Add student");
        } else {

          print("--- Student List ---");
          for (int i = 0; i < students.length; i++) {
            print("${i + 1}. ${students[i]['name']}");
          }

          stdout.write("Select student number ");
          int index = int.parse(stdin.readLineSync()!) - 1;

        var selectedStudent = students[index];

        stdout.write("Enter bonus (1-10): ");
        int bonus = int.parse(stdin.readLineSync()!);

        if(bonus < 1 || bonus > 10){ // (9) relational operators
          print("Invalid bonus!");

        }else{

          if(selectedStudent["bonus"]!= null){ // existing value check
            print("Bonus already added!");
          }else{
            selectedStudent["bonus"] ??= bonus; // (6) null-aware assignment
            print("Bonus added successfully!");
          }
        }
        }
        break;


case"4":

if (students.isEmpty) {
print("Add student first");
} else {

print("--- Student List ---");

for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]['name']}");
}

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync()!) - 1;

var selectedStudent = students[index];

stdout.write("Enter comment: ");
String comment = stdin.readLineSync()!;

selectedStudent["comment"] = comment;

print("Comment added successfully!");
}

break;


case "5":

if (students.isEmpty) {
  print("No students found");
} else {

  print("---- All Students ----");

  for (var student in students) { // (16) for-in loop

    var tags = [
      student["name"],
      "${student["Scores"].length} scores",
      if (student["bonus"] != null) "⭐ Has Bonus", // (22) collection if
    ];

    print(tags.join(" | "));
  }

}

break;


case "6":

print("--- Student List ---");

for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]['name']}");
}

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync()!) - 1;

var student = students[index];


double sum = 0;

for (var s in student["Scores"]) { // (8) arithmetic accumulation
sum += s;
}

double avg = student["Scores"].isEmpty
? 0
: sum / student["Scores"].length; // arithmetic calculation

avg += (student["bonus"] ?? 0); // (5) null-aware operator

if(avg > 100){
avg = 100;
}

String grade;

if(avg >= 90){ // (9) relational operators
  grade = "A";
}
else if(avg >= 80){
  grade = "B";
}
else if(avg >= 70){
  grade = "C";
}
else if(avg >= 60){
  grade = "D";
}
else{
  grade = "F";
}


String feedback = switch (grade) { // switch expression (pattern matching)
  "A" => "Outstanding performance!",
  "B" => "Good work, keep it up!",
  "C" => "Satisfactory. Room to improve.",
  "D" => "Needs improvement.",
  "F" => "Failing. Please seek help.",
  _   => "Unknown grade.",
};


String comment = student["comment"]?.toUpperCase() ?? "No comment"; // (7) null-safe access


print("""
╔══════════════════════════════╗
║       REPORT CARD            ║
╠══════════════════════════════╝
║ Name: ${student["name"]}
║ Scores: ${student["Scores"]}
║ Bonus: +${student["bonus"] ?? 0}
║ Average: ${avg.toStringAsFixed(1)}
║ Grade: $grade
║ Feedback: $feedback
║ Comment: $comment
╚══════════════════════════════╝
""");

break;


case "7":

int total = students.length;

double totalAvg = 0;

Set<String> grades = {}; // Set used for unique grades

for(var student in students){

var scores = student["Scores"];

double sum = 0;

for(var s in scores){
sum += s;
}


double avg = scores.isEmpty ? 0 : sum / scores.length;

avg += (student["bonus"] ?? 0);

if(scores.isNotEmpty && avg >= 60){ // (10) logical operators
print("Pass");
}


totalAvg += avg;

String grade;

if(avg >= 90){
  grade = "A";
}
else if(avg >= 80){
  grade = "B";
}
else if(avg >= 70){
  grade = "C";
}
else if(avg >= 60){
  grade = "D";
}
else{
  grade = "F";
}

grades.add(grade);

}


double classAvg = totalAvg / total;

var summaryLines = [
  for (var s in students) "${s["name"]}" // (23) collection for
];

print("""
===== CLASS SUMMARY =====
Total Students: $total
Class Average: ${classAvg.toStringAsFixed(1)}
Grades Seen: $grades
""");

break;


case "8":

isrunning = false;
break;


default:
print("Invalid");

}

}while(isrunning);

}