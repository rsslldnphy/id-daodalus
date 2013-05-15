module Daodalus
  module Model

    def self.included(base)
      base.send(:include, Id::Model)
      base.send(:include, Daodalus::ModelDAO)
    end

  end
end
