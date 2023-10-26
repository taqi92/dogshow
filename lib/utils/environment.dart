enum Environment {
  STAGING,
  PRODUCTION,
}

const Environment activeProfile = Environment.STAGING;

String getBaseUrl() {
  switch (activeProfile) {
    case Environment.STAGING:
      return "https://dog.ceo/api";

    case Environment.PRODUCTION:
      return "";
  }
}

enum HttpMethod {
  GET,
  POST,
  PUT,
}

