package libraries.jwt.jwt

parse_bearer_token(http_request) = token {
    token = substring(http_request.headers.authorization, count("Bearer "), -1)
}

n = 8