require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  fixtures :companies

  test "the company needs a name and description" do
    company = Company.new
    assert company.invalid?
    assert company.errors[:name].any?
    assert company.errors[:description].any?
    assert_equal "can't be blank", company.errors[:name].join(";")
    assert_equal "can't be blank", company.errors[:description].join(";")
  end

  test "duplicate company" do
    duplicate_origin = Company.new(:name => companies(:origin).name, :description => "duplicateah")
    assert !duplicate_origin.save
    assert duplicate_origin.errors[:name].any?
    assert_equal "has already been taken", duplicate_origin.errors[:name].join(";")

  end
end
