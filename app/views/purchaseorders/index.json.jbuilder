# frozen_string_literal: true

json.array! @purchaseorders, partial: 'purchaseorders/purchaseorder', as: :purchaseorder
