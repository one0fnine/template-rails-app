module Utils
  module SimpleResponse
    class << self
      def build(code, status, title, detail = nil, root = :errors)
        {root => [{status: code.to_s, code: status, detail: detail || title, title: title}]}
      end

      def render(status:, title:, detail: nil, root: :error)
        code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
        body = build(code, status, title, detail, root).to_json

        [
          code,
          {"Content-Type" => "application/vnd.api+json", "Content-Length" => body.bytesize.to_s},
          [body]
        ]
      end

      def render_not_found
        render_http_error(:not_found)
      end

      def render_internal_server_error
        render_http_error(:internal_server_error)
      end

      def render_http_error(status)
        render(status: status, title: I18n.t("errors.#{status}"))
      end

      def render_pong
        render(status: :ok, title: "Success Request", detail: "pong", root: :success)
      end
    end
  end
end
