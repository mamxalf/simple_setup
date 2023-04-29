# frozen_string_literal: true

class Abstracts::UseCase
  include Dry::Monads[:result]
  include Pagy::Backend

  def paginate!(pagy, _response, count: nil)
    pages = {
      offset: pagy.page,
      total:  (count.presence || pagy.count),
      limit:  pagy.items
    }

    Abstracts::Pagination.new(pages)
  end
end
