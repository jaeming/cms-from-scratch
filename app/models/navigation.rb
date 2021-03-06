class Navigation < ActiveRecord::Base

  default_scope {order(order: :asc) }


  def self.reorder_by_direction(prev, proposed)
    direction = (prev > proposed.to_i) ? (:desc) : (:asc)
    reorder_links(direction)
  end

  def self.reorder_links(direction)
    links = Navigation.all
    links.order(order: :asc, updated_at: direction).each_with_index do |nav, index|
      nav.order = index + 1
      nav.save!
    end
  end

end
