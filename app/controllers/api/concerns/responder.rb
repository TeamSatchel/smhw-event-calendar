module Api
  module Concerns
    module Responder
      extend ActiveSupport::Concern

      included do
        def json_respond(object, serializer, code = 200)
          if object.is_a?(ActiveRecord::Relation) || object.valid?
            render_success(represent(serializer, object), code)
          else
            render_error(422, object.errors.full_messages)
          end
        end

        def render_error(code, message)
          render json: { meta: { code: code, message: message } }
        end

        def render_success(json, code = 200, extra_meta = {})
          render json: { data: json, meta: { code: code, message: 'success' }.merge(extra_meta) }
        end

        def represent(representer, data)
          representer.new(data).as_json
        end
      end
    end
  end
end
