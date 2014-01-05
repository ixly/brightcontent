module Brightcontent
  module Pages
    module Methods
      def current_page
        @current_page ||= Page.find_by_path!(request.path)
      end
    end
  end
end
