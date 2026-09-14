class WeatherModel {
  final  DateTime date;
  final String city;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;

  final String condition;

  WeatherModel({
    required this.date,
    required this.city,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,

    required this.condition,
  });

  factory WeatherModel.fromJson(json ) {
    return WeatherModel(
      date:DateTime.parse(json['location']['localtime']),
      city: json['location']['name'],
      image: json['forecast']['forecastday'][ 0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],

      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
