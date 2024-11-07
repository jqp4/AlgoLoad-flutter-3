class ServerException implements Exception {
  const ServerException({
    required this.description,
  });

  final String description;
}

class LocalException implements Exception {
  const LocalException({
    required this.description,
  });

  final String description;
}

class CacheException implements Exception {
  const CacheException({
    required this.description,
  });

  final String description;
}

class SerializationException implements Exception {
  const SerializationException({
    required this.description,
  });

  final String description;
}
