/*
try {
    var url = Uri.parse('https://localhost:44325/api/User/createuser');
    var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': 'ddddddf',
        'lname': 'dddd',
        'phonenumber': '07774752156',
        'username': 'mahmouff111',
        'imagefile': 'awdsfsdfgsfdgsdfgdfgdfh',
        'email': 'mahmoudhffefaw0@gmail.com',
        'password': '1234ff56789',
      }),
    );

    if (response.statusCode == 200) {
      print('User created successfully');
    } else {
      print('Failed to create user');
    }
  } catch (e) {
    print('There was an error: $e');
  



try {
    var url = Uri.parse('https://10.0.2.2:44325/api/User/createuser');

    // Bypass certificate check
    HttpClient client = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(url);

    request.headers.set('content-type', 'application/json; charset=UTF-8');

    // Define the data to be sent
    Map<String, String> data = {
      'fname': 'sadsa',
      'lname': 'wyas',
      'phonenumber': '5563325',
      'username': 'mahmou11155521',
      'imagefile': 'awdsfsdfgsdgsdfgdfgdfh',
      'useremail': 'mahmoudhefaw0@gmasadadil.com',
      'userpass': '123456789sadasda',
    };

    // Convert the data to JSON and add it to the body of the request
    String payload = jsonEncode(data);
    print('Payload: $payload');
    request.write(payload);

    // Send the request
    HttpClientResponse response = await request.close();
    
    // Get the response body
    var responseBody = await response.transform(utf8.decoder).join();
    
    print('Response status: ${response.statusCode}');
    print('Response body: $responseBody');

    if (response.statusCode == 200) {
      print('User created successfully');
    } else {
      print('Failed to create user');
    }
  } catch (e) {
    print('There was an error: $e');
  }
*/