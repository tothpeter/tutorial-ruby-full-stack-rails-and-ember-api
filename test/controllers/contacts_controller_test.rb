require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { additional_info: @contact.additional_info, address: @contact.address, company_id: @contact.company_id, customer_id: @contact.customer_id, email: @contact.email, family_name: @contact.family_name, given_names: @contact.given_names, name: @contact.name, phone: @contact.phone, title: @contact.title, website: @contact.website } }
    end

    assert_response 201
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { additional_info: @contact.additional_info, address: @contact.address, company_id: @contact.company_id, customer_id: @contact.customer_id, email: @contact.email, family_name: @contact.family_name, given_names: @contact.given_names, name: @contact.name, phone: @contact.phone, title: @contact.title, website: @contact.website } }
    assert_response 200
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_response 204
  end
end
