import 'dart:math';

final Random random = new Random();

class Data {
  //data ve variables
  var num1, num2, num3, num4, num5, num6;
  var ctrl1, ctrl2, ctrl3, ctrl4, ctrl5, ctrl6;
  var data2, data3;
  bool win;
  var data1 = [
    1,
    5,
    10,
    25,
    50,
    75,
    100,
    150,
    200,
    250,
    300,
    500,
    750,
    1000,
    2000,
  ];
  void randomdata() {
    // rand datas & control algorithms
    ctrl1 = 0;
    ctrl2 = 0;
    ctrl3 = 0;
    ctrl4 = 0;
    ctrl5 = 0;
    ctrl6 = 0;

    num1 = data1[random.nextInt(data1.length)];
    num2 = data1[random.nextInt(data1.length)];
    num3 = data1[random.nextInt(data1.length)];
    num4 = data1[random.nextInt(data1.length)];
    num5 = data1[random.nextInt(data1.length)];
    num6 = data1[random.nextInt(data1.length)];

    data2 = [num1, num2, num3, num4, num5, num6];
    //print(data2);

    for (var i = 0; i < data2.length; i++) {
      if (data2[i] == num1) {
        ctrl1++;
      }
      if (data2[i] == num2) {
        ctrl2++;
      }
      if (data2[i] == num3) {
        ctrl3++;
      }
      if (data2[i] == num4) {
        ctrl4++;
      }
      if (data2[i] == num5) {
        ctrl5++;
      }
      if (data2[i] == num6) {
        ctrl6++;
      }
    }
    data3 = [ctrl1, ctrl2, ctrl3, ctrl4, ctrl5, ctrl6];

    if (ctrl1 > 3) {
      return randomdata();
    }
    if (ctrl2 > 3) {
      return randomdata();
    }
    if (ctrl3 > 3) {
      return randomdata();
      
    }
    if (ctrl4 > 3) {
      return randomdata();
    }
    if (ctrl5 > 3) {
      return randomdata();
    }
    if (ctrl6 > 3) {
      return randomdata();
    }

    var p = 0;
    for (var i = 0; i < data3.length; i++) {
      if (data3[i] == 3) {
        p++;
        if (p > 3) {
          return randomdata();
        }
        if (p == 3) {
          // print("win");
          win = true;
        }
      }
    }

    print(data2);
    print(data3);

  }
}
