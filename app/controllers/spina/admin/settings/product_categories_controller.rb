module Spina
  module Admin
    module Settings
      class ProductCategoriesController < ShopController
        before_action :set_breadcrumbs

        def index
          @product_categories = ProductCategory.all
        end

        def show
          @product_category = ProductCategory.find(params[:id])
          add_breadcrumb @product_category.name
        end

        def new
        end

        def edit
          @product_category = ProductCategory.find(params[:id])
          add_breadcrumb @product_category.name, [:admin, :settings, @product_category]
          add_breadcrumb t('spina.edit')
        end

        def create
        end

        def update
        end

        def destroy
        end

        private

          def set_breadcrumbs
            add_breadcrumb ProductCategory.model_name.human(count: 2), spina.admin_settings_product_categories_path
          end

      end
    end
  end
end