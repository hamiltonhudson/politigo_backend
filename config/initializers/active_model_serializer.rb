# ActiveModelSerializers.config.adapter = :json_api
#
# api_mime_types = %W(
#   application/vnd.api+json
#   text/x-json
#   application/json
# )
# Mime::Type.register 'application/vnd.api+json', :json, api_mime_types
# (from https://www.thegreatcodeadventure.com/building-a-super-simple-rails-api-json-api-edition-2/)
# (github code: https://github.com/SophieDeBenedetto/catbook-api/blob/master/config/initializers/active_model_serializer.rb)
# -------------
# ActiveModel::Serializer.config.adapter = ActiveModel::Serializer::Adapter::JsonApi
# (from https://blog.codeship.com/building-a-json-api-with-rails-5/)
# -------------
# ActiveModel::Serializer.config.default_includes = '**'
# (from https://stackoverflow.com/questions/51035413/how-to-get-nested-attributes-using-active-model-serializers)
