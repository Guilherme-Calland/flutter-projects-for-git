import 'dart:io';

const threeSeconds = Duration(seconds: 3);

void main(){
  performTasks();
}

void performTasks() async{
  task1();
  String taskResult2 = await task2();
  task3(taskResult2);
}

void task1(){
  String result = 'task 1 data';
  print('task 1 complete');
}

Future<String> task2() async{
  String result;
  await Future.delayed(threeSeconds, (){
    result = 'task 2 data';
    print('task 2 complete');
  });
  return result;
}

void task3(String taskResult2){
  String result = 'task 3 data';
  print('task 3 complete with $taskResult2');
}