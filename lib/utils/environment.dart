enum Environment {
  STAGING,
  PRODUCTION,
}

const Environment activeProfile = Environment.PRODUCTION;

String getBaseUrl() {
  switch (activeProfile) {
    case Environment.STAGING:
      return "https://dog.ceo/api";

    case Environment.PRODUCTION:
      return "https://dog.ceo/api";
  }
}

enum HttpMethod {
  GET,
  POST,
  PUT,
}

