/*
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQ0YTg5YWNmNzg2YTY5OTY5OTAxYjIwMmVhMDg1NjAxNTM4OWRlNzQyNDIzODRiOTdjNzBhZGRlMTJmNTQzYTFmYjIwNWUxMjE2NDg3ZTkxIn0.eyJhdWQiOiIyIiwianRpIjoiNDRhODlhY2Y3ODZhNjk5Njk5MDFiMjAyZWEwODU2MDE1Mzg5ZGU3NDI0MjM4NGI5N2M3MGFkZGUxMmY1NDNhMWZiMjA1ZTEyMTY0ODdlOTEiLCJpYXQiOjE2Njg5MzM1NjEsIm5iZiI6MTY2ODkzMzU2MSwiZXhwIjoxNzAwNDY5NTYxLCJzdWIiOiIyMjc3Iiwic2NvcGVzIjpbXX0.gewEnTQPtWsd-780poZM2DVaor3ay5R0vTPk3uF4W07XonJi-AX1a_Vtlcqh3QkvpP3_5k02Pd63QwBLtPeoe7OkjLgbK-a7bf8UiGPTp3YIeNBV1FlY_0hfFsg67NJd5YaYW2n5xKVa7COzuU_9iSI3ShSbYPMpYDNhJFq9D_8VwHxaa8YeLKNVxEwHW3FlGrD76LAryVqCZJnEWVun7QaqduvQAHnJ-6gaGm84ovbKOSaB2qGu8kW2L2klC8nnYqnpFEi_DziFRFtElzyg8w-2SFgYNnkgCv6QJ4iwpjwih4YpjML-K7gILrgIasAWviYoWlHBPDk8YORHkzm4DYtWS4TcpCTUAOxdKqm7vrjygKPPJrbK1skWSfaHq54YjVDRPEztSxOlhVAxZqcx7bpHKgreGEX4e6oDWF5un2qP7rVwocEeaZMtkoYg6p7u9N3hPZJ9bON3j3zm08U7Izlqh2qZWKQPW-kWCh5LAfVzVmXN09CQx7dmQHc5WiWAlCkGFqenzjPvGaqQJcH2lnJbYhxujV2gJHOIyBxu4R6fj6QLCo-4UbH2dFiqG4iLSFNzPyzeGwTxJ9XQk4APmsClPd6mEGGUCSsFz849vbDv_toEBXBsye3k02RLAg2dAVA-sdVDPYlLWicViEMJ-lpTsQQ7lYx9_2KktVUXGZY
*/
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQ0YTg5YWNmNzg2YTY5OTY5OTAxYjIwMmVhMDg1NjAxNTM4OWRlNzQyNDIzODRiOTdjNzBhZGRlMTJmNTQzYTFmYjIwNWUxMjE2NDg3ZTkxIn0.eyJhdWQiOiIyIiwianRpIjoiNDRhODlhY2Y3ODZhNjk5Njk5MDFiMjAyZWEwODU2MDE1Mzg5ZGU3NDI0MjM4NGI5N2M3MGFkZGUxMmY1NDNhMWZiMjA1ZTEyMTY0ODdlOTEiLCJpYXQiOjE2Njg5MzM1NjEsIm5iZiI6MTY2ODkzMzU2MSwiZXhwIjoxNzAwNDY5NTYxLCJzdWIiOiIyMjc3Iiwic2NvcGVzIjpbXX0.gewEnTQPtWsd-780poZM2DVaor3ay5R0vTPk3uF4W07XonJi-AX1a_Vtlcqh3QkvpP3_5k02Pd63QwBLtPeoe7OkjLgbK-a7bf8UiGPTp3YIeNBV1FlY_0hfFsg67NJd5YaYW2n5xKVa7COzuU_9iSI3ShSbYPMpYDNhJFq9D_8VwHxaa8YeLKNVxEwHW3FlGrD76LAryVqCZJnEWVun7QaqduvQAHnJ-6gaGm84ovbKOSaB2qGu8kW2L2klC8nnYqnpFEi_DziFRFtElzyg8w-2SFgYNnkgCv6QJ4iwpjwih4YpjML-K7gILrgIasAWviYoWlHBPDk8YORHkzm4DYtWS4TcpCTUAOxdKqm7vrjygKPPJrbK1skWSfaHq54YjVDRPEztSxOlhVAxZqcx7bpHKgreGEX4e6oDWF5un2qP7rVwocEeaZMtkoYg6p7u9N3hPZJ9bON3j3zm08U7Izlqh2qZWKQPW-kWCh5LAfVzVmXN09CQx7dmQHc5WiWAlCkGFqenzjPvGaqQJcH2lnJbYhxujV2gJHOIyBxu4R6fj6QLCo-4UbH2dFiqG4iLSFNzPyzeGwTxJ9XQk4APmsClPd6mEGGUCSsFz849vbDv_toEBXBsye3k02RLAg2dAVA-sdVDPYlLWicViEMJ-lpTsQQ7lYx9_2KktVUXGZY';
try {
  Position location = await getCurrentLocation();
  http.Response response = await http.get(
  Uri.parse('$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'), 
  headers: {
    'accept': 'application/json',
    'authorization': 'Bearer $token',
  }
);
if(response.statusCode == 200) {
  var result = jsonDecode(response.body)['WeatherForecasts'][0]['forecasts'][0]['data'];
  Placemark address = (await placemarkFromCoordinates(location.latitude, location.longitude)).first;
  return Weather(
  address: '${address.subLocality}\n${address.administrativeArea}',
  temperature: result['tc'],
  cond: result['cond'],
);
} else {
  return Future.error(response.statusCode);
}
} catch (e) {
  return Future.error(e);
}
}