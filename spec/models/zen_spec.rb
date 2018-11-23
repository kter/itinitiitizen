require 'rails_helper'
# describe, context, before, afterを使ってDRYにする

RSpec.describe Zen, type: :model do
  it "is invalid without content" do
    zen = Zen.new(
      content: nil,
      deleted: false
    )
    zen.valid?
    expect(zen.errors[:content]).to include("can't be blank")
  end

  it "is invalid without deleted flag" do
    zen = Zen.new(
      content: "test content 3",
      deleted: nil
    )
    zen.valid?
    expect(zen).to be_invalid
  end

  it "returns a content as a string" do
    zen = Zen.new(
      content: "test content 1",
      deleted: false
    )
    expect(zen.content).to be_a_kind_of(String)
  end

  it "is valid with content and true deleted flag" do
    zen = Zen.new(
      content: "test content 1",
      deleted: true
    )
    expect(zen).to be_valid
  end

  it "is valid with content and false deleted flag" do
    zen = Zen.new(
      content: "test content 2",
      deleted: false
    )
    expect(zen).to be_valid
  end

  it "is invalid with 250 over content" do
    zen = Zen.new(
      content: "あ" * 251,
      deleted: false
    )
    expect(zen).to be_invalid
  end
end
