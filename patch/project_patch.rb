module ProjectAuthorsPlugin
  module ProjectPatch

    def self.included(base)
      base.include(InstanceMethods)
      base.extend(ClassMethods)

      base.class_eval do
        belongs_to :user

        safe_attributes(
          'author_id')

      end
    end

    module InstanceMethods

      def author
        User.find(self.author_id)
      end


    end

    module ClassMethods
      # Project.last_author
      def last_author

      end
    end

  end
end
