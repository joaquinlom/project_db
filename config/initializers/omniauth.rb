OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '685679361450959', 'ee67c4d293ee79f7b9a923ace0656dae'
end