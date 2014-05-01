ActiveAdmin.register Post do
  menu :label => "Blog Posts"
  index do
    selectable_column
    id_column
    column :title
    column "Author", :admin_user
    column :category
    column :created_at
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
