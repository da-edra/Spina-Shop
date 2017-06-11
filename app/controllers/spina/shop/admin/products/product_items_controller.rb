module Spina::Shop
  module Admin
    module Products
      class ProductItemsController < AdminController
        before_action :set_product
        before_action :set_breadcrumbs
        before_action :set_locale

        def new
          @product_item = @product.product_items.build
          add_breadcrumb t('spina.shop.product_items.new')
          @product_category = @product.product_category
        end

        def create
          @product_item = @product.product_items.build(product_item_params)
          if @product_item.save
            redirect_to spina.edit_shop_admin_product_product_item_path(@product, @product_item, params: {locale: @locale})
          else
            render :new
          end
        end

        def edit
          @product_item = @product.product_items.find(params[:id])
          add_breadcrumb @product_item.name
          @product_category = @product.product_category
        end

        def update
          @product_item = @product.product_items.find(params[:id])
          if @product_item.update_attributes(product_item_params)
            redirect_to spina.edit_shop_admin_product_product_item_path(@product, @product_item, params: {locale: @locale})
          else
            render :edit
          end
        end

        private

          def set_product
            @product = Product.find_by(materialized_path: params[:product_id])
          end

          def product_item_params
            params.require(:product_item).permit!
          end

          def set_breadcrumbs
            add_breadcrumb Product.model_name.human(count: 2), spina.shop_admin_products_path
            add_breadcrumb @product.name, spina.shop_admin_product_path(@product)
          end

          def set_locale
            @locale = params[:locale] || I18n.default_locale
          end

      end
    end
  end
end