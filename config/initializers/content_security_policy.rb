# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :http, :data
  policy.object_src  :none
  if Rails.env.development?
    policy.script_src :self, :https, :unsafe_inline, :unsafe_eval, 'http://localhost:35729'
  else
    policy.script_src :self, :https, :unsafe_inline, :unsafe_eval
  end
  policy.style_src   :self, :https, :unsafe_inline

  if Rails.env.development?
    policy.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035', 'ws://localhost:35729'
  else
    policy.connect_src :self, :https
  end

  # Specify URI for violation reports
  # p.report_uri "/csp-violation-report-endpoint"
end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
