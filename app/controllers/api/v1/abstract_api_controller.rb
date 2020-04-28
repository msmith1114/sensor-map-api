module Api
    module V1
      class AbstractApiController < ApplicationController
        include JSONAPI::ActsAsResourceController

        # needed to make a create / update request, otherwise it fails with "Can't verify CSRF token authenticity"
        protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
      end
    end
  end
  