ActiveAdmin.register Page do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :slug, :header_title, :header_desc, :header_about, :scroll_text, :featured_img, :meta_title, :meta_desc, :meta_img, :footer, :components
  json_editor
  #
  # or
  #
  # permit_params do
  #   permitted = [:slug, :header_title, :header_desc, :header_about, :scroll_text, :featured_img, :meta_title, :meta_desc, :meta_img, :footer]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :slug
    column :meta_title
    column "Meta Description", :meta_desc
    column("Meta Image") do |item|
      image_tag "https://2036.emory.edu/images/#{item.meta_img}", class: 'meta-image'
    end
    column("Title") do |item|
      item.header_title.html_safe
    end
    column "Description", :header_desc
    column "About", :header_about
    column("Featured Image") do |item|
      image_tag "https://2036.emory.edu/images/#{item.featured_img}", class: 'meta-image'
    end
    actions
  end

  show title: :meta_title do
    attributes_table do
      row :slug
      row :meta_title
      row "Meta Description" do |item|
        item.meta_desc
      end
      row "Meta Image" do |item|
        image_tag "https://2036.emory.edu/images/#{item.meta_img}", class: 'meta-image-detail'
      end
      row "Title" do |item|
        item.header_title.html_safe
      end
      row "Description" do |item|
        item.header_desc
      end
      row "About" do |item|
        item.header_about
      end
      row "Featured Image" do |item|
        image_tag "https://2036.emory.edu/images/#{item.featured_img}", class: 'meta-image-detail'
      end
      row "Components" do |item|
        render('components', :data => item.components)
      end
      row "Footer" do |item|
        render('footer', :data => item.footer)
      end
    end
  end

  form title: :meta_title do |f|
    text_node javascript_include_tag "page_edit.js"
    text_node stylesheet_link_tag "page_edit.css"
    inputs 'Details' do
      input :slug
      input :meta_title, label: "Meta Title"
      input :meta_desc, label: "Meta Description"
      input :meta_img, label: "Meta Image"
      input :header_title, as: :quill_editor, label: "Title"
      input :header_desc, label: "Description"
      input :header_about, label: "About"
      input :featured_img, label: "Featured Image"
      input :components, as: :jsonb
      input :footer, as: :jsonb
    end
    # panel 'Components' do
    #   render 'components', { data: f.object.components, type: 'edit' }
    # end
    para "Press cancel to return to the list without saving."
    actions
  end
end
