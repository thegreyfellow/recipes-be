# frozen_string_literal: true

json.items @ingredients
json.pagination do
  json.count  @pagy.count
  json.items  @pagy.items
  json.last   @pagy.last
  json.next   @pagy.next
end
