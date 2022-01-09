Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "/api/*",
      headers: :any,
      methods: %i[get post delete put patch options head],
      max_age: 600,
      expose: %w[Authorization]
  end

  allow do
    origins "localhost:3000", "127.0.0.1:3000", "lvh.me:3000", "localhost:8080", "127.0.0.1:8080"
    resource "*", methods: :any, headers: :any, max_age: 600, expose: %w[Authorization]
  end
end
