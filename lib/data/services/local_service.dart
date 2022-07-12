class LocalService {
  List<Map<String, dynamic>> _items = [];
  static final LocalService _localService = LocalService._privateConstructor();
  static final _data = [
    {
      'id': 'asdfadf','title': 'Avengers', 'posterUrl': 'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6791_AL_.jpg', 'rating': 5,  'category': "Action", 'isTrending': true, 'diffusions': []
    },
    {
      'id': 'fadfsadf','title': 'Titanic', 'posterUrl': 'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6791_AL_.jpg', 'rating': 5,  'category': "Action", 'isTrending': true, 'diffusions': []
    },
    {
      'id': 'asdfad','title': 'Uncharted', 'posterUrl': 'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6791_AL_.jpg', 'rating': 5,  'category': "Action", 'isTrending': true, 'diffusions': []
    },
    {
      'id': 'asdfadfdd','title': 'The Boys', 'posterUrl': 'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6791_AL_.jpg', 'rating': 5,  'category': "Action", 'isTrending': false, 'diffusions': []
    },
    {
      'id': '1dasafa23','title': 'Avengers', 'posterUrl': 'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6791_AL_.jpg', 'rating': 5,  'category': "Action", 'isTrending': false, 'diffusions': []
    },
    {
      'id': '123','title': 'Beast Man', 'posterUrl': 'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6791_AL_.jpg', 'rating': 5,  'category': "Action", 'isTrending': false, 'diffusions': []
    },
    {
      'id': '12345','title': 'Man of Steal', 'posterUrl': 'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6791_AL_.jpg', 'rating': 5,  'category': "Action", 'isTrending': false,
      'diffusions': [

        ]
    },
  ];

  LocalService._privateConstructor();

  factory LocalService() {
    return _localService;
  }

  Future<Map<String, dynamic>> single(String id) async {
    await Future.delayed(Duration(milliseconds: 200));

    return _data[0];
  }

  Future<List<Map<String, dynamic>>> list() async {
    await Future.delayed(Duration(milliseconds: 800));

    return _data;
  }

  Future<List<Map<String, dynamic>>> listRelatedById(String id) async {
    await Future.delayed(Duration(milliseconds: 800));

    return [
      // diffusion data
      {
        'id': '1234', 'date': '12-07-2022','price': 10000, 'quality': '3DS 3DS MAX UHD', 'movieId': '123'
      },
      {
        'id': 'asdfadf', 'date': '13-07-2022','price': 10000, 'quality': '3DS 3DS MAX UHD', 'movieId': '123'
      },
      {
        'id': 'asdfadsf', 'date': '15-07-2022','price': 10000, 'quality': '3DS 3DS MAX UHD', 'movieId': '123'
      },
      {
        'id': 'edgfsdf', 'date': '21-07-2022','price': 10000, 'quality': '3DS 3DS MAX UHD', 'movieId': '123'
      },
      {
        'id': 'ddergf', 'date': '01-08-2022','price': 10000, 'quality': '3DS 3DS MAX UHD', 'movieId': '123'
      },
      {
        'id': 'ddftrefdf', 'date': '03-08-2022','price': 10000, 'quality': '3DS 3DS MAX UHD', 'movieId': '123'
      },
      {
        'id': 'eeefhrtdd', 'date': '04-08-2022','price': 10000, 'quality': '3DS 3DS MAX UHD', 'movieId': '123'
      },


    ];
  }

  Future<List<Map<String, dynamic>>> listNestedById(String id) async {
    await Future.delayed(Duration(milliseconds: 800));

    return [
      // booking data
      {
        'id': "1234", 'time': "time",'diffusionId': "diffusionId",'userId': null,  'reservedSeats': 7
      },
      {
        'id': "12345", 'time': "time",'diffusionId': "diffusionId",'userId': null,  'reservedSeats': 13
      },
      {
        'id': "12345", 'time': "time",'diffusionId': "diffusionId",'userId': null,  'reservedSeats': 20
      },
    ];
  }

  Future<Map<String, dynamic>> insert(dynamic data) async {
    await Future.delayed(Duration(milliseconds: 800));

    return {
      'id': "1234", 'fullname': "Ranarivola Herinavalona", 'email': 'hernavalasco@gmail.com', 'accessToken': "eytokenization"
    };
  }

  Future<List<Map<String, dynamic>>> insertMany(dynamic data) async {
    await Future.delayed(Duration(milliseconds: 800));

    return [
      // booking data
      {
        'id': "1234", 'time': "time",'diffusionId': "diffusionId",'userId': null,  'reservedSeats': 7
      },
      {
        'id': "12345", 'time': "time",'diffusionId': "diffusionId",'userId': null,  'reservedSeats': 13
      },
      {
        'id': "12345", 'time': "time",'diffusionId': "diffusionId",'userId': null,  'reservedSeats': 20
      },
    ];
  }





}