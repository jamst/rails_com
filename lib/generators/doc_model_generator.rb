# 生成模型
#require 'rails/generators'
module Doc
  class DocModelGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def create_controller_files
      check_model_exist?

      template 'model.erb', File.join('doc/api', "#{file_name}_model.md")
    end

    def check_model_exist?
      Rails.application.eager_load!  # 主动require 模型的定义
      unless self.class.const_defined? model_name
        abort "模型:#{model_name}没有定义"
      end
    end

    def model_name
      @model_name = file_name.classify
    end

    def model_class
      @model_class = model_name.constantize
    end


    protected


    def assign_model_name!(name)

    end

  end
end