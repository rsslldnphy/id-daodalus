module Daodalus

  module ModelDAO

    def self.included(base)
      base.extend(ClassDAO)
    end

    def save
      set(_id: dao.save(data.dup))
    end

    def dao
      self.class.dao
    end

    module ClassDAO

      attr_accessor :dao

      def remove_all
        dao.remove_all
      end

      def self.extended(base)
        base.dao = create_dao(base)
      end

      private

      def self.create_dao(base)
        Class.new do
          extend ::Daodalus::DAO
          target :default, base.name.underscore.pluralize

          def self.save(data)
            super
            data['_id'] = data[:_id]
            data.delete(:_id)
          end

        end

      end
    end
  end
end
