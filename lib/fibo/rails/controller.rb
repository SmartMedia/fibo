module Fibo
  module Rails
    module Controller
      def self.included(controller)
       controller.helper_method :facebook_permissions_dialog_url
      end

      def facebook_permissions_dialog_url
        [Fibo.oauth_dialog_url, {:client_id => Facebooker2.app_id, :redirect_uri => Fibo.canvas_page, :scope => Fibo.scope}.to_param].join('?').html_safe
      end

      def authenticate_facebook_user!
        render :partial => 'fibo/permissions' unless current_facebook_user
      end

    end
  end
end
