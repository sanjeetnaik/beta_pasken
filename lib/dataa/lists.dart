class listme {
  var dict = {
    0: {'name': 'sanjeet', 'score': 95, 'year': 'SY', 'branch': 'CS'},
    1: {'name': 'meet', 'score': 94, 'year': 'SY', 'branch': 'CS'},
    2: {'name': 'manan', 'score': 83, 'year': 'SY', 'branch': 'IT'},
    3: {'name': 'vaibhav', 'score': 70, 'year': 'LY', 'branch': 'MECH'},
    4: {'name': 'marshal', 'score': 46, 'year': 'SY', 'branch': 'CS'},
    5: {'name': 'ria', 'score': 84, 'year': 'SY', 'branch': 'CS'},
    6: {'name': 'emily', 'score': 74, 'year': 'FY', 'branch': 'IT'},
    7: {'name': 'ted', 'score': 46, 'year': 'SY', 'branch': 'CS'},
    8: {'name': 'chandler', 'score': 22, 'year': 'SY', 'branch': 'CS'},
    9: {'name': 'joey', 'score': 0, 'year': 'SY', 'branch': 'CS'},
    10: {'name': 'monica', 'score': 10, 'year': 'SY', 'branch': 'CS'},
    11: {'name': 'robin', 'score': 81, 'year': 'SY', 'branch': 'CS'},
    12: {'name': 'rachel', 'score': 25, 'year': 'SY', 'branch': 'CS'},
    13: {'name': 'phoebe', 'score': 45, 'year': 'SY', 'branch': 'CS'},
    14: {'name': 'ross', 'score': 98, 'year': 'SY', 'branch': 'CS'},
    15: {'name': 'kira', 'score': 93, 'year': 'SY', 'branch': 'CS'},
    16: {'name': 'harvey', 'score': 100, 'year': 'SY', 'branch': 'CS'},
    17: {'name': 'mike', 'score': 99, 'year': 'SY', 'branch': 'CS'},
    18: {'name': 'donna', 'score': 89, 'year': 'SY', 'branch': 'CS'},
    19: {'name': 'barney', 'score': 69, 'year': 'TY', 'branch': 'CS'},
    20: {'name': 'aarna', 'score': 89, 'year': 'FY', 'branch': 'CS'},
  };

  listme() {
    sort();
    makelist();
  }

  var ls1 = [];
  var ls2 = [];
  var ls3 = [];
  var ls4 = [];
  var ls5 = [];

  void sort() {
    for (int i = 0; i < dict.length; i++) {
      for (int j = 1; j < dict.length; j++) {
        int a = dict[j - 1]['score'];
        int b = dict[j]['score'];
        if (a < b) {
          var temp = dict[j - 1];
          dict[j - 1] = dict[j];
          dict[j] = temp;
        }
      }
    }
  }

  void makelist() {
    for (int i = 0; i < dict.length; i++) {
      ls1.add(dict[i]['name']);
      ls2.add(dict[i]['score']);
      ls3.add(dict[i]['year']);
      ls4.add(dict[i]['branch']);
    }
  }
}
