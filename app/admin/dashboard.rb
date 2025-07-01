# # frozen_string_literal: true
# ActiveAdmin.register_page "Dashboard" do
#   menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

#   content title: proc { I18n.t("active_admin.dashboard") } do
#     div class: "blank_slate_container", id: "dashboard_default_message" do
#       span class: "blank_slate" do
#         span I18n.t("active_admin.dashboard_welcome.welcome")
#         small I18n.t("active_admin.dashboard_welcome.call_to_action")
#       end
#     end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
#   end # content
# end
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Dashboard"

  content title: proc { "CRM Summary" } do
    columns do
      column do
        panel "Customer Stats" do
          para "Total Customers: #{Customer.count}"
          para "Customers with Email: #{Customer.where.not(email_address: [nil, '']).count}"
          para "Customers Missing Email: #{Customer.where(email_address: [nil, '']).count}"
        end
      end

      column do
        panel "Recently Added Customers" do
          ul do
            Customer.order(created_at: :desc).limit(5).map do |customer|
              li link_to customer.full_name, admin_customer_path(customer)
            end
          end
        end
      end
    end

    panel "Quick Actions" do
      ul do
        li link_to "All Customers", root_path
        li link_to "Alphabetized Customers", alphabetized_customers_path
        li link_to "Customers Missing Email", missing_email_customers_path
      end
    end
  end
end
