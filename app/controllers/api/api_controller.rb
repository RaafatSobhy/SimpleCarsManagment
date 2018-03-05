module Api
  class ApiController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action :set_locale
    # before_action :restrict_access_token
    protect_from_forgery with: :null_session
    before_action :extract_authentication_from_header, if: -> {request.headers['Authorization'].present?}


    def set_locale
      I18n.locale = :en
      I18n.locale = params[:locale] if params[:locale] && params[:locale].length ==2
      I18n.locale = request.headers[:locale] if request.headers[:locale] && request.headers[:locale].length ==2
      logger.info "Locale = #{ I18n.locale}"
    end

    def render_success(action, status = :ok, message=nil, resource=nil)
      @response = {success: true, message: message, resource: resource}
      if action.is_a? Symbol
        render action, layout: 'jsend', status: status
      else
        @response = {success: true, data: action, message: message, code: 200}
        render :partial => 'api/v1/errors', layout: 'jsend', status: :ok, :formats => [:json]
      end
    end

    def render_validation_error(action, message, code=1)
      @response = {fail: true, message: message, code: code}
      render action, layout: 'jsend', status: :ok
    end

    def render_fail(message, code=2001, data={})
      @response = {fail: true, message: message, code: code}
      render :partial => 'api/v1/errors', layout: 'jsend', status: :ok, :formats => [:json]
    end

    def render_error(message, code=2000, data={})
      @response = {error: true, message: message, code: code}
      render :partial => 'api/v1/errors', layout: 'jsend', status: :ok, :formats => [:json]
    end


    rescue_from StandardError do |e|
      logger.info "SOME ERROR #{e}"
      error(e)
    end

    def routing_error
      raise ActionController::RoutingError.new(params[:path])
    end

    def not_found
      render_fail('Not Found', 404)
    end

    def exception
      render_error('Internal Server Error', 2000)
    end

    def error(e)
      if e.class.name == 'ActionController::RoutingError'
        render_fail('Not Found', 404, "#{e.class.name} : #{e.message}")
      elsif e.class.name == 'ActionController::ParameterMissing'
        render_fail('Bad Request - Parameter Missing',404, "#{e.class.name} : #{e.message}")
      else
        puts e.message
        render_error('Internal Server Error', 2000, "#{e.class.name} : #{e.message}")
      end
    end

    private
    def restrict_access_token
      unless restrict_access_by_api_token_header
        render_fail(t('text.invalid_api_key').titleize, 6)
      end
    end

    def store_location
      session[:return_to] = request.url
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def extract_authentication_from_header
      authlogic_params_key = :auth_key
      raw_header = request.headers['Authorization']
      if raw_header.index('auth_key=')
        auth_token = raw_header.slice(raw_header.index('auth_key=')+9..raw_header.size)
      end
      params[authlogic_params_key] = auth_token if auth_token
    end


    def restrict_access_by_api_token_header
      return true if @api_key
      token = nil

      #check for token
      if request.headers['ApiKey'] && request.headers['ApiKey'].include?('key=')
        tokens = request.headers['ApiKey'].split(',')
        tokens.each do |line|
          token = line.slice(line.index('key=')+4..line.size)
          break if token
        end
      end
      if token && token.size >0
        token == '8aWV5WE5CsFsv2oPwwQmVE7i'
      else
        false
      end

    end

  end
end