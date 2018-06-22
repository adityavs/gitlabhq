module QA
  module Page
    module Project
      class New < Page::Base
        view 'app/views/projects/_new_project_fields.html.haml' do
          element :project_namespace_select
          element :project_namespace_field, /select :namespace_id.*class: 'select2/
          element :project_path, 'text_field :path'
          element :project_description, 'text_area :description'
          element :project_create_button, "submit 'Create project'"
          element :visibility_level, 'label :visibility_level'
        end

        def choose_test_namespace(namespace)
          click_element :project_namespace_select

          find('ul.select2-result-sub > li', text: namespace || Runtime::Namespace.path).click
        end

        def choose_name(name)
          fill_in 'project_path', with: name
        end

        def add_description(description)
          fill_in 'project_description', with: description
        end

        def create_new_project
          click_on 'Create project'
        end

        def set_visibility(visibility)
          find('.option-title', text: visibility).click unless visibility == 'Private' # Private is selected by default
        end
      end
    end
  end
end
