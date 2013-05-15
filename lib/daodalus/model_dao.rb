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

      def dao
        @dao ||= create_dao
      end

      def remove_all
        dao.remove_all
      end

      private

      def create_dao
        Class.new do
          extend ::Daodalus::DAO
          target :default, self.class.name

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
